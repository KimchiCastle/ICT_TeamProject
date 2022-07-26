package util;

import java.net.http.HttpRequest;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;

import dao.VisitDao;
import vo.VisitVo;

public class VisitCookie {
	
	@Autowired
	HttpRequest request;
	
	VisitDao visit_dao;
	
	public void setVisit_dao(VisitDao visit_dao) {
		this.visit_dao = visit_dao;
	}
	
	public static Cookie getVisitCookie() {

	//--------------------1.cookie할당--------------------------
	Cookie [] visitCookieArr = request.getCookies();
	Cookie visitCookie = null;
	int cookieCnt;
	String cookieStr;
	
	//특정 유저의 브라우저에서 전달된 모든 쿠키를 확인하고
	if(visitCookieArr != null) {
		for(int i=0; i < visitCookieArr.length; i++) {
			//그 중 방문자수 쿠키만 추출에서 visitCookie에 넣는다.
			if(visitCookieArr[i].getName().equals("visitCookie")) {
				
				visitCookie = visitCookieArr[i];
				break;
			}
		}
	}
	
	//이 클라이언트가 visitCookie를 갖고 있다면 기존 cookie에 value증가
	if(visitCookie != null) {
		cookieCnt = Integer.parseInt(visitCookie.getValue());
		cookieCnt++;
		cookieStr = Integer.toString(cookieCnt);
		visitCookie.setValue(cookieStr);
	}
	
	//visitCookie가 없다면 새로운 visitCookie 할당	
	else {
		visitCookie = new Cookie("visitCookie","1");
	}
	
	//쿠키 할당
	response.addCookie(visitCookie);
	
	//-----------------2.cookie를 기반으로 visitDB 관리----------------------
	
	//DB의 금일 방문자 유무 조회
	VisitVo visitVo = visit_dao.todayVisitSelect();
	
	//DB의 금일 방문자가 0이면 방문자수 default 1로 visitDB record생성
	if(visitVo == null) {
		
		visit_dao.todayVisitInsert();
	}
	//금일 방문자가 1명 이상이면 visitDB update
	else {
		
		if(Integer.parseInt(visitCookie.getValue()) == 1) {
			
			int todayVisitCount = visitVo.getV_count();
			
			int res = visit_dao.todayVisitUpdate(++todayVisitCount);
		}
	}
	
	}
	
}
