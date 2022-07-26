package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.MyConstant;
import dao.ProductDao;
import dao.VisitDao;
import util.Mytime;
import vo.ProductVo;

@Controller
@RequestMapping("/mainpage/")
public class MainPageController {
	


	@Autowired 
	 ServletContext application;
	  
	 @Autowired 
	 HttpSession session;
		  
	 @Autowired 
	 HttpServletRequest request;
	 
	 @Autowired
	 HttpServletResponse response;
	 
	 ProductDao product_dao;

	 public MainPageController(ProductDao product_dao) {
		 super();
		 this.product_dao = product_dao;
	 }
	 
	 VisitDao visit_dao;
	
	 public void setVisit_dao(VisitDao visit_dao) {
		this.visit_dao = visit_dao;
	}

	@RequestMapping("list.do")
	 public String list(Model model,  @RequestParam(value="c_idx",required = false ,defaultValue="null")String 	c_idx
			 				 , @RequestParam(value="searchtext", required = false , defaultValue="all") String searchtext
			 				 , @RequestParam(value="min_p", required = false, defaultValue="no_min" )String min_p
			 				 , @RequestParam(value="max_p", required = false, defaultValue="no_max" )String max_p
			 				 , @RequestParam(value="page", required = false,  defaultValue ="1") int nowPage
			 				 
			 				)
	 {
		 
		
		 
		
			
			//////////////////////////////////////////// 전체목록 가져오기/////////////////////////////////////////
		 	//	검색어가 비었고					최소가격이 비었고					
		 	if( searchtext.equals("all") && min_p.equals("no_min") 
	 			//최대가격이 비었고				카테고리가 비었을 때
	 			&& max_p.equals("no_max") && c_idx.equals("null")) {
		 		
		 		int start = (nowPage-1) * MyConstant.ProductList.BLOCK_LIST + 1;
		 		int end	  = start 		+ MyConstant.ProductList.BLOCK_LIST - 1;
		 		
		 		Map map = new HashMap();
		 		map.put("start", start);
		 		map.put("end", end);
		 		
		 		List<ProductVo> list  = product_dao.selectList(map);
		 		
		 		//전체상품 개수
		 		int list2 = product_dao.rowTotal();
		 		
		 		// 시간계산 메소드화
		 		Mytime.time_cal(list);
		 		
		 		//	전체페이지수		전체개수 / 표시할 게시글 수의 나머지가 0이면 (딱떨어지면)		전체개수 나누기 표시할 게시글의 수				그게 아니면		전체개수 나누기 표시할 게시글의 수 + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  첫페이지 1~3 이면 1 , 4~6 이면 4, 7~9 이면 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	끝페이지 1~3 이면 3 , 4~6 이면 6, 7~9 이면 9
		 	    int endPage   	= startPage + MyConstant.ProductList.BLOCK_PAGE -1;
		 	    
		 	    if(end > totalPage)
		 	       endPage = totalPage;
		 	    
		 	    
		 	    
		 	    List<Integer> pageList = new ArrayList<Integer>();
		 	    for (int i = startPage; i <= endPage; i++) {
		 	    	
		 	    	pageList.add(i);
		 	    }
		 	     System.out.println(pageList);
		 	    
		 		model.addAttribute("pageList", pageList);
		 		model.addAttribute("list", list);
		 		//model.addAttribute("list2",list2);
		 		
		 		System.out.println("전체검색");
		 		
		 		return "mainpage/mainpage_list";
		 	}
		 	
		 	
		 	
		 	//////////////////////////////////////////////가격 범위 상품명 검색///////////////////////////////////////
		 	//	검색어, 최소가격, 최대가격이 있을 때.
			if(!searchtext.equals("all") && !min_p.equals("no_min") 
					&& !max_p.equals("no_max") && c_idx.equals("null") ) {
				
				
				int start = (nowPage-1) * MyConstant.ProductList.BLOCK_LIST + 1;
		 		int end	  = start 		+ MyConstant.ProductList.BLOCK_LIST - 1;
		 		
		 		Map map = new HashMap();
		 		map.put("start", start);
		 		map.put("end", end);
				map.put("p_name", searchtext);
				map.put("min_p", min_p);
				map.put("max_p", max_p);
				
				List<ProductVo> list = product_dao.select_price_text_search(map);
				//
				int list2 = product_dao.rowTotal_pp(map);
				// 시간계산 메소드화
				Mytime.time_cal(list);
				
//				//	전체페이지수		전체개수 / 표시할 게시글 수의 나머지가 0이면 (딱떨어지면)		전체개수 나누기 표시할 게시글의 수				그게 아니면		전체개수 나누기 표시할 게시글의 수 + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  첫페이지 1~3 이면 1 , 4~6 이면 4, 7~9 이면 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	끝페이지 1~3 이면 3 , 4~6 이면 6, 7~9 이면 9
		 	    int endPage   	= startPage + MyConstant.ProductList.BLOCK_PAGE -1;
		 	    
		 	    if(end > totalPage)
		 	       endPage = totalPage;
		 	    
		 	    
		 	    
		 	   List<Integer> pageList = new ArrayList<Integer>();
		 	    for (int i = startPage; i <= endPage; i++) {
		 	    	
		 	    	pageList.add(i);
		 	    }
		 	     System.out.println(pageList);
		 	    
		 		model.addAttribute("pageList", pageList);

				model.addAttribute("list", list);
				
				System.out.println("가격범위 상품명 검색");
				
				return "mainpage/mainpage_list";
			}
			
			////////////////////////////////////////가격 범위검색//////////////////////////////////////
			if(!min_p.equals("no_min") && !max_p.equals("no_max")
					&&searchtext.equals("all") && c_idx.equals("null")) {
				
				System.out.println(min_p);
				System.out.println(max_p);
				
				
				int start = (nowPage-1) * MyConstant.ProductList.BLOCK_LIST + 1;
		 		int end	  = start 		+ MyConstant.ProductList.BLOCK_LIST - 1;
		 		
		 		Map map = new HashMap();
		 		map.put("start", start);
		 		map.put("end", end);
				map.put("min_p", min_p);
				map.put("max_p", max_p);
				
				List<ProductVo> list = product_dao.select_price_search(map);
				
				//전체상품 개수
				int list2 = product_dao.rowTotal_p_price(map);
				
				// 시간계산 메소드화
				Mytime.time_cal(list);

				
				//전체페이지수		전체개수 / 표시할 게시글 수의 나머지가 0이면 (딱떨어지면)		전체개수 나누기 표시할 게시글의 수				그게 아니면		전체개수 나누기 표시할 게시글의 수 + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  첫페이지 1~3 이면 1 , 4~6 이면 4, 7~9 이면 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	끝페이지 1~3 이면 3 , 4~6 이면 6, 7~9 이면 9
		 	    int endPage   	= startPage + MyConstant.ProductList.BLOCK_PAGE -1;
		 	    
		 	    if(end > totalPage)
		 	       endPage = totalPage;
		 	    
		 	    List<Integer> pageList = new ArrayList<Integer>();
		 	    for (int i = startPage; i <= endPage; i++) {
		 	    	pageList.add(i);
		 	    }
		 	    System.out.println(pageList);
		 	    
		 		model.addAttribute("pageList", pageList);
				
				model.addAttribute("list", list);
				
				System.out.println("가격검색");
				
				return "mainpage/mainpage_list";
			}
		 	

			
			/////////////////////////////////////////////////// 카테고리목록 가져오기///////////////////////////////////////
			if (!c_idx.equals("null")) {

				
				int start = (nowPage-1) * MyConstant.ProductList.BLOCK_LIST + 1;
		 		int end	  = start 		+ MyConstant.ProductList.BLOCK_LIST - 1;
		 		
		 		Map map = new HashMap();
		 		map.put("start", start);
		 		map.put("end", end);
		 		map.put("c_idx", c_idx);
		 		
		 		
		 		List<ProductVo> list = product_dao.selectList_cate(map);
		 		
		 		//전체상품 개수
		 		int list2 = product_dao.rowTotal_cate(Integer.parseInt(c_idx));
		 		
		 		// 시간계산 메소드화
		 		Mytime.time_cal(list);
		 		
				
				
		 		//전체페이지수		전체개수 / 표시할 게시글 수의 나머지가 0이면 (딱떨어지면)		전체개수 나누기 표시할 게시글의 수				그게 아니면		전체개수 나누기 표시할 게시글의 수 + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  첫페이지 1~3 이면 1 , 4~6 이면 4, 7~9 이면 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	끝페이지 1~3 이면 3 , 4~6 이면 6, 7~9 이면 9
		 	    int endPage   	= startPage + MyConstant.ProductList.BLOCK_PAGE -1;
		 	    
		 	    if(end > totalPage)
		 	       endPage = totalPage;
		 	    
		 	    List<Integer> pageList = new ArrayList<Integer>();
		 	    for (int i = startPage; i <= endPage; i++) {
		 	    	pageList.add(i);
		 	    }
		 	    System.out.println(pageList);
		 	    
		 		model.addAttribute("pageList", pageList);

				
				
				
				model.addAttribute("list", list);

				return "mainpage/mainpage_list";
			}
//			
//			
//			//////////////////////////////////////////////////상품검색////////////////////////////////////////////
			//문자열을 비교할 때는  .equals로 하자.
			if (!searchtext.equals("all")) {
				
				int start = (nowPage-1) * MyConstant.ProductList.BLOCK_LIST + 1;
		 		int end	  = start 		+ MyConstant.ProductList.BLOCK_LIST - 1;
		 		
		 		Map map = new HashMap();
		 		map.put("start", start);
		 		map.put("end", end);
				map.put("p_name", searchtext);

				List<ProductVo> list = product_dao.select_search(map);
				
				//전체상품 개수
				int list2 = product_dao.rowTotal_search(map);
				
				// 시간계산 메소드화
				Mytime.time_cal(list);
				
//				전체페이지수		전체개수 / 표시할 게시글 수의 나머지가 0이면 (딱떨어지면)		전체개수 나누기 표시할 게시글의 수				그게 아니면		전체개수 나누기 표시할 게시글의 수 + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  첫페이지 1~3 이면 1 , 4~6 이면 4, 7~9 이면 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	끝페이지 1~3 이면 3 , 4~6 이면 6, 7~9 이면 9
		 	    int endPage   	= startPage + MyConstant.ProductList.BLOCK_PAGE -1;
		 	    
		 	    if(end > totalPage)
		 	       endPage = totalPage;
		 	    
		 	    List<Integer> pageList = new ArrayList<Integer>();
		 	    for (int i = startPage; i <= endPage; i++) {
		 	    	pageList.add(i);
		 	    }
		 	    System.out.println(pageList);
		 	    
		 		model.addAttribute("pageList", pageList);
				model.addAttribute("list", list);
				
				System.out.println("상품검색");
				
				//-----------------cookie를 기반으로 visitDB 관리----------------------
				
				Cookie visitCookie = new Cookie("visitCookie","1");
				visitCookie.setPath("/sanchumarket/");
				response.addCookie(visitCookie);
				
				
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
