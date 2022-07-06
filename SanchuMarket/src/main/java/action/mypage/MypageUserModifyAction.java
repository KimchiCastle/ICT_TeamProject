package action.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user.UserDao;
import vo.user.UserVo;

/**
 * Servlet implementation class UserinfoModifyAction
 */
@WebServlet("/mypage/modify.do")
public class MypageUserModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		//1.수신인코딩
				request.setCharacterEncoding("utf-8");
				
				//2.parameter받기
				int u_idx			=	Integer.parseInt(request.getParameter("u_idx"));
				String u_name		=	request.getParameter("u_name");
				String u_id			=	request.getParameter("u_id");
				String u_pwd		=	request.getParameter("u_pwd");
				String u_zipcode	=	request.getParameter("u_zipcode");
				String u_addr		=	request.getParameter("u_addr");
				String u_profile		= 	request.getParameter("u_profile");
				String u_photo		= 	request.getParameter("u_photo");
				
				//3.UserVo 포장
				UserVo vo = new UserVo(u_idx,u_name,u_id,u_pwd,u_zipcode,u_addr,u_profile,u_photo);

				//5.DB update
				int res = UserDao.getInstance().update(vo);
				
				//6.목록보기
				response.sendRedirect("mypage/list.do");

	}

}

