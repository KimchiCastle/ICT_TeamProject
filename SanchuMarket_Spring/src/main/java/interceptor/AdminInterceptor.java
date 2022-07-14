package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
		 
		 	HttpSession session = request.getSession();
		 	
		 	//기존의 로그인 정보 제거
		 	if(session.getAttribute("user") != null) {
		 		
		 	}
	        
	        return true;
	    }
}
