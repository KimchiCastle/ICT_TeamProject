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

import dao.ProductDao;
import util.MyCookieList;
import vo.ImageVo;
import vo.ProductVo;

@Controller
public class RecentController {
	
	@Autowired
	HttpServletRequest request;
	
	
	ProductDao product_dao;


	public RecentController(ProductDao product_dao) {
		super();
		this.product_dao = product_dao;
	}
	
	@RequestMapping("/list_cookie.do")		//		����������
	public String ProductCookieList(Model model, int curr_page) {
		
		
        //�� ������ �� ������ �� 
        int pageSize = 3;
		
        
        //���������� ������ ���۹�ȣ, ����ȣ ���ϴ� ������ 
        //�Ʒ�ó�� �ϴ� ������ ���κ��̽��̱⶧��(0���� ����)
        
        // ���۹�ȣ = ���������� - 1 * 3
		int startRow = (curr_page - 1) * pageSize; //�� �������� ���۱� ��ȣ
		// ����ȣ = ���������� * 3 -1
        int endRow = curr_page * pageSize - 1; //�� �������� ������ �۹�ȣ
		
        //�޼ҵ�� ���� �޾ƿ� ��Ű����Ʈ 
		List<ProductVo> cookielist2 = null;
		
		// request�κ��� ��Ű���� �޾ƿͼ� �迭�� ����
		Cookie cookie_array[] = request.getCookies();
		
		
		try {
			
			//List ������ �������� �޼���, �迭��, request, �����ǹ��� product_dao �ش�.
			cookielist2 = MyCookieList.getCookieList(cookie_array, request, product_dao);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		

		
		//������������ ���ϴ� ���� ���׿����� ���
		int last_page = ( (cookielist2.size()%pageSize==0) ? (cookielist2.size()/pageSize) : (cookielist2.size()/pageSize+1) );
		
//		System.out.println(last_page);
		
		//
		List<ProductVo> cookielist = new ArrayList<ProductVo>();
		
		// i=���۹�ȣ, ����ȣ���� i++ , ���� ����¡ó�� �˰���
		for(int i=startRow; i<=endRow; i++) {
			
			//i�� ����Ʈũ�⺸�� ���ų� Ŀ����� �ڿ���� �ٹ���
			if(cookielist2.size()<=i) continue;
			
			//i��ġ�� �ش��ϴ� �ֱٺ� ��ǰ�� vo�� �����ϰ�,
			ProductVo vo = cookielist2.get(i);
			
			//���� �ѷ��� ArrayList�� add
			cookielist.add(vo);
			
		}
		
		
		//������ ������� ArrayList model�� Attribute
		model.addAttribute("cookielist", cookielist);

		//������ �������� �Ѹ���.
		model.addAttribute("curr_page", curr_page);
		model.addAttribute("last_page", last_page);
		
		// forward
		return "sidebar/cookie_list";
	}
	
	
	
}
