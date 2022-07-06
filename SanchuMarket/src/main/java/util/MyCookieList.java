package util;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import dao.product.ProductDao;
import vo.product.ProductVo;

public class MyCookieList {

	
	public static List<ProductVo> getCookieList(HttpServletRequest request) throws Exception {
		
		Cookie cookie_array[] = request.getCookies();
		
		List<ProductVo> cookielist = new ArrayList<ProductVo>();
				
		
		if(cookie_array != null) {
			
			
			for(Cookie cookie2 : cookie_array) {
				
			
				String cookiename = URLDecoder.decode(cookie2.getName(), "utf-8");
				if(!cookiename.equals("JSESSIONID")) {
			
				String cookievalue = cookie2.getValue();
				/*
				 * System.out.println("쿠키값입니다."); System.out.println(cookiename);
				 * System.out.println(cookievalue);
				 * 
				 * 
				 * System.out.println("쿠키리스트포장중");
				 */
				ProductVo vo = ProductDao.getinstance().selectList2(Integer.parseInt(cookievalue));
				
				cookielist.add(vo);
				
				}
				
				
			}
			
		}
		

		
		
		return cookielist;
	}
}
