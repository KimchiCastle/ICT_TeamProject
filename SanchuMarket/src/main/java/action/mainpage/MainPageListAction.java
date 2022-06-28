package action.mainpage;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
		
		String[] p_time = new String[list.size()];
		
		
		
		for (int i = 0; i < list.size(); i++) {
			p_time[i] = list.get(i).getP_time();
			int p_tim = Integer.parseInt(p_time[i]);
			String p_ti = "1년전";
			System.out.println(p_tim);
			if( p_tim < 60) {
				p_ti = String.format("%d초전", p_tim);
			}else if(p_tim <3600) {
				p_ti = Integer.toString(p_tim/60);
				p_ti = String.format("%s분전", p_ti);
			}else if(p_tim < 86400) {
				p_ti = Integer.toString(p_tim/3600);
				p_ti = String.format("%s시간전", p_ti);
			}else if(p_tim < 86400*30) {
				p_ti = Integer.toString(p_tim/86400);
				p_ti = String.format("%s일전", p_ti);
			}else if(p_tim < 86400*365) {
				p_ti = Integer.toString(p_tim/86400*30);
				p_ti = String.format("%s달전", p_ti);
			}else if(p_tim >= 86400*365) {
				if(p_tim>2000000000) {
					p_ti="아주오래전";
				}else {
					p_ti = Integer.toString(p_tim/((86400*30)*12));
					p_ti = String.format("%s년전", p_ti);
				}
			}
			
			list.get(i).setP_date(p_ti);
			
		}
		
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
