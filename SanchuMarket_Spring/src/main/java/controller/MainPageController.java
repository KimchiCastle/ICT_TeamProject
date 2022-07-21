package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.MyConstant;
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
			 				 , @RequestParam(value="page", required = false,  defaultValue ="1") int nowPage
			 				 
			 				)
	 {
		 
		
		 
		
			
			//////////////////////////////////////////// ��ü��� ��������/////////////////////////////////////////
		 	//	�˻�� �����					�ּҰ����� �����					
		 	if( searchtext.equals("all") && min_p.equals("no_min") 
	 			//�ִ밡���� �����				ī�װ��� ����� ��
	 			&& max_p.equals("no_max") && c_idx.equals("null")) {
		 		
		 		int start = (nowPage-1) * MyConstant.ProductList.BLOCK_LIST + 1;
		 		int end	  = start 		+ MyConstant.ProductList.BLOCK_LIST - 1;
		 		
		 		Map map = new HashMap();
		 		map.put("start", start);
		 		map.put("end", end);
		 		
		 		List<ProductVo> list  = product_dao.selectList(map);
		 		
		 		//��ü��ǰ ����
		 		int list2 = product_dao.rowTotal();
		 		
		 		// �ð���� �޼ҵ�ȭ
		 		Mytime.time_cal(list);
		 		
		 		//	��ü��������		��ü���� / ǥ���� �Խñ� ���� �������� 0�̸� (����������)		��ü���� ������ ǥ���� �Խñ��� ��				�װ� �ƴϸ�		��ü���� ������ ǥ���� �Խñ��� �� + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  ù������ 1~3 �̸� 1 , 4~6 �̸� 4, 7~9 �̸� 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	�������� 1~3 �̸� 3 , 4~6 �̸� 6, 7~9 �̸� 9
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
		 		
		 		System.out.println("��ü�˻�");
		 		
		 		return "mainpage/mainpage_list";
		 	}
		 	
		 	
		 	
		 	//////////////////////////////////////////////���� ���� ��ǰ�� �˻�///////////////////////////////////////
		 	//	�˻���, �ּҰ���, �ִ밡���� ���� ��.
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
				// �ð���� �޼ҵ�ȭ
				Mytime.time_cal(list);
				
//				//	��ü��������		��ü���� / ǥ���� �Խñ� ���� �������� 0�̸� (����������)		��ü���� ������ ǥ���� �Խñ��� ��				�װ� �ƴϸ�		��ü���� ������ ǥ���� �Խñ��� �� + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  ù������ 1~3 �̸� 1 , 4~6 �̸� 4, 7~9 �̸� 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	�������� 1~3 �̸� 3 , 4~6 �̸� 6, 7~9 �̸� 9
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
				
				System.out.println("���ݹ��� ��ǰ�� �˻�");
				
				return "mainpage/mainpage_list";
			}
			
			////////////////////////////////////////���� �����˻�//////////////////////////////////////
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
				
				//��ü��ǰ ����
				int list2 = product_dao.rowTotal_p_price(map);
				
				// �ð���� �޼ҵ�ȭ
				Mytime.time_cal(list);

				
				//��ü��������		��ü���� / ǥ���� �Խñ� ���� �������� 0�̸� (����������)		��ü���� ������ ǥ���� �Խñ��� ��				�װ� �ƴϸ�		��ü���� ������ ǥ���� �Խñ��� �� + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  ù������ 1~3 �̸� 1 , 4~6 �̸� 4, 7~9 �̸� 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	�������� 1~3 �̸� 3 , 4~6 �̸� 6, 7~9 �̸� 9
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
				
				System.out.println("���ݰ˻�");
				
				return "mainpage/mainpage_list";
			}
		 	

			
			/////////////////////////////////////////////////// ī�װ���� ��������///////////////////////////////////////
			if (!c_idx.equals("null")) {

				
				int start = (nowPage-1) * MyConstant.ProductList.BLOCK_LIST + 1;
		 		int end	  = start 		+ MyConstant.ProductList.BLOCK_LIST - 1;
		 		
		 		Map map = new HashMap();
		 		map.put("start", start);
		 		map.put("end", end);
		 		map.put("c_idx", c_idx);
		 		
		 		
		 		List<ProductVo> list = product_dao.selectList_cate(map);
		 		
		 		//��ü��ǰ ����
		 		int list2 = product_dao.rowTotal_cate(Integer.parseInt(c_idx));
		 		
		 		// �ð���� �޼ҵ�ȭ
		 		Mytime.time_cal(list);
		 		
				
				
		 		//��ü��������		��ü���� / ǥ���� �Խñ� ���� �������� 0�̸� (����������)		��ü���� ������ ǥ���� �Խñ��� ��				�װ� �ƴϸ�		��ü���� ������ ǥ���� �Խñ��� �� + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  ù������ 1~3 �̸� 1 , 4~6 �̸� 4, 7~9 �̸� 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	�������� 1~3 �̸� 3 , 4~6 �̸� 6, 7~9 �̸� 9
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
//			//////////////////////////////////////////////////��ǰ�˻�////////////////////////////////////////////
			//���ڿ��� ���� ����  .equals�� ����.
			if (!searchtext.equals("all")) {
				
				int start = (nowPage-1) * MyConstant.ProductList.BLOCK_LIST + 1;
		 		int end	  = start 		+ MyConstant.ProductList.BLOCK_LIST - 1;
		 		
		 		Map map = new HashMap();
		 		map.put("start", start);
		 		map.put("end", end);
				map.put("p_name", searchtext);

				List<ProductVo> list = product_dao.select_search(map);
				
				//��ü��ǰ ����
				int list2 = product_dao.rowTotal_search(map);
				
				// �ð���� �޼ҵ�ȭ
				Mytime.time_cal(list);
				
//				��ü��������		��ü���� / ǥ���� �Խñ� ���� �������� 0�̸� (����������)		��ü���� ������ ǥ���� �Խñ��� ��				�װ� �ƴϸ�		��ü���� ������ ǥ���� �Խñ��� �� + 1
		 	    int	totalPage 	= ( list2 % MyConstant.ProductList.BLOCK_LIST ==0 ? (list2 / MyConstant.ProductList.BLOCK_LIST) : (list2 / MyConstant.ProductList.BLOCK_LIST +1) );
		 	    
		 	    if(nowPage > totalPage)
		 	    	nowPage = totalPage;
		 	    
		 	    //  ù������ 1~3 �̸� 1 , 4~6 �̸� 4, 7~9 �̸� 7
		 	    int startPage 	= ((nowPage-1)/MyConstant.ProductList.BLOCK_PAGE) * MyConstant.ProductList.BLOCK_PAGE + 1;
		 	    //	�������� 1~3 �̸� 3 , 4~6 �̸� 6, 7~9 �̸� 9
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
				
				System.out.println("��ǰ�˻�");
				
				return "mainpage/mainpage_list";

			}
			
			
				
				
				
				
				
				
				
				
			
//			//��Ű �����ϱ�(admin������ �湮�ڼ� ����)
//			int cnt = 0;
//			cnt++;
//			
//			//��Ű ��ü �����ø��� value ����
//			Cookie cookie = new Cookie("cookie_cnt", cnt+"");
//			
//			//��Ű ��ȿ�ð� �Ϸ�� ����
//			cookie.setMaxAge(24*60*60);
//			
//			//��Ű ��ȿ ������ �������� ����
//			cookie.setPath("/");
//			response.addCookie(cookie);

			
			
			// session�޾Ƽ� ó�����ּ���

			
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
		 
		 //admin ���� �湮�� cookie����
		 //Cookie cookie = new Cookie("visitCookie", "visitCookieCnt");
		
		return "mainpage/mainpage_list";
	 }	
	 
}
