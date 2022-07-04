package action.recent;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.MyCookieList;
import vo.product.ProductVo;

/**
 * Servlet implementation class ProductCookieListAction
 */
@WebServlet("/list_cookie.do")
public class ProductCookieListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cookie_page = Integer.parseInt(request.getParameter("cookie_page"));

		
		List<ProductVo> cookielist = null;
		try {
			cookielist = MyCookieList.getCookieList(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block 
			e.printStackTrace(); 

		}

        request.setAttribute("cookielist", cookielist);
		
		//forward
		String forward_page = "sidebar/cookie_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
