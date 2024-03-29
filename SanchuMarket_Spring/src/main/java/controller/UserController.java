package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDao;
import vo.UserVo;
import vo.WithdrawlVo;

@Controller
@RequestMapping("/user/")
public class UserController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	UserDao user_dao;

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}

	@RequestMapping("check_email.do")
	@ResponseBody
	public Map checkEmail(String u_mail) {

		UserVo vo = user_dao.selectOneByEmail(u_mail);

		String result = "";

		// 아이디 존재하지 않을때 가입 가능
		if (vo == null) {
			result = "Y";
		} else {
			result = "N";
		}

		Map map = new HashMap();

		map.put("result", result);

		return map;
	}

	@RequestMapping("check_id.do")
	@ResponseBody
	public Map checkId(String u_id) {

		UserVo vo = user_dao.selectOneById(u_id);

		String result = "";

		// 아이디 존재하지 않을때 가입 가능
		if (vo == null) {
			result = "Y";
		} else {
			result = "N";
		}

		Map map = new HashMap();

		map.put("result", result);

		return map;
	}

	@RequestMapping("check_nickname.do")
	@ResponseBody
	public Map checkNickname(String u_nickname) {

		UserVo vo = user_dao.selectOneByNickname(u_nickname);

		String result = "";

		// 닉네임 존재하지 않을때 가입 가능
		if (vo == null) {
			result = "Y";
		} else {
			result = "N";
		}

		Map map = new HashMap();

		map.put("result", result);

		return map;
	}
	
	//마이페이지 탈퇴시 비밀번호 조회
	@RequestMapping("check_pwd.do")
	@ResponseBody
	public Map checkPwd(String u_pwd,
		@RequestParam(value="u_idx", required=false, defaultValue="0") int u_idx) {
		
		Map check = new HashMap();
		
		check.put("u_pwd", u_pwd);
		check.put("u_idx", u_idx);
		
		UserVo vo = user_dao.selectOneByPwd(check);
		
		String result = "";
		
		// 비밀번호로 계정 조회 실패시 탈퇴 불가 
		if (vo == null) {
			result = "N";
		} else {
			result = "Y";
		}
		
		Map map = new HashMap();
		
		map.put("result", result);
		
		return map;
	}

	@RequestMapping("enroll.do")
	public String enroll(String detail, String address, UserVo vo, Model model) {

		String u_ip = request.getRemoteAddr();

		// u_addr = 기본 주소 + 상세 주소
		StringBuilder sb = new StringBuilder();
		sb.append(address).append(" ").append(detail);
		String u_addr = sb.toString();

		vo.setU_ip(u_ip);
		vo.setU_addr(u_addr);

		int res = user_dao.insert(vo);

		if (res == 0) {
			model.addAttribute("reason", "failed_enroll");
			return "user/enroll_form.do";
		}

		return "redirect:../mainpage/list.do";
	}

	@RequestMapping("enroll_form.do")
	public String enrollForm() {

		return "user/enroll_form";
	}

	@RequestMapping("login.do")
	@ResponseBody
	public Map login(UserVo vo) {

		String u_id = vo.getU_id();
		String u_pwd = vo.getU_pwd();

		UserVo userVo = user_dao.selectOneById(u_id);

		String result = "";
		
//		 탈퇴된 회원이나 활동 정지된 회원 로그인 못하게
		if(userVo != null) {
			
			if (userVo.getU_status().equals("정지") || userVo.getU_status().equals("탈퇴")) {
				
				Map fail = new HashMap();
				
				String fail_reason = "fail_id";
				
				fail.put("fail_reason", fail_reason);
				
				return fail;
				
			}
			
		}
		
		//로그인 정보 조회 실패
		if (userVo == null || !u_pwd.equals(userVo.getU_pwd())) {
			result = "login_failed";
		}
		//일반회원
		else if(userVo.getU_grade().equals("일반회원")){
			HttpSession session = request.getSession();
			session.setAttribute("user", userVo);
			result = "user";
		}
		//관리자
		else if(userVo.getU_grade().equals("관리자")){
			HttpSession session = request.getSession();
			session.setAttribute("user", userVo);
			result = "admin";
		}
		


		Map map = new HashMap();

		map.put("result", result);


		return map;
	}

	@RequestMapping("login_form.do")
	public String loginForm() {

		return "user/login_form";
	}

	// 아이디 찾기
	@RequestMapping("findId.do")
	@ResponseBody
	public String findId(@RequestParam("name") String u_name, @RequestParam("phone") String u_tel) {
		
		
		UserVo vo = new UserVo();
		vo.setU_name(u_name);
		vo.setU_tel(u_tel);

		List<String> idList = user_dao.selectIdByNameTel(vo);
		// Map map = new HashMap();

		JSONArray jsonArr = new JSONArray();
		JSONObject json = new JSONObject();

		if (idList.size() >= 1) {

			for (int i = 0; i < idList.size(); i++) {
				// 정규식 마스킹
				String id = idList.get(i).replaceAll("(?<=.{5}).", "*");

				jsonArr.add(id);
			}

			json.put("id", jsonArr);
		} else {
			json.put("id", "noExist");
		}

		return json.toJSONString();
	}

	// 비밀번호찾기
	@RequestMapping("count_emailId.do")
	@ResponseBody
	public Map countEmailId(@RequestParam("id") String u_id, @RequestParam("email") String u_email) {

		UserVo vo = new UserVo();
		vo.setU_id(u_id);
		vo.setU_mail(u_email);

		int count = user_dao.countForFindPwd(vo);

		Map map = new HashMap();

		if (count == 0) {
			map.put("result", "noExist");
			return map;
		} else {
			map.put("result", "exist");
		}

		return map;
	}
	
	//회원상태 업데이트
	@RequestMapping("user_updateStatus.do")
	@ResponseBody
	public Map user_updateStatus(int u_idx, String u_status) {
		
		Map updateMap = new HashMap();
		
		System.out.println(u_status);
		System.out.println(u_idx);
		
		updateMap.put("u_status", u_status);
		updateMap.put("u_idx", u_idx);
		
		//탈퇴일땐 탈퇴 회원 테이블에도 저장
		if(u_status.equals("탈퇴")) {
			WithdrawlVo vo = new WithdrawlVo();
			vo.setU_idx(u_idx);
			
			int res2 = user_dao.insertWithdrawl(vo);
		
		//회원 상태 복구시킬때 탈퇴회원테이블에 삭제
		}else if(u_status.equals("활동")) {
			
			WithdrawlVo vo = new WithdrawlVo();
			vo.setU_idx(u_idx);
			
			int res2 = user_dao.deleteWithdrawl(vo);
			
		}
		
		//USER 테이블 업데이트
		int res = user_dao.updateStatus(updateMap);
		
		
		boolean result = (res==1);
		
		Map map = new HashMap();
		
		map.put("result", result);
		
		System.out.println(result);
		
		return map;	
	}

}
