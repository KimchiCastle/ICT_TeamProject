package util;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import dao.product.ProductDao;
import vo.product.ProductVo;

public class MyCookieList {
	
	ProductDao product_dao;
	
	

	public MyCookieList(ProductDao product_dao) {
		this.product_dao = product_dao;
	}



	public List<ProductVo> getCookieList(Cookie cookie_array[], HttpServletRequest request) throws Exception {

		List<ProductVo> cookielist = new ArrayList<ProductVo>();

		if (cookie_array != null) {

			for (Cookie cookie2 : cookie_array) {

				String cookiename = URLDecoder.decode(cookie2.getName(), "utf-8");
				if (cookiename.matches("-?\\d+")) {

					int cookievalue = Integer.parseInt(cookiename);

					ProductVo vo = product_dao.selectList2(cookievalue);

					cookielist.add(vo);

				}

			}

		}
		// 리스트 뒤집기 최근본 상품이 제일 최상위로 가게
		Collections.reverse(cookielist);


		return cookielist;
	}
}
