package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.product.ProductDao;
import util.MyCookieList;
import vo.image.ImageVo;
import vo.product.ProductVo;

@Controller
public class RecentController {
	
	@Autowired
	HttpServletRequest request;
	
	
	ProductDao product_dao;


	public RecentController(ProductDao product_dao) {
		super();
		this.product_dao = product_dao;
	}
	
	@RequestMapping("/list_cookie.do")		//		현재페이지
	public String ProductCookieList(Model model, int curr_page) {
		
		
        //한 페이지 당 보여줄 수 
        int pageSize = 3;
		
        
        //한페이지에 보여질 시작번호, 끝반호 구하는 공식을 
        //아래처럼 하는 이유는 제로베이스이기때문(0부터 시작)
        
        // 시작번호 = 현재페이지 - 1 * 3
		int startRow = (curr_page - 1) * pageSize; //한 페이지의 시작글 번호
		// 끝번호 = 현재페이지 * 3 -1
        int endRow = curr_page * pageSize - 1; //한 페이지의 마지막 글번호
		
        //메소드로 부터 받아올 쿠키리스트 
		List<ProductVo> cookielist2 = null;
		
		// request로부터 쿠키값들 받아와서 배열에 저장
		Cookie cookie_array[] = request.getCookies();
		
		
		try {
			
			//List 데이터 가져오는 메서드, 배열과, request, 인젝션받은 product_dao 준다.
			cookielist2 = MyCookieList.getCookieList(cookie_array, request, product_dao);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		

		
		//마지막페이지 구하는 공식 삼항연산자 사용
		int last_page = ( (cookielist2.size()%pageSize==0) ? (cookielist2.size()/pageSize) : (cookielist2.size()/pageSize+1) );
		
//		System.out.println(last_page);
		
		//
		List<ProductVo> cookielist = new ArrayList<ProductVo>();
		
		// i=시작번호, 끝번호까지 i++ , 실제 페이징처리 알고리즘
		for(int i=startRow; i<=endRow; i++) {
			
			//i가 리스트크기보다 같거나 커질경우 뒤에명령 다무시
			if(cookielist2.size()<=i) continue;
			
			//i위치에 해당하는 최근본 상품을 vo로 포장하고,
			ProductVo vo = cookielist2.get(i);
			
			//실제 뿌려질 ArrayList에 add
			cookielist.add(vo);
			
		}
		
		
		//위에서 만들어진 ArrayList model에 Attribute
		model.addAttribute("cookielist", cookielist);

		//마지막 페이지도 뿌리기.
		model.addAttribute("curr_page", curr_page);
		model.addAttribute("last_page", last_page);
		
		// forward
		return "sidebar/cookie_list";
	}
	
	
}
