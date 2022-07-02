package action.product;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.product.ProductDao;
import vo.product.ProductVo;

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
		
		String p_idx = request.getParameter("p_idx");
		String p_name = request.getParameter("p_name");
		
		Cookie cookie = new Cookie(URLEncoder.encode(p_name,"utf-8"), p_idx);
		
		//쿠키 응답하기
		response.addCookie(cookie);
		
		Cookie cookie_array[] = request.getCookies();
		
		List<ProductVo> cookielist = null;
				
				
		
		if(cookie_array != null) {
			
			
			
			for(Cookie cookie2 : cookie_array) {
				
				
				String cookiename = URLDecoder.decode(cookie2.getName(), "utf-8");
				String cookievalue = cookie2.getValue();
				System.out.println("쿠키값입니다.");
				System.out.println(cookiename);
				System.out.println(cookievalue);
				
				if(!cookiename.equals("JSESSIONID")) {
					
					System.out.println("쿠키리스트포장중");
					cookielist = ProductDao.getinstance().selectList2(Integer.parseInt(cookievalue));
					
				}
				
				
			}
			
		}
		
		
		request.setAttribute("cookielist", cookielist);
		
		
		
		// ---------------------
		//forward
		String forward_page = "product_insert.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
