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
	 	
	 	UserVo userVo;
	 	
		try {
			userVo = (UserVo)session.getAttribute("user");
			
			System.out.println(userVo.getU_grade());
			if((userVo==null) || !userVo.getU_grade().equals("°ü¸®ÀÚ")) {
		 		response.sendRedirect("../user/login_form.do?reason=onlyadmin");
		 		return false;
		 	}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	 	return super.preHandle(request, response, handler);
	        
	    }

}
