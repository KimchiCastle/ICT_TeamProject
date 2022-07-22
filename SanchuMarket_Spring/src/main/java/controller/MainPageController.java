package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
			 				 , @RequestParam(value="searchtext", required = false , defaultValue="all") String searchtext
			 				 , @RequestParam(value="min_p", required = false, defaultValue="no_min" )String min_p
			 				 , @RequestParam(value="max_p", required = false, defaultValue="no_max" )String max_p
			 ) {
		 
		
		// ,
		//		
		 
			
			// 전체목록 가져오기
		 	//	검색어가 비었고					최소가격이 비었고					
		 	if( searchtext.equals("all") && min_p.equals("no_min") 
	 			//최대가격이 비었고				카테고리가 비었을 때
	 			&& max_p.equals("no_max") && c_idx.equals("null")) {
		 		
		 		List<ProductVo> list = product_dao.selectList();
		 		
		 		// 시간계산 메소드화
		 		Mytime.time_cal(list);
		 		
		 		
		 		
		 		model.addAttribute("list", list);
		 		
		 		System.out.println("전체검색");
		 		
		 		return "mainpage/mainpage_list";
		 	}
		 	
		 	//가격 범위 상품명 검색
		 	//	검색어, 최소가격, 최대가격이 있을 때.
			if(!searchtext.equals("all") && !min_p.equals("no_min") 
					&& !max_p.equals("no_max") && c_idx.equals("null") ) {
				
				
				
				Map map = new HashMap();
				map.put("p_name", searchtext);
				map.put("min_p", min_p);
				map.put("max_p", max_p);
				
				List<ProductVo> list = product_dao.select_price_text_search(map);
				
				// 시간계산 메소드화
				Mytime.time_cal(list);

				model.addAttribute("list", list);
				
				System.out.println("가격범위 상품명 검색");
				
				return "mainpage/mainpage_list";
			}
			
			//가격 범위검색
			if(!min_p.equals("no_min") && !max_p.equals("no_max")
					&&searchtext.equals("all") && c_idx.equals("null")) {
				
				System.out.println(min_p);
				System.out.println(max_p);
				
				Map map = new HashMap();
				map.put("min_p", min_p);
				map.put("max_p", max_p);
				
				List<ProductVo> list = product_dao.select_price_search(map);
				
				// 시간계산 메소드화
				Mytime.time_cal(list);

				model.addAttribute("list", list);
				
				System.out.println("가격검색");
				
				return "mainpage/mainpage_list";
			}
		 	

			
			// 카테고리목록 가져오기
			if (!c_idx.equals("null")) {

				List<ProductVo> list = product_dao.selectList_cate(Integer.parseInt(c_idx));
				// 시간계산 메소드화
				Mytime.time_cal(list);

				model.addAttribute("list", list);

				return "mainpage/mainpage_list";
			}
//			
//			
//			//검색
			//문자열을 비교할 때는  .equals로 하자.
			if (!searchtext.equals("all")) {

				Map map = new HashMap();
				map.put("p_name", searchtext);

				List<ProductVo> list = product_dao.selectList(map);

				// 시간계산 메소드화
				Mytime.time_cal(list);

				model.addAttribute("list", list);
				
				System.out.println("상품검색");
				
				return "mainpage/mainpage_list";

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
