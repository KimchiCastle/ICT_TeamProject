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
import vo.ProductVo;

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


	public TradeController(TradeDao trade_dao, ProductDao product_dao) {
		super();
		this.trade_dao = trade_dao;
		this.product_dao = product_dao;
	}


	@RequestMapping("trade.do")
	@ResponseBody
	public Map tradeStart(
			int seller_u_idx,
			int	buyer_u_idx,	
			int p_idx) {
		
		
//		System.out.println(seller_u_idx);
//		System.out.println(buyer_u_idx);
//		System.out.println(p_idx);

		
		//p_idx로 해당 상품 p_status '거래중'으로 변경하기
		Map updateMap = new HashMap();
		
		updateMap.put("p_idx", p_idx);
		updateMap.put("p_status", "거래중");
		
		 int res = product_dao.statusUpdate(updateMap);
		
		/*
			받아온 u_idx들로 판매자, 구매자 id 가지고 오기
			거래 테이블에 넣기(상품상태추가했음)
		 */
		
		
		
		
		
		
		
		return null;
	}
	 
	 
}
