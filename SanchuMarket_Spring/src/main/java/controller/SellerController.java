package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ProductDao;
import dao.UserDao;
import util.Mytime;
import vo.ProductVo;
import vo.UserVo;

@Controller
@RequestMapping("/sellerpage/")
public class SellerController {
	
	
	ProductDao product_dao;
	
	UserDao user_dao;
	
	
	public SellerController(ProductDao product_dao, UserDao user_dao) {
		super();
		this.product_dao = product_dao;
		this.user_dao = user_dao;
	}


	@RequestMapping("list.do")
	public String seller_list(Model model ) {
		
		int u_idx = 1;
		
		//�Ǹ��ڰ� �ø� �ǸŻ�ǰ ��ü ��ȸ
		List<ProductVo> product_list = product_dao.selectList(u_idx);
		
		//������ �Ǹ��� ���� �˾ƿ���(+ ���Գ�¥��)
		UserVo user_info = user_dao.selectOneByIdxTime(u_idx);
		
		//�ð� ��� �޼��� 
		Mytime.time_cal(product_list);
		
		//���Գ�¥ ���ϱ� �޼���
		String u_time = user_info.getU_time();
		int u_time_int = (Integer.parseInt(u_time)/84000);
		u_time = String.format("%d", u_time_int);
		
		//���� �� �ٽ� �Ǹ��� ������ ����
		user_info.setU_regdate(u_time);
		
		//
		model.addAttribute("product_list",product_list);
		model.addAttribute("user_info",user_info);

		
		return "sellerpage/seller_page";
	}
	
	
}
