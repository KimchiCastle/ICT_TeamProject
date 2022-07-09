package action.user;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.user.UserDao;
import vo.user.UserVo;

/**
 * Servlet implementation class LoginCheckAction
 */
@WebServlet("/user/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String u_id = request.getParameter("u_id");
		String u_pwd = request.getParameter("u_pwd");

		UserVo vo = new UserVo(); 
		vo.setU_id(u_id);
		vo.setU_pwd(u_pwd);
		
		UserVo user =  UserDao.getInstance().selectOneById(u_id);
		
		boolean bResult = false;
		
		if(user==null) {
			bResult = false;
			response.setContentType("text; charset=utf-8");
			response.getWriter().print(bResult);
			return;
		}
		if(!u_pwd.equals(user.getU_pwd())) {
			System.out.println("비번 틀림");
			bResult = false;
			response.setContentType("text; charset=utf-8");
			response.getWriter().print(bResult);
			return;
		}
		
			HttpSession session = request.getSession();
			session.setAttribute("user", user );
			bResult = true;
		
		response.setContentType("text; charset=utf-8");
		response.getWriter().print(bResult);
	}
}