package action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.user.UserDao;
import vo.user.UserVo;

/**
 * Servlet implementation class WithdrawalAction
 */
@WebServlet("/user/withdraw.do")
public class WithdrawalAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		HttpSession session = request.getSession();
		
		UserVo user = (UserVo)session.getAttribute("user");
		String u_id = user.getU_id();
		UserDao.getInstance().delete(u_id);
	
		session.invalidate(); 

		response.sendRedirect("../mainpage/list.do");
		
	}

}