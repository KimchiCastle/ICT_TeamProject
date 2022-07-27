package interceptor;

import javax.servlet.RequestDispatcher;
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
		 	
	 		UserVo user;
	 		
			try {
				user = (UserVo)request.getSession().getAttribute("user");

				String u_grade = (String)user.getU_grade();
			 	
				if((user==null) || !u_grade.equals("°ü¸®ÀÚ")) {
			 		response.sendRedirect("../user/login_form.do?reason=onlyadmin");
			 		return false;
			 	}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				response.sendRedirect("../user/login_form.do?reason=session_timeout");
				return false;
			}
		
	        
			return super.preHandle(request, response, handler);
	 }

}
