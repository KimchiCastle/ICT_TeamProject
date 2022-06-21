package action.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductInsertAction
 */
@WebServlet("/product/insert.do")
public class ProductInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		//1. request encoding 하기
		request.setCharacterEncoding("utf-8");
		
		//2. parameter 받기
		//제목
		String p_name = request.getParameter("p_name");
		
		//카테고리번호
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));

		//상품상태
		String p_condition = request.getParameter("p_condition");
		
		
		
		//가격		
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		
		//상품설명
		String p_exp = request.getParameter("p_exp").replaceAll("\r\n", "<br>");
		
		
		
		

	}

}
