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

import dao.ImageDao;
import dao.JjimDao;
import dao.ProductDao;
import dao.UserDao;
import dao.VisitDao;
import util.MyFileDelete;
import util.MyFileUpload;
import util.Mytime;
import vo.ImageVo;
import vo.JjimVo;
import vo.ProductVo;
import vo.UserVo;
import vo.VisitVo;

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
	UserDao user_dao;
	JjimDao jjim_dao;
	VisitDao visit_dao;
    

	public ProductController(ProductDao product_dao, ImageDao image_dao, UserDao user_dao, JjimDao jjim_dao,
			VisitDao visit_dao) {
		super();
		this.product_dao = product_dao;
		this.image_dao = image_dao;
		this.user_dao = user_dao;
		this.jjim_dao = jjim_dao;
		this.visit_dao = visit_dao;
	}

	/* 상품 등록 form 이동 */
	@RequestMapping("insert_form.do")
	public String insert_form()  {
		
		
		return "product/product_insert";
	}
	
	/* 
	포스트 타입으로 받음
	
	폼데이터 안에 한꺼번에 많은 데이터가 오기때문에 다 파라미터로 받자..   
	
	-------------------상품 입력 ------------------- */
	
	@RequestMapping(value = "product_insert.do", method = RequestMethod.POST)
	@ResponseBody
	public Map product_insert(
	@RequestParam(value="imagedata") MultipartFile [] imagedata, 
	int u_idx, String p_name, int c_idx, String p_location, String p_condition, int p_price, String p_exp) {
		
		
		//파라미터로 받은 ProductVo 생성자를통해 생성
		String p_status = "거래가능";
		
		
		//상품설명 줄바꿈 하기
		p_exp = p_exp.replaceAll("\r\n", "<br>");
		
		//		유저정보,카테고리,상풍명, 가격,  상품상태,  상품설명, 거래지역, 클릭수, 판매여부
		ProductVo productVo = new ProductVo(u_idx, c_idx, p_name, p_price, p_condition, p_exp, p_location,0,p_status);
		
		
		/*ProductDB에 Data 넣기
		먼저 DB에 넣는 이유는 p_idx를 구하기 위해서  */
		int res1 = product_dao.insert(productVo);
		//구해온 p_idx 변수에 할당
		int p_idx = product_dao.selectMaxIdx();
		
		
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
	public String product_modify_form(Model model,int p_idx){
		
		
		//나중에 상품 수정시, u_idx 확인절차 넣을 예정

		
		//파라미터로 받아온 p_idx로 상품 정보 1개 가져오기
		ProductVo vo = product_dao.selectList2(p_idx);
		
		// 줄바꿈 <br> => \r\n
		vo.setP_exp(vo.getP_exp().replaceAll("<br>", "\r\n")); 
		
		//model에 add
		model.addAttribute("vo", vo);

		
		return "product/product_modify_form";
	}
	
	/*  

		---------------상품 수정-------------
	
	*/

	@RequestMapping(value = "product_modify.do", method = RequestMethod.POST)
	@ResponseBody
	public Map product_modify(
	@RequestParam(value="imagedata") MultipartFile [] imagedata, int p_idx, String[] change_image,
	String p_name, int c_idx, String p_location, String p_condition, int p_price, String p_exp, int u_idx
	) {
		
		
		String abs_Path = applicaton.getRealPath("/resources/imgdata/");
		
		//나중에 파라미터로 받기
		
		
		List<String> upload_str = new ArrayList<String>();
		
		//일단 들어온 파일 전부 업로드
		for(MultipartFile file : imagedata) {
			
			//list에 업로드된 파일명 add
			upload_str.add(MyFileUpload.myFileUpload(abs_Path, file));
			
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
		
		
		int fileCnt = 0; // MutipartFile 파일명 인덱스용 카운트 변수
		
		for (int i = 0; i < change_image.length; i++) {

			// i가 짝수면
			if (i % 2 == 0) {

				// 수정된 사진이면
				if (!change_image[i].equals("changePhoto")) {
					
					//수정된 idx가 정수형이며, 초기화됐던 0이 아닐때
					if (change_image[i].matches("-?\\d+") && Integer.parseInt(change_image[i])!=0 && !change_image[i+1].equals("delPhoto")) {
						
						/* 
						 해당 idx에 대한 절대경로 이미지파일 삭제 
						 
						 DB에 저장되어 있는 파일명에 해당하는 실제 파일삭제
						 */
						ImageVo imgFileName = image_dao.selectOneImage(Integer.parseInt(change_image[i]));
						
						MyFileDelete.myFileDelete(abs_Path, imgFileName.getImagedata());
						
						
						Map updateInfo = new HashMap();
						
						updateInfo.put("i_idx", Integer.parseInt(change_image[i]));
						updateInfo.put("imagedata", upload_str.get(fileCnt));
						
						fileCnt++;
						//DB에 이미지 파일명 update
						int res = image_dao.imageUpdate(updateInfo);
						
					}

				// 추가된 사진이면
				} else {

					
					ImageVo imageVo = new ImageVo();
					imageVo.setP_idx(p_idx);
					imageVo.setImagedata(upload_str.get(fileCnt));
					
					
					fileCnt++;
					
					int res = image_dao.insert(imageVo);
					
					
				}
			
			//i가 홀수면..
			}else {
				//삭제된 파일이면
				if(change_image[i].equals("delPhoto")) {
					
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
	
	
	@RequestMapping("product_detail.do")
	public String productList(
			Model model,
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
				
		//p_idx로 상품 전체 가지고오기, 이미지도 다 가지고옴
		ProductVo vo = product_dao.selectList2(Integer.parseInt(p_idx));
		
		UserVo vo2 = user_dao.selectOneByIdx(vo.getU_idx());
		
		
		//시간 계산 메소드 사용
		vo.setP_time(Mytime.time_cal(vo));
		
		
		//유저정보와, 상품정보 둘다 binding
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
		
		//-----------------cookie를 기반으로 visitDB 관리----------------------
		
		//DB의 금일 방문자 유무 조회
		VisitVo visitVo = visit_dao.todayVisitSelect();
		
		//DB의 금일 방문자가 0이면 방문자수 default 1로 visitDB record생성
		if(visitVo == null) {
			
			visit_dao.todayVisitInsert();
		}
		//금일 방문자가 1명 이상이면 visitDB update
		else {
			
			if(Integer.parseInt(visitCookie.getValue()) == 1) {
				
				int todayVisitCount = visitVo.getV_count();
				
				int res = visit_dao.todayVisitUpdate(++todayVisitCount);
			}
		}
		
		
		
		return "product/product_detail";
	}
	
	
	/* 현재 본 상품 찜 상태 확인 */
	@RequestMapping("jjimCheck.do")
	@ResponseBody
	public Map jjimCheck(
			int p_idx, 
			@RequestParam(value="u_idx", required =false, defaultValue="0") int u_idx) {
		
		//파라미터로 받아온 값 찜테이블에 인서트
		Map check = new HashMap();
		
		check.put("p_idx", p_idx);
		check.put("u_idx", u_idx);
		
		//찜테이블에 이미 찜이 되어있는지 아닌지 체크
		JjimVo vo = jjim_dao.selectOne(check);
		
		Map map = new HashMap();
		
		/*	
			만약 vo가 null이 아니라면
		 	result에는 true값이 들어있음.
		 	vo가 null이라면, 즉 찜한게 없다면
		 	Map에는 false가 들어감 */
		boolean result = (vo!=null);
		
		/*	result가 트루면, 맵에 true값이 포장됨
			else false값이 포장
		*/
		if(result) {
			
			map.put("result", result);
			
		}else {
			
			map.put("result", result);
			
		}
		
		// jsonConvertor 로 json 자동으로 포장
		return map;
	}
	
	
	@RequestMapping("jjimon.do")
	@ResponseBody
	public Map jjimon(JjimVo vo) {
		
		//파라미터로 받아온 값 찜테이블에 인서트
		int res = jjim_dao.insert(vo);
		
		Map map = new HashMap();
		
		/*	만약 제대로 테이블에 
		 	값이 인서트 됐다면, result값에는 true 저장
		 */
		boolean result = (res==1);
		
		if(result) {
			
			map.put("result", result);
			
		}else {
			
			map.put("result", result);
			
		}
		
		return map;
	}
	
	@RequestMapping("jjimoff.do")
	@ResponseBody
	public Map jjimoff(JjimVo vo) {
		
		//파라미터로 받아온 값 찜테이블에 인서트
		int res = jjim_dao.delete(vo);
		
		Map map = new HashMap();
		
		boolean result = (res==1);
		
		if(result) {
			
			map.put("result", result);
			
		}else {
			
			map.put("result", result);
			
		}
		
		return map;
	}
	
	
	
	
}
