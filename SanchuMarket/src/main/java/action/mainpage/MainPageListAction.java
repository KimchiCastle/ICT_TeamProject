package action.mainpage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.product.ProductDao;
import util.Mytime;
import vo.product.ProductVo;
import vo.user.UserVo;

/**
 * Servlet implementation class MainPageListAction
 */
@WebServlet("/mainpage/list.do")
public class MainPageListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchtext = request.getParameter("searchtext");
		
		
		String c_idx = request.getParameter("c_idx");

		//int page = Integer.parseInt(request.getParameter("page"));
		
		
		
		// 전체목록 가져오기
		if (c_idx == null) {

			List<ProductVo> list = ProductDao.getinstance().selectList();
			// 시간계산 메소드화
			Mytime.time_cal(list);

			
			
			request.setAttribute("list", list);

		}
		// 카테고리목록 가져오기
		if (c_idx != null) {

			List<ProductVo> list = ProductDao.getinstance().selectList(c_idx);
			// 시간계산 메소드화
			Mytime.time_cal(list);

			request.setAttribute("list", list);

		}
		
		
		//검색
		if (searchtext != null) {

			Map map = new HashMap();
			map.put("p_name", searchtext);
			map.put("p_exp", searchtext);

			List<ProductVo> list = ProductDao.getinstance().selectList(map);

			// 시간계산 메소드화
			Mytime.time_cal(list);

			request.setAttribute("list", list);

		}
		
		//쿠키 생성하기(admin페이지 방문자수 집계)
		int cnt = 0;
		cnt++;
		
		//쿠키 객체 생성시마다 value 증가
		Cookie cookie = new Cookie("cookie_cnt", cnt+"");
		
		//쿠키 유효시간 하루로 설정
		cookie.setMaxAge(24*60*60);
		
		//쿠키 유효 범위를 전역으로 설정
		cookie.setPath("/");
		response.addCookie(cookie);

		
		 /* List<ProductVo> cookielist=null; try { cookielist =
		 * MyCookieList.getCookieList(request); } catch (Exception e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 * 
		 * System.out.println(cookielist.size());
		 * 
		 * request.setAttribute("cookielist", cookielist);
		 * 
		 * 
		 * 
		 * for( ProductVo vo : list) { System.out.println(vo.getP_idx()); }
		 */

		// session받아서 처리해주세용

		
		  UserVo user = (UserVo) request.getSession().getAttribute("user");
		  
			/*
			 * if(session.getAttribute("user")==null) {
			 * 
			 * }else {
			 * 
			 * }
			 */	 
		System.out.println(user);

		// forward
		String forward_page = "mainpage_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
