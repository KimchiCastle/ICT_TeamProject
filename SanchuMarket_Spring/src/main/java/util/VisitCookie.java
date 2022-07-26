package util;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import dao.VisitDao;
import vo.VisitVo;

public class VisitCookie {
	

	public static Cookie getVisitCookie(HttpServletRequest request, HttpServletResponse response, VisitDao visit_dao) {

		
	//--------------------1.cookie할당--------------------------
	Cookie [] cookieArr = request.getCookies();
	Cookie visitCookie = null;
	int cookieCnt;
	String cookieStr;
	
	//특정 유저의 브라우저에서 전달된 모든 쿠키를 확인하고
	if(cookieArr != null) {
		for(int i=0; i < cookieArr.length; i++) {
			//그 중 방문자수 쿠키만 추출에서 visitCookie에 넣는다.
			if(cookieArr[i].getName().equals("visitCookie")) {
				
				visitCookie = cookieArr[i];
				break;
			}
		}
	}
	
	//위 식을 통과하여 클라이언트가 visitCookie를 갖고 있다면 기존 cookie에 value증가
	if(visitCookie != null) {
		cookieCnt = Integer.parseInt(visitCookie.getValue());
		cookieCnt++;
		cookieStr = Integer.toString(cookieCnt);
		visitCookie.setValue(cookieStr);
	}
	//visitCookie없다면 새로 생성
	else {
		visitCookie = new Cookie("visitCookie","1");
	}

	
	return visitCookie;

	}
	
}
