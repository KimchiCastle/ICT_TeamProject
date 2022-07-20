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
import util.MyFileDelete;
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
		
		//상품설명 줄바꿈 하기
		p_exp = p_exp.replaceAll("\r\n", "<br>");
		
		//								 유저정보,카테고리,상풍명, 가격,  상품상태,  상품설명, 거래지역, 클릭수, 판매여부
		ProductVo productVo = new ProductVo(u_idx, c_idx, p_name, p_price, p_condition, p_exp, p_location,0,p_status);
		
		//ProductDB에 Data 넣기
		//먼저 DB에 넣는 이유는 p_idx를 구하기 위해서
		int res1 = product_dao.insert(productVo);
		int p_idx = product_dao.selectMaxIdx();
		
		/* System.out.println(p_idx); */
		
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
	
	@RequestMapping("modify_form.do")
	public String product_modify_form(Model model){
		
		
		//나중에 상품 수정시, u_idx 확인절차 넣을 예정

		//임시로 p_idx 1로 설정 파라미터로 받기 수정예정
		int p_idx=1;
		
		//파라미터로 받아온 p_idx로 상품 정보 1개 가져오기
		ProductVo vo = product_dao.selectList2(p_idx);
		
		// 줄바꿈 <br> => \r\n
		vo.setP_exp(vo.getP_exp().replaceAll("<br>", "\r\n")); 
		
		//model에 add
		model.addAttribute("vo", vo);

		
		return "product/product_modify_form";
	}
	
	

	@ResponseBody
	@RequestMapping(value = "product_modify.do", method = RequestMethod.POST)
	public Map product_modify(
	@RequestParam(value="imagedata") MultipartFile [] imagedata, int p_idx, String[] change_image,
	String p_name, int c_idx, String p_location, String p_condition, int p_price, String p_exp
	) {
		
		
		String abs_Path = applicaton.getRealPath("/resources/imgdata/");
		
		//나중에 파라미터로 받기
		int u_idx = 3;
		
		List<String> upload_str = new ArrayList<String>();
		
		//일단 들어온 파일 전부 업로드
		for(MultipartFile file : imagedata) {
			
			//list에 업로드된 파일명 add
			upload_str.add(MyFileUpload.myFileUpload(abs_Path, file));
//			upload_str.add(file.getOriginalFilename());
			
		}
		
		
		//파라미터로 받은 ProductVo 생성자를통해 생성
		String p_status = "거래가능";
		
		//상품설명 줄바꿈 하기
		p_exp = p_exp.replaceAll("\r\n", "<br>");
		
		
		//								 유저정보,카테고리,상풍명, 가격,  상품상태,  상품설명, 거래지역, 클릭수, 판매여부
		ProductVo vo = new ProductVo(u_idx, c_idx, p_name, p_price, p_condition, p_exp, p_location,0,p_status);
		
		//수정될 상품번호 객체에 포장
		vo.setP_idx(p_idx);

		
		/*
			이미지수정, 이미지 삭제, 이미지 업로드 조건별로 실행
			
			change_image[] 배열길이는 12로 초기화 되어있고, 내부 값은 0임(문자열)
			
			일단 이미지를 전부다 등록하고, 그후에 수정된(삭제 포함) 정보는
			
			DB에서 꺼내와 실제 데이터와 DB 삭제
		*/
		for (int i = 0; i < change_image.length; i++) {

			// i가 짝수면
			if (i % 2 == 0) {

				// 수정된 사진이면
				if (!change_image[i].equals("changePhoto")) {
					
					//수정된 idx가 정수형이며, 초기화됐던 0이 아닐때
					if (change_image[i].matches("-?\\d+") && Integer.parseInt(change_image[i])!=0 && !change_image[i+1].equals("delPhoto")) {
//						System.out.printf("%s이 이미지는 수정되었습니다.%s 해당번호에 수정해주세요\n", change_image[i + 1], change_image[i]);
						
						/* 
						 해당 idx에 대한 절대경로 이미지파일 삭제 
						 
						 DB에 저장되어 있는 파일명에 해당하는 실제 파일삭제
						 */
						ImageVo imgFileName = image_dao.selectOneImage(Integer.parseInt(change_image[i]));
						
						MyFileDelete.myFileDelete(abs_Path, imgFileName.getImagedata());
						
						
						Map updateInfo = new HashMap();
						
						updateInfo.put("i_idx", Integer.parseInt(change_image[i]));
						updateInfo.put("imagedata", change_image[i + 1]);
						//DB에 이미지 파일명 update
						int res = image_dao.imageUpdate(updateInfo);
						
					}

				// 추가된 사진이면
				} else {

//					System.out.printf("%s이 이미지는 추가되었습니다. %s 해당번호는 추가해주세요\n", change_image[i + 1],change_image[i]);
					
					ImageVo imageVo = new ImageVo();
					imageVo.setP_idx(p_idx);
					imageVo.setImagedata(change_image[i + 1]);
					
					int res = image_dao.insert(imageVo);
					
					
				}
			
			//i가 홀수면..
			}else {
				//삭제된 파일이면
				if(change_image[i].equals("delPhoto")) {
//					System.out.printf("%s 이 idx에 해당하는 이미지는 삭제되었습니다 삭제해주세요.\n",change_image[i-1]);
					
					ImageVo imgFileName = image_dao.selectOneImage(Integer.parseInt(change_image[i-1]));
					
					//실제 파일 삭제
					MyFileDelete.myFileDelete(abs_Path, imgFileName.getImagedata());
					
					//DB삭제
					int res = image_dao.deleteImage(Integer.parseInt(change_image[i-1]));
				}
			}

		}

		
		//앞서 선언한, 수정된 정보 포장된 vo객체, DB 업데이트
		int res2 = product_dao.update(vo);
		
		
		//JsonConverter 사용하기 위한 Map생성
		Map map = new HashMap();

		//기본 리턴값 false
		//만약 상품수정 됐으면..
		boolean bResult = (res2==1);
		
		//맵에 result값 넣기
		map.put("res", bResult);
		
		return map;
	}
	
	
	@RequestMapping("poduct_detail.do")
	public String productList(Model model) {
		
		//p_idx 파라미터로 받아야함, 일단 임시로 1번상품
		
		int p_idx = 1;
		
		ProductVo vo = product_dao.selectList2(p_idx);
		
		vo.setP_exp(vo.getP_exp().replaceAll("<br>", "\r\n"));
		
		model.addAttribute("vo", vo);
		
		
		return "product/product_detail";
	}
	
}
