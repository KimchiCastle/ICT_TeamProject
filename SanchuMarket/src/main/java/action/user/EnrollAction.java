package action.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
 * Servlet implementation class EnrollAction
 */
@WebServlet("/user/enroll.do")
public class EnrollAction extends HttpServlet {
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
		  String u_name = request.getParameter("u_name");
		  String u_nickname = request.getParameter("u_nickname");
		  String u_birth = request.getParameter("birth");
		  String u_addr = request.getParameter("addr");
		  int postcode = Integer.parseInt(request.getParameter("postcode"));
		  int u_like = Integer.parseInt(request.getParameter("u_like"));
		  String u_profile = request.getParameter("u_profile");
		  String u_photo = request.getParameter("u_photo");
		  String u_tel = request.getParameter("u_tel");
		  String u_mail = request.getParameter("u_mail");
		  String u_grade = request.getParameter("u_grade");
		  String u_ip = request.getRemoteAddr();
		  
		 
		  UserVo vo = new UserVo(u_id, u_pwd, u_name, u_nickname, u_birth, u_addr, u_tel, u_mail, u_ip, postcode);
				  
		  int res = UserDao.getInstance().insert(vo);
		  
		  System.out.printf("회원가입 성공실패여부 : %d",res);
			
		  if(res==0) {
			 response.sendRedirect("/mainpage/list.do");
		  }else {
			 response.sendRedirect("enroll.do?reason=failed_enroll");
			 return;
		  }
	}

}