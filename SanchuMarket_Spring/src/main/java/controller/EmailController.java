package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.MailService;

@Controller
public class EmailController {

	@Autowired
	MailService mailService;


	//DB작업이 필요한 만큼 DAO들 선언해야함
	
	//아이디와 이메일이 같으면 특정한 메일이 가게..
	@RequestMapping("/noticeMail.do")
	public String sendEmail(String id, String email, Model model) {
		
		String addr = "dkwlsdl8@google.com";
		
		String subject = "비밀번호 찾기 메일";
		
		String body = "";
		
		mailService.sendEmail(email, addr, subject, body);
		
		return "";
	}
}
