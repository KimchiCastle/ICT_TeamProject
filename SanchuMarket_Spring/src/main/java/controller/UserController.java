package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.user.UserDao;
import vo.user.UserVo;

@Controller
@RequestMapping("/user/")
public class UserController {

	 @Autowired 
	 ServletContext application;
	  
	 @Autowired 
	 HttpSession session;
		  
	 @Autowired 
	 HttpServletRequest request;
	 
	 
	 
	UserDao user_dao;

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}
	
	

	@RequestMapping("check_email.do")
	@ResponseBody
	public Map checkEmail(String u_mail) {
		
		UserVo vo =  user_dao.selectOneByEmail(u_mail);
		
		String result = "";
		
		//아이디 존재하지 않을때 가입 가능
		if(vo==null) {
			result = "Y";
		}else {
			result = "N";
		}
		
		Map map = new HashMap();
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("check_id.do")
	@ResponseBody
	public Map checkId(String u_id) {
		
		
		UserVo vo =  user_dao.selectOneById(u_id);
		
		String result = "";
		
		//아이디 존재하지 않을때 가입 가능
		if(vo==null) {
			result = "Y";
		}else {
			result = "N";
		}
		
		System.out.println(result);
		Map map = new HashMap();
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("check_nickname.do")
	@ResponseBody
	public Map checkNickname(String u_nickname) {
		
		UserVo vo = user_dao.selectOneByNickname(u_nickname);
			
		String result = "";
		
		//닉네임 존재하지 않을때 가입 가능
		if(vo==null) {
			result = "Y";
		}else {
			result = "N";
		}
		
		Map map = new HashMap();
		
		map.put("result", result);
		
		return map;
	}
	
	
	@RequestMapping("enroll.do")
	public String enroll(String detail, String address, UserVo vo, Model model) {

		  String u_ip = request.getRemoteAddr();
		  
		  //u_addr = 기본 주소 + 상세 주소 
		  StringBuilder sb = new StringBuilder();
		  sb.append(address).append(" ").append(detail);
		  String u_addr = sb.toString();
		  
		  vo.setU_ip(u_ip);
		 
		  int res = user_dao.insert(vo);
		  
		  if(res==0) {
			model.addAttribute("reason","failed_enroll");
			return "user/enroll_form.do";
		  }
		  
		  return "redirect:../mainpage/list.do";
	}
	
	
	@RequestMapping("enroll_form.do")
	public String enrollForm() {
		
		return "user/enroll_form";
	}
	
	
	@RequestMapping("login.do")
	@ResponseBody
	public Map login(UserVo vo) {
		
		String u_id = vo.getU_id();
		String u_pwd = vo.getU_pwd();
		
		UserVo user =  user_dao.selectOneById(u_id);
		
		boolean bResult = false;
		
		/*
		 * if(user==null) { bResult = false; }
		 * 
		 * if(!u_pwd.equals(user.getU_pwd())) {  bResult = false; }
		 */
		
		if(user==null || !u_pwd.equals(user.getU_pwd())) {
			System.out.println("비번이나 아이디 틀림");
			bResult = false;
		}else {
			System.out.println("로그인성공");
			HttpSession session = request.getSession();
			session.setAttribute("user", user );
			bResult = true;
		}
			
		Map map = new HashMap();
		
		map.put("bResult", bResult);
		
		return map;
	}
	
	@RequestMapping("login_form.do")
	public String loginForm() {
		
		return "user/login_form";
	}
	
	
}
