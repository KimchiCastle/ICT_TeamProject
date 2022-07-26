package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		
		System.out.println(seller_u_idx);
		System.out.println(buyer_u_idx);
		System.out.println(p_idx);

		
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
		UserVo sellerVo = user_dao.selectOneByIdx(seller_u_idx);
		UserVo buyerVo = user_dao.selectOneByIdx(buyer_u_idx);
		
		String seller = sellerVo.getU_nickname();
		String buyer = buyerVo.getU_nickname();
		
		TradeVo tradeVo = new TradeVo(p_idx, seller, buyer, p_status);
		
		int res2 = trade_dao.tradeInsert(tradeVo);
		
		
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
	 
	 
}
