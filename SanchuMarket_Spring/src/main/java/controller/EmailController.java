package controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDao;
import vo.AuthVo;
import vo.UserVo;


@Controller
@RequestMapping("/user/")
public class EmailController {

	 JavaMailSender mailSender;
 
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	UserDao user_dao;

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}

	@RequestMapping("sendEmail.do")
	@ResponseBody
	public Map sendEmail(String email) {
		
		boolean bSuccess = false;
		
		UserVo vo = user_dao.selectOneByEmail(email);
		
		if(vo != null) {
				
				Random r = new Random();
				
				StringBuffer sb = new StringBuffer();
				
				for(int i=0; i<10; i++) {
					//랜덤으로 boolean을 줘서 무작위로 영문자와 숫자를 생성.
					r.nextBoolean();
					
					//소문자
					if(r.nextBoolean()==true) {
						sb.append((char)((int)(r.nextInt(26))+97));
					}
					//숫자
					else {
						sb.append(r.nextInt(10));
					}
				} 	
				
				String tempPwd = sb.toString();
				AuthVo authVo = new AuthVo();
				String hostMail = authVo.getHostMail();
				String userMail = email; //받는사람
				
			try {
					StringBuilder stb = new StringBuilder();
					stb.append(String.format("%s님의 임시 비밀번호는",vo.getU_name()));
					stb.append(String.format(" %s입니다", tempPwd));
					
					SimpleMailMessage message = new SimpleMailMessage();

					message.setFrom(hostMail);
					message.setTo(email);
					message.setSubject("[상추마켓] 임시 비밀번호 메일입니다.");
					message.setText(stb.toString());
					
					mailSender.send(message);
					
					vo.setU_pwd(tempPwd);
					
					int res = user_dao.updatePwd(vo);
					
					bSuccess = true;
				   
				} catch (Exception e) {
					e.printStackTrace();
				} 
		}
		
		Map map = new HashMap();
		map.put("result", bSuccess); 
		return map;
	}
	
}
