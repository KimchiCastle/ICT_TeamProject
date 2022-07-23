package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vo.UserVo;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext applicaton;

	public MypageController() {
		super();
	}
	
	@RequestMapping("list.do")
	public String list(Model model) {
		
		//로그인 정보 읽어오기
		UserVo u_idx = (UserVo) session.getAttribute("u_idx");
		
		return"mypage_main";
	}
	

}
