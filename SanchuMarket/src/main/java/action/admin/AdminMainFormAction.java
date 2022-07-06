package action.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.chat.ChatDao;
import dao.product.ProductDao;
import vo.chat.ChatVo;
import vo.product.ProductVo;

/**
 * Servlet implementation class AdminFormAction
 */
@WebServlet("/admin/main_form.do")
public class AdminMainFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		//list한칸 안에 최근 vo객체 하나 들어가있음(최대 6개)
		List<ProductVo> p_list = ProductDao.getinstance().selectRecentList();
		List<ChatVo>ch_list = ChatDao.getinstance().SelectRecentList();
		
		Map map = new HashMap();
		map.put("p_list", p_list);
		map.put("ch_list", ch_list);
		
		request.setAttribute("map", map);
		
		//forward
		String forward_page = "mainpage_admin.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}