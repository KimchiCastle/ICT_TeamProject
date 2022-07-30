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
		 	
			UserVo user = (UserVo) request.getSession().getAttribute("user");

			if ((user == null)) {
				response.sendRedirect("../user/login_form.do?reason=fail");
				return false;
			}
			
			//요청한 파라미터 읽어오기
			String uri = request.getRequestURI();
			
			//어드민페이지 접근시
			if(uri.contains("admin")) {
				
				// 회원 등급 알아오기
				String u_grade = (String) user.getU_grade();
				
				// 관리자가 아닐때
				if (!u_grade.equals("관리자")) {
					
					response.sendRedirect("../mainpage/list.do?reason=fail");
					
				}
				
			}else if(uri.contains("mypage")) {
				
				// 세션에서 받아온 u_idx
				int u_idx = user.getU_idx();
				
				// 파라미터에 입력된 u_idx
				int param_u_idx = Integer.parseInt(request.getParameter("u_idx"));
				
				//회원이 다른회원의 정보를 접근하려 할때!
				if(u_idx!=param_u_idx) {
					response.sendRedirect("../mainpage/list.do?reason=fail");
				}
				
				
			}
			

			return super.preHandle(request, response, handler);
		}

}
