package action.recent;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cookie_page = Integer.parseInt(request.getParameter("cookie_page"));
		
        //한 페이지 당 보여줄 수 
        int pageSize = 3;
		
        //한 페이지의 시작글 번호
		int startRow = (cookie_page - 1) * pageSize;
		//한 페이지의 마지막 글번호
        int endRow = cookie_page * pageSize - 1;
		
        
		List<ProductVo> cookielist2 = null;

		Cookie cookie_array[] = request.getCookies();

		try {
			cookielist2 = MyCookieList.getCookieList(cookie_array, request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		
		List<ProductVo> cookielist = new ArrayList<ProductVo>();
		
		
		for(int i=startRow; i<=endRow; i++) {
			
			if(cookielist2.size()<=i) continue;
			
			
			ProductVo vo = cookielist2.get(i);

			System.out.println(vo.getP_name());
			
			cookielist.add(vo);
			
			
		}
		
		
		
		
		request.setAttribute("cookielist", cookielist);

		// forward
		String forward_page = "sidebar/cookie_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
