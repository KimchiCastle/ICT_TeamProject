package controller;

import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.image.ImageDao;
import dao.product.ProductDao;
import util.MyFileUpload;
import vo.image.ImageVo;
import vo.product.ProductVo;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext applicaton;
	
	ProductDao product_dao;
	ImageDao image_dao;

	public ProductController(ProductDao product_dao, ImageDao image_dao) {
		super();
		this.product_dao = product_dao;
		this.image_dao = image_dao;
	}
	
	//나중에 쿠키생성은 상품페이지 눌렀을때 만들도록 수정 할예정
	@RequestMapping("insert_form.do")
	public String insert_form(
			@RequestParam(value ="p_idx",required = false, defaultValue="null") String p_idx,
			@RequestParam(value ="p_name",required = false, defaultValue="null")String p_name
			) throws Exception {
		
		//만약 들어온 파라미터 값이 null이 아니면
		if(!p_idx.equals("null")) {
			
			
			//쿠키 생성 key = p_idx , value = p_name
			//한글(유니코드문제)로 쿠키에 들어가지 못하기 때문에 URLEncoder 사용
			Cookie cookie = new Cookie(p_idx, URLEncoder.encode(p_name, "utf-8"));
			
			
			//쿠키는 지정한 경로의 하위경로에서만 쿠키에 접근 가능
			cookie.setPath("/sanchumarket/");
			
			
			//쿠키응답
			response.addCookie(cookie);
			
		}
		
		
		return "product/product_insert";
	}
	
	// 포스트 타입으로 받음
	//폼데이터 안에 한꺼번에 많은 데이터가 오기때문에 다 파라미터로 받자..
	@ResponseBody
	@RequestMapping(value = "product_insert.do", method = RequestMethod.POST)
	public Map product_insert(
	@RequestParam(value="imagedata") MultipartFile [] imagedata, 
	int u_idx, String p_name, int c_idx, String p_location, String p_condition, int p_price, String p_exp) {
		
		//파라미터로 받은 ProductVo 생성자를통해 생성
		String p_status = "거래가능";
		
		//								 유저정보,카테고리,상풍명, 가격,  상품상태,  상품설명, 거래지역, 클릭수, 판매여부
		ProductVo productVo = new ProductVo(u_idx, c_idx, p_name, p_price, p_condition, p_exp, p_location,0,p_status);
		
		//ProductDB에 Data 넣기
		//먼저 DB에 넣는 이유는 p_idx를 구하기 위해서
		int res1 = product_dao.insert(productVo);
		int p_idx = product_dao.selectMaxIdx();
		
		System.out.println(p_idx);
		
		int res2 = 0;
		
		//절대경로 구함
		String abs_path = applicaton.getRealPath("/resources/imgdata/");
		
		//for each문 사용 배열을 통해 이미지데이터 들어옴
		for(MultipartFile img : imagedata) {
			
			//파일업로드 메서드 사용
			String img_str = MyFileUpload.myFileUpload(abs_path, img);
			
			//이미지 Vo 생성
			ImageVo imageVo = new ImageVo();
			
			//이미지Vo에 이미지 파일명 넣기
			imageVo.setImagedata(img_str);
			imageVo.setP_idx(p_idx);
			//실제 DB에 넣기
			res2 = image_dao.insert(imageVo);
			
		}
		
		//JsonConverter 사용하기 위한 Map생성
		Map map = new HashMap();

		//기본 리턴값 false
		boolean bResult = false;
		
		//만약 상품등록과 이미지등록이 됐으면..
		if(res1==1 && res2==1) {
			
			//리턴값 true 로 변경
			bResult = true;
			
		}
		//맵에 result값 넣기
		map.put("res", bResult);
		
		return map;
	}
	
	@RequestMapping("product_modify_form.do")
	public String product_modify_form(int p_idx, Model model){
		
		ProductVo vo = product_dao.
		
		
		
		return "product_modify_form";
	}
	
}
