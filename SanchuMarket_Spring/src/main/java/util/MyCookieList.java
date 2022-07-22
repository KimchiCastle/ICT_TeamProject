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
		
		
		//����Ʈ ����
		List<ProductVo> cookielist = new ArrayList<ProductVo>();

		//�������ڷ� ���� ��Ű�迭�� ���� ������
		if (cookie_array != null) {
			
			
			for (Cookie cookie2 : cookie_array) {

				String cookiename = URLDecoder.decode(cookie2.getName(), "utf-8");
				
				// ��Ű�� ������ �������̶��
				if (cookiename.matches("-?\\d+")) {

					// int�� �޾ƿ� ��Ű���� int����ȯ
					int cookievalue = Integer.parseInt(cookiename);

					// ��Ű������ p_idx�̰�, p_idx�� �ش��ϴ� ��ǰ���� ����
					ProductVo vo = product_dao.selectListproduct(cookievalue);
					
					
					
					cookielist.add(vo);

				}

			}

			// ����Ʈ ������ �ֱٺ� ��ǰ�� ���� �ֻ����� ����
			Collections.reverse(cookielist);
		}

		return cookielist;
	}
}
