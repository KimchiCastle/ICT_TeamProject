package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import vo.UserVo;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	 
	@Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
		 	
	 	HttpSession session = request.getSession();
	 	UserVo user = (UserVo)session.getAttribute("user");
	 	
	 	if (user != null) {
	 		
	 		if(user.getU_grade() == "관리자") {
	 			
	 			return true;
	 		}
        }
        // 여기까지 내려왔다면 세션에 user 속성값이 없다는 뜻이므로 로그인 화면으로 리다이렉트 !
        response.sendRedirect(request.getContextPath() + "/login");
        return false;
		 	
	        
	    }

}
