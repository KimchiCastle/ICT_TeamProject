package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AdminDao;
import service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	 @Autowired 
	 ServletContext application;
	  
	 @Autowired 
	 HttpSession session;
		  
	 @Autowired 
	 HttpServletRequest request;
	 
	 AdminService adminService;

	 public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("main_form.do")
	 public String list() {
		 
		 //쿠키받을때 request
		//메인페이지에서 형성된 쿠키수만큼의 list길이 기 형성
			/*
			 * Cookie[] list = request.getCookies();
			 * 
			 * int visitCookieCnt = 0;
			 * 
			 * for(int i = 0; list != null && i < list.length; i++) {
			 * if(list[i].getName().equals("visitCookie")) { visitCookieCnt =
			 * Integer.parseInt(list[i].getValue()); break; } }
			 */
			
		 return "admin/mainpage_admin";
	 }
	 
	 
	
	
}
