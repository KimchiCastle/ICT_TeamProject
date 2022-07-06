package action.product;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductInsertFormAction
 */
@WebServlet("/product/insert_form.do")
public class ProductInsertFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1.인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		//---- 쿠키 설정 ---
		
//		String p_idx = request.getParameter("p_idx");
//		String p_name = request.getParameter("p_name");
//		
//		Cookie cookie = new Cookie(URLEncoder.encode(p_name,"utf-8"), p_idx);
//		cookie.setPath("/SanchuMarket/");
//		 
//		//쿠키 응답하기
//		response.addCookie(cookie);
		
		
		/*
		 * List<ProductVo> cookielist=null; try { cookielist =
		 * MyCookieList.getCookieList(request); } catch (Exception e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 * 
		 * 
		 * request.setAttribute("cookielist", cookielist);
		 */
		
		
		// ---------------------
		//forward
		String forward_page = "product_insert.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
