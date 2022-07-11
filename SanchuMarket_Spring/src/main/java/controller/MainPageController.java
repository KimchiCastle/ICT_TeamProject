package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.product.ProductDao;
import util.Mytime;
import vo.product.ProductVo;

@Controller
@RequestMapping("/mainpage/")
public class MainPageController {
	


	@Autowired 
	 ServletContext application;
	  
	 @Autowired 
	 HttpSession session;
		  
	 @Autowired 
	 HttpServletRequest request;
	 
	 ProductDao product_dao;

	 public MainPageController(ProductDao product_dao) {
		 super();
		 this.product_dao = product_dao;
	 }
	
	 @RequestMapping("list.do")
	 public String list(Model model,  @RequestParam(value="c_idx",required = false ,defaultValue="null")String 	c_idx
			 				 , @RequestParam(value="searchtext", required = false , defaultValue="all") String searchtext) {
		 
		 System.out.println(c_idx);
		// ,
		//		
		 
			
			// 전체목록 가져오기
			
		 	if( c_idx.equals("null") ) {
		 		
		 		List<ProductVo> list = product_dao.selectList();
		 		
		 		// 시간계산 메소드화
		 		Mytime.time_cal(list);
		 		
		 		
		 		
		 		model.addAttribute("list", list);
		 	}

			
			// 카테고리목록 가져오기
			if (!c_idx.equals("null")) {

				List<ProductVo> list = product_dao.selectList_cate(Integer.parseInt(c_idx));
				// 시간계산 메소드화
				Mytime.time_cal(list);

				model.addAttribute("list", list);

			}
//			
//			
//			//검색
			//문자열을 비교할 때는  .equals로 하자.
			if (!searchtext.equals("all")) {

				Map map = new HashMap();
				map.put("p_name", searchtext);
				map.put("p_exp", searchtext);

				List<ProductVo> list = product_dao.selectList(map);

				// 시간계산 메소드화
				Mytime.time_cal(list);

				model.addAttribute("list", list);

			}
			
//			//쿠키 생성하기(admin페이지 방문자수 집계)
//			int cnt = 0;
//			cnt++;
//			
//			//쿠키 객체 생성시마다 value 증가
//			Cookie cookie = new Cookie("cookie_cnt", cnt+"");
//			
//			//쿠키 유효시간 하루로 설정
//			cookie.setMaxAge(24*60*60);
//			
//			//쿠키 유효 범위를 전역으로 설정
//			cookie.setPath("/");
//			response.addCookie(cookie);

			
			
			// session받아서 처리해주세용

			
//			  UserVo user = (UserVo) request.getSession().getAttribute("user");
//			  
//				/*
//				 * if(session.getAttribute("user")==null) {
//				 * 
//				 * }else {
//				 * 
//				 * }
//				 */	 
//			System.out.println(user);

		 
		 
		 //String visitCookie = "";
		// String visitCookieCnt = "";
		 
		 //admin 금일 방문수 cookie생성
		 //Cookie cookie = new Cookie("visitCookie", "visitCookieCnt");
		
		return "mainpage/mainpage_list";
	 }	
	 
}
