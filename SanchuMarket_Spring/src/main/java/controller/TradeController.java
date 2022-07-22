package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.trade.TradeDao;

@Controller
@RequestMapping("/trade/")
public class TradeController {

	 @Autowired 
	 ServletContext application;
	  
	 @Autowired 
	 HttpSession session;
		  
	 @Autowired 
	 HttpServletRequest request;
	 
	 TradeDao trade_dao;

	public void setTrade_dao(TradeDao trade_dao) {
		this.trade_dao = trade_dao;
	}


	 
	 
}
