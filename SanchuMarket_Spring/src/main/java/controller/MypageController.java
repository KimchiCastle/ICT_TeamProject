package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.JjimDao;
import dao.ProductDao;
import dao.UserDao;
import vo.JjimVo;
import vo.ProductVo;
import vo.UserVo;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext applicaton;
	
	ProductDao product_dao;
	JjimDao jjim_dao;
	UserDao user_dao;
	
	public MypageController(ProductDao product_dao, JjimDao jjim_dao, UserDao user_dao) {
		super();
		this.product_dao = product_dao;
		this.jjim_dao = jjim_dao;
		this.user_dao = user_dao;
	}

	
	@RequestMapping("myjjim.do")
	public String jjim_list(Model model, int u_idx) {
		
		List<JjimVo> jjim_list = jjim_dao.selectList(u_idx);
		
		List<ProductVo> product_list = new ArrayList<ProductVo>();
		
		for(JjimVo vo : jjim_list) {
			
			ProductVo vo2 = product_dao.selectListproduct(vo.getP_idx());
			
			product_list.add(vo2);
			
		}
		
		model.addAttribute("product_list",product_list);
		
		return "mypage/jjim_list";
	}
	
	
	@RequestMapping("myInfoModify_form.do")
	public String infoModify(Model model,int u_idx) {
		
		//유저정보 받아오기
		UserVo vo = user_dao.selectOneByIdx(u_idx);
		
		model.addAttribute("vo",vo);
		
		
		return "mypage/mypage_modify";
	}
	
	
	
}
