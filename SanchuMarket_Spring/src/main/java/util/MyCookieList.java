	package util;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import dao.ProductDao;
import vo.ProductVo;

public class MyCookieList {
	
	

	public static List<ProductVo> getCookieList(Cookie cookie_array[], HttpServletRequest request, ProductDao product_dao) throws Exception {
		
		
		//리스트 생성
		List<ProductVo> cookielist = new ArrayList<ProductVo>();

		//참조인자로 들어온 쿠키배열에 값이 있으면
		if (cookie_array != null) {
			
			
			for (Cookie cookie2 : cookie_array) {

				String cookiename = URLDecoder.decode(cookie2.getName(), "utf-8");
				
				// 쿠키의 네임이 정수형이라면
				if (cookiename.matches("-?\\d+")) {

					// int형 받아온 쿠키네임 int형변환
					int cookievalue = Integer.parseInt(cookiename);

					// 쿠키네임은 p_idx이고, p_idx에 해당하는 상품정보 포장
					ProductVo vo = product_dao.selectListproduct(cookievalue);
					
					
					
					cookielist.add(vo);

				}

			}

			// 리스트 뒤집기 최근본 상품이 제일 최상위로 가게
			Collections.reverse(cookielist);
		}

		return cookielist;
	}
}
