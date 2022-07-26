package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	 
	@Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
		 	
		//로그인 세션 관리
		//session의 false : session이 존재하지 않는다면 null반환(비회원에 session주입되지 않게)
	 	HttpSession session = request.getSession(false);
	 	
	 	if (session != null) {
	 		
            Object obj = session.getAttribute("user"); // 세션에 있는 user 속성값을 가져온다.
            if (obj != null) return true; // 세션에 user 속성값이 있다면 true를 리턴해 컨트롤러의 로직을 정상 실행.
        }
        // 여기까지 내려왔다면 세션에 user 속성값이 없다는 뜻이므로 로그인 화면으로 리다이렉트 !
        response.sendRedirect(request.getContextPath() + "/login");
        return false;
		 	
	        
	    }

}
