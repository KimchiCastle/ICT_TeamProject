package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import vo.UserVo;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//특수문자 들어와도 인코딩 해야함 

		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		
		UserVo user = null;
		
		//session tracking 1.
		if(user==null) {
			
			response.sendRedirect("login_form.do?reason=fail_id");
			return;
		}
		
		//session tracking 2.
		//dao로 가져온 user정보는 vo형이므로 getter씀
		if(user.getU_pwd().equals(m_pwd)==false){
			
		  //비번만 틀렸을때 id는 로그인창에 남기기 위해 parameter로넘겨줌
			response.sendRedirect("login_form.do?reason=fail_pwd&m_id="+m_id);
			return;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user );
		
		//경로 지정 주의
		response.sendRedirect("../photo/list.do");
	}

}
