package action.user_action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import vo.UserVo;

/**
 * Servlet implementation class LoginCheckAction
 */
@WebServlet("/user/login_check.do")
public class LoginCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub


		String u_id = request.getParameter("u_id");
		String u_pwd = request.getParameter("u_pwd");
		
		UserVo user =  UserDao.getInstance().selectOneById(u_id);
		
		boolean bResult = (user==null || !u_pwd.equals(user.getU_pwd()));
		
				
		response.setContentType("text; charset=utf-8");
		response.getWriter().print(bResult);

	}

}
