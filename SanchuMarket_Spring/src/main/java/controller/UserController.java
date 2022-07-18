package controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	//아이디찾기 
	/*
	 * @RequestMapping("find_id.do") public String findIdForm() {
	 * 
	 * return "user/find_id"; }
	 */
	
	//비밀번호찾기
	@RequestMapping("count_emailId.do")
	@ResponseBody
	public Map countEmailId(@RequestParam("id") String u_id, 
					   @RequestParam("email") String u_email) {
		
		UserVo vo;
		vo.setU_id(u_id);
		vo.setU_mail(u_email);
		
		int count = user_dao.countForFindPwd(vo);
		
		Map map = new HashMap();
		
		if(count==0) {
			map.put("result","noExist");
			return map;
		}else if(count!=0) {
			b = true;
			String setfrom = "hwangjeongyong4@gmail.com	";
			String tomail = (String) map.get("g_mail"); // 받는 사람 이메일
			String title = "BOM AIR 비밀번호 찾기 기능 입니다."; // 제목
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				String text = "고객님의 비밀번호는 " + (String) map.get("g_pwd");
				messageHelper.setText(text, true);
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}

		}
		
		boolean b = false;
		
		if (map.size() != 0) {
			
		}
	
	return b;
}
	
	
	
	
}
