package action.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import vo.UserVo;

/**
 * Servlet implementation class MypageSaleListAction
 */
@WebServlet("/mypage/sale_list.do")
public class MypageSaleListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		
		//1.u_idx가 등록한 판매물품 목록
		List<UserVo>list = UserDao.getInstance().selectList(u_idx);
		
		//request binding
		request.setAttribute("list", list);

		
		//forward
		String forward_page = "mypage_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}

