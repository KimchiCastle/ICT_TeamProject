package action.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.image.ImageDao;
import dao.product.ProductDao;
import vo.image.ImageVo;
import vo.product.ProductVo;

/**
 * Servlet implementation class ProductUploadPhotoAction
 */
@WebServlet("/product/product_update.do")
public class ProductUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1. p_idx를 받아온다.
		//인코딩설정
		request.setCharacterEncoding("utf-8");
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		
		ProductVo productVo = ProductDao.getinstance().selectOne(p_idx);
		
		String p_exp = productVo.getP_exp().replaceAll("<br>", "\r\n");
		
		productVo.setP_exp(p_exp);
		
		
		ImageVo imageVo = ImageDao.getInstance().selectOne(p_idx);
		
		request.setAttribute("productVo", productVo);
		request.setAttribute("imageVo", imageVo);
		
		
		String forward_page = "product_modify_form.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
		
		
	}

}
