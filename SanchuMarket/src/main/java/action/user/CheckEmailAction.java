package action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user.UserDao;
import vo.user.UserVo;

/**
 * Servlet implementation class CheckEmailAction
 */
@WebServlet("/user/check_email.do")
public class CheckEmailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");

		String u_mail = request.getParameter("u_mail");
		
		UserVo vo =  UserDao.getInstance().selectOneByEmail(u_mail);
		
		String result = "";
		
		//아이디 존재하지 않을때 가입 가능
		if(vo==null) {
			result = "Y";
		}else {
			result = "N";
		}
		
		response.setContentType("text; charset=utf-8");
		response.getWriter().print(result);

	}

}
