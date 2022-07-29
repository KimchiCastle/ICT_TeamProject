package controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	 
	 AdminDao admin_dao;
	 
	 public void setAdmin_dao(AdminDao admin_dao) {
		this.admin_dao = admin_dao;
	}
	 
	AdminService adminService;

	 public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("main_form.do")
	 public String list(Model model) {
		 
		
		Map serviceMap = adminService.list();
		
		
		model.addAttribute("serviceMap", serviceMap);
		
		 return "admin/mainpage_admin";
	 }
	//유저관리
	@RequestMapping("user_listForm.do")
	public String userList() {
		
		return "admin/user_list";
	}
	
		
	
	 
	 
	
	
}
