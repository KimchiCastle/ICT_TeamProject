package action.mainpage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.product.ProductDao;
import vo.product.ProductVo;

/**
 * Servlet implementation class MainPageListAction
 */
@WebServlet("/mainpage/list.do")
public class MainPageListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//전체목록 가져오기
		List<ProductVo> list 	= ProductDao.getinstance().selectList();
		
		
		request.setAttribute("list", list);
		 
		/*
		 * for( ProductVo vo : list) { System.out.println(vo.getP_idx()); }
		 */
		
		 
		//forward
		String forward_page = "content.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
