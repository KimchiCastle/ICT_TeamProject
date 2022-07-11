package controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.image.ImageDao;
import dao.product.ProductDao;
import util.MyFileUpload;
import vo.image.ImageVo;

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
		
		
		return "product/insert";
	}
	
	// 포스트 타입으로 받음
	//폼데이터 안에 한꺼번에 많은 데이터가 오기때문에 다 파라미터로 받자..
	@ResponseBody
	@RequestMapping(value = "product_insert.do", method = RequestMethod.POST)
	public Map product_insert( MultipartFile sumimage,
	@RequestParam(value="imageFile1", required = false, defaultValue = "no_file") MultipartFile imageFile1, 
	@RequestParam(value="imageFile2", required = false, defaultValue = "no_file") MultipartFile imageFile2,
	@RequestParam(value="imageFile3", required = false, defaultValue = "no_file") MultipartFile imageFile3,
	@RequestParam(value="imageFile4", required = false, defaultValue = "no_file") MultipartFile imageFile4,
	@RequestParam(value="imageFile5", required = false, defaultValue = "no_file") MultipartFile imageFile5,
	int u_idx, String p_name, int c_idx, String p_location, String p_condition, int p_price, String p_exp) {
		
		String abs_path = applicaton.getRealPath("/resources/imgdata/");
		
		String sumimage_str = MyFileUpload.myFileUpload(abs_path, sumimage);
		String imageFile1_str = MyFileUpload.myFileUpload(abs_path, imageFile1);
		String imageFile2_str = MyFileUpload.myFileUpload(abs_path, imageFile2);
		String imageFile3_str = MyFileUpload.myFileUpload(abs_path, imageFile3);
		String imageFile4_str = MyFileUpload.myFileUpload(abs_path, imageFile4);
		String imageFile5_str = MyFileUpload.myFileUpload(abs_path, imageFile5);
		
		ImageVo imageVo = new ImageVo(sumimage_str, imageFile1_str, imageFile2_str, imageFile3_str, imageFile4_str, imageFile5_str);
		
		
		int res = image_dao.insert(imageVo);
		
		
		String p_status = "거래가능";
		
		
		return null;
	}
	
	
	
}
