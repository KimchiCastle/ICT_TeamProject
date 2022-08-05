package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ProductDao;
import dao.TradeDao;
import dao.UserDao;
import vo.ProductVo;
import vo.TradeVo;
import vo.UserVo;

@Controller
@RequestMapping("/product/")
public class TradeController {

	 @Autowired 
	 ServletContext application;
	  
	 @Autowired 
	 HttpSession session;
		  
	 @Autowired 
	 HttpServletRequest request;
	 
	 TradeDao trade_dao;
	 ProductDao product_dao;
	 UserDao user_dao;

	 
	 
	public TradeController(TradeDao trade_dao, ProductDao product_dao, UserDao user_dao) {
		super();
		this.trade_dao = trade_dao;
		this.product_dao = product_dao;
		this.user_dao = user_dao;
	}

	
	@RequestMapping("trade.do")
	@ResponseBody
	public Map tradeStart(
			int seller_u_idx,
			int	buyer_u_idx,	
			int p_idx) {
		
		//	ajax 리턴용 Map 생성
		Map resultmap = new HashMap();
		
		int result = 0;
		
		UserVo sellerVo = user_dao.selectOneByIdx(seller_u_idx);
		UserVo buyerVo = user_dao.selectOneByIdx(buyer_u_idx);
		
		//판매자의 회원 상태 확인
		
		if(sellerVo.getU_status().equals("정지") || sellerVo.getU_status().equals("탈퇴")) {
			
			result = 2;
			
			resultmap.put("result", result);
			
			return resultmap;
			
		}
		
		
		//p_idx로 해당 상품 p_status '거래중'으로 변경하기
		Map updateMap = new HashMap();
		
		String p_status = "거래중";
		
		updateMap.put("p_idx", p_idx);
		updateMap.put("p_status", p_status);
		
		int res = product_dao.statusUpdate(updateMap);
		 
		/*
			받아온 u_idx들로 판매자, 구매자 닉네임 가지고 오기
			거래 테이블에 넣기(상품상태추가했음)
		 */
		
		String seller = sellerVo.getU_nickname();
		String buyer = buyerVo.getU_nickname();
		
		TradeVo tradeVo = new TradeVo(p_idx, seller, buyer, p_status);
		
		int res2 = trade_dao.tradeInsert(tradeVo);
		
		
		
		if(res==1 && res2==1) {
			result = 1;
			
			resultmap.put("result", result);
			
		}else {
			
			resultmap.put("result", result);
			
		}
		
		
		return resultmap;
	}
	 
	
	
	
	@RequestMapping("product_sell.do")
	@ResponseBody
	public Map product_sell(int p_idx) {
		
		//p_idx로 해당 상품 p_status '판매완료'로 변경하기
		Map updateMap = new HashMap();
		
		String p_status = "판매완료";
		
		updateMap.put("p_idx", p_idx);
		updateMap.put("p_status", p_status);
		
		//상품 테이블 업데이트
		int res = product_dao.statusUpdate(updateMap);
		
		//거래 테이블 업데이트
		int res2 = trade_dao.statusUpdate(updateMap);
		
		//	ajax 리턴용 Map 생성
		Map resultmap = new HashMap();
		
		boolean result = false;
		
		if(res==1 && res2==1) {
			result = true;
			
			resultmap.put("result", result);
			
		}else {
			
			resultmap.put("result", result);
			
		}
		
		return resultmap;
	}
	
	
	
	
	@RequestMapping("tradeCheck.do")
	@ResponseBody
	public Map tradeCheck(int p_idx, 
			@RequestParam(value="u_idx", required=false, defaultValue="0") int u_idx) {
		
		Map map = new HashMap();
		
		boolean result = false;

		if(u_idx==0) {
			map.put("result", result);
			
			return map;
		}
		
		//파라미터로 받아온 u_idx로 회원정보 가지고오기
		UserVo uservo = user_dao.selectOneByIdx(u_idx);
		
		//거래 테이블 조회용 map 선언
		Map selectMap = new HashMap();
		selectMap.put("buyer", uservo.getU_nickname());
		selectMap.put("p_idx", p_idx);
		
		//거래테이블 조회
		TradeVo tradeVo = trade_dao.select_user(selectMap);
		
		result = (tradeVo!=null);
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("tradeCancel.do")
	@ResponseBody
	public Map tradeCancel(int p_idx) {
		
		
		int res = trade_dao.delete(p_idx);
		
		Map map = new HashMap();
		
		boolean result = (res==1);
		
		map.put("result", result);
		
		//거래테이블이 삭제가 완료되면..
		if(result) {
			
			Map map2 = new HashMap();
			
			map2.put("p_idx", p_idx);
			map2.put("p_status", "거래가능");
			
			int res2 = product_dao.statusUpdate(map2);
		}
		
		return map;
		
	}
}
