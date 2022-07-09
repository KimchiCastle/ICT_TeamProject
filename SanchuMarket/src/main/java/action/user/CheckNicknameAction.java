package action.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.user.UserDao;
import vo.user.UserVo;

/**
 * Servlet implementation class CheckNicknameAction
 */
@WebServlet("/user/check_nickname.do")
public class CheckNicknameAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String u_nickname = request.getParameter("u_nickname");
		
		UserVo vo = UserDao.getInstance().selectOneByNickname(u_nickname);
		
		String result = "";
		
		//닉네임 존재하지 않을때 가입 가능
		if(vo==null) {
			result = "Y";
		}
		
		response.setContentType("text; charset=utf-8");
		response.getWriter().print(result);
	}

}
