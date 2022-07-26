package interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class VisitCookieInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	 
	@Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
		
			int cookieCnt;
			
			Cookie [] visitCookieArr = request.getCookies();
			Cookie visitCookie = null;
			
			//브라우저에서 전달된 모든 쿠키를 검사하고
			if(visitCookieArr != null) {
				for(int i=0; i<visitCookieArr.length; i++) {
					//그 중 방문자수에 필요한 쿠키만 추출해서 저장한다.
					visitCookie = visitCookieArr[i];
					break;
				}
			}
		
		 
	        return super.preHandle(request, response, handler);
	        
	    }
}
