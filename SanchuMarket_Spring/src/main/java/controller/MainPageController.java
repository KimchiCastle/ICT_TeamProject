package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mainpage/")
public class MainPageController {
	
	 @Autowired 
	 ServletContext application;
	  
	 @Autowired 
	 HttpSession session;
		  
	 @Autowired 
	 HttpServletRequest request;

	
	 @RequestMapping("list.do")
	 public String list() {
		 
		 String visitCookie = "";
		 String visitCookieCnt = "";
		 
		 Cookie cookie = new Cookie("visitCookie", "visitCookieCnt");
		 Response.
		 
		 
		 //admin 陛老 规巩荐 cookie积己
		
		
		return "admin/mainpage_list";
	 }	
	 
}
