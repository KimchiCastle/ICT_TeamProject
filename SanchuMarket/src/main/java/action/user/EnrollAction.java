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
		  String u_pwd = request.getParameter("u_pwd1");
		  String u_name = request.getParameter("u_name");
		  String u_nickname = request.getParameter("u_nickname");
		  String u_birth = request.getParameter("u_birth");
		  String addr = request.getParameter("address");
		  String detail_addr = request.getParameter("detail");
		  String postcode = request.getParameter("postcode");
		  String u_tel = request.getParameter("u_tel");
		  String u_mail = request.getParameter("u_email");
		  String u_ip = request.getRemoteAddr();
		  
		  //u_addr = 扁夯 林家 + 惑技 林家 
		  StringBuilder sb = new StringBuilder();
		  sb.append(addr).append(" ").append(detail_addr);
		  String u_addr = sb.toString();
		  
		  UserVo vo = new UserVo(u_id, u_pwd, u_name, u_nickname, u_birth, u_addr,
		  postcode, u_tel, u_mail, u_ip);
		  
		  int res = UserDao.getInstance().insert(vo);
		  
		  if(res==1) {
			  response.sendRedirect("../mainpage/list.do");
		  }else {
			  
			  response.sendRedirect("enroll_form.do?reason=failed_enroll");
			  return;
		  }
		  
	}
}