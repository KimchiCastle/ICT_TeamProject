package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import dao.JjimDao;
import dao.ProductDao;
import dao.UserDao;
import util.MyFileDelete;
import util.MyFileUpload;
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
	public String infoModifyForm(Model model,int u_idx) {
		
		//유저정보 받아오기
		UserVo vo = user_dao.selectOneByIdx(u_idx);
		
		vo.setU_profile(vo.getU_profile().replaceAll("<br>", "\r\n"));
		
		
		model.addAttribute("vo",vo);
		
		
		return "mypage/mypage_modify";
	}
	
	@RequestMapping("myInfoModify.do")
	@ResponseBody
	public Map infoModify(
			@RequestParam(value="u_photo", required=false) MultipartFile photo,
			@RequestParam(value="Delimg", required=false, defaultValue="이미지") String Delimg,
			int u_idx, String u_name, String u_birth, String u_tel,
			String u_profile, String postcode, String u_addr
			) {
		
		Map map = new HashMap();
		boolean result = false;
		boolean imgUp = false;
		
		
		//절대경로 구하기
		String absPath = applicaton.getRealPath("/resources/imgdata/");
		
		
		//수정전 회원정보 받아오기
		UserVo uVo = user_dao.selectOneByIdx(u_idx);
		
		
		String u_photo = "no_file";
		

		
		//회원 이미지 등록할때!
		if(uVo.getU_photo().equals("no_file") && photo!=null) {
			
			//실제 파일 업로드 
			u_photo = MyFileUpload.myFileUpload(absPath, photo);
			
			//이미지 등록 ON
			imgUp = true;
		
			
		//회원 이미지를 수정할때!
		}else if(!uVo.getU_photo().equals("no_file")&& photo!=null ) {
			
			//원래 등록된 이미지 삭제(절대경로)
			MyFileDelete.myFileDelete(absPath, uVo.getU_photo());
			
			//새로 들어온 이미지 업로드
			u_photo = MyFileUpload.myFileUpload(absPath, photo);
			
			//이미지 등록 ON
			imgUp = true;
			
		}
		
		//회원이 이미지를 삭제하고자 할때
		if(Delimg.equals("이미지삭제") && !uVo.getU_photo().equals("no_file") && photo==null ) {
			
			MyFileDelete.myFileDelete(absPath, uVo.getU_photo());
			imgUp = true;
		}
		
		
		UserVo userVo = null;
		int res = 0;
		
		if(imgUp) {
			
			userVo = new UserVo(u_idx, u_name, u_birth, u_addr, u_profile.replaceAll("\r\n", "<br>"),
					u_photo, u_tel, postcode);
			
			res = user_dao.updateInfo(userVo);
			
		}else if(!imgUp){
			
			userVo = new UserVo(u_idx, u_name, u_birth, u_addr, u_profile.replaceAll("\r\n", "<br>"),
					u_tel, postcode);
			
			res = user_dao.updateInfoNoImg(userVo);
			
		}
		
		
		result = (res==1);
		
		 
		map.put("result", result);
		
		return map;
		
	}
	
	
}
