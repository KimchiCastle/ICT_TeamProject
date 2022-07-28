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
			 	
				if((user==null) || !u_grade.equals("관리자")) {
			 		response.sendRedirect("../user/login_form.do");
			 		return false;
			 	}
				//session이 없을때 user라는 세션이 만들어지다가 오류 발생...
			} catch (Exception e) {
				// TODO Auto-generated catch block
				response.sendRedirect("../user/login_form.do");
				return false;
			}
		
	        
			return super.preHandle(request, response, handler);
	 }

}
