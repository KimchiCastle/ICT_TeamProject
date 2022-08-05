package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.MyConstant;
import dao.AdminDao;
import service.AdminService;
import util.Paging;
import vo.ReportVo;
import vo.UserVo;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	 @Autowired 
	 ServletContext application;
	  
	 @Autowired 
	 HttpSession session;
		  
	 @Autowired 
	 HttpServletRequest request;
	 
	 AdminDao admin_dao;
	 
	 public void setAdmin_dao(AdminDao admin_dao) {
		this.admin_dao = admin_dao;
	}
	 
	AdminService adminService;

	 public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("main_form.do")
	 public String list(Model model) {
		
		Map serviceMap = adminService.list();
		model.addAttribute("serviceMap", serviceMap);
		
		return "admin/mainpage_admin";
	 }
	
	//admin page호출시 두 경로 제공
	@RequestMapping("select_admin_form.do")
	public String selectList() {
		
		return "admin/select_admin";
	}
	
	//유저관리
	@RequestMapping("user_listForm.do") //nowPage는 page가 param에 없으면 처음 들어갈때이므로 1의 default값을 가짐.
	public String userList(@RequestParam(value="page", required=false, defaultValue="1")    int nowPage,
					       @RequestParam(value="search", required=false, defaultValue="all")String search,													
					       @RequestParam(value="search_text", required=false)String search_text,													
																			  Model model) {
		
		
		//1.넘어온 페이지를 이용해 페이지의 start/end 갱신
	    int start = (nowPage-1) * MyConstant.UserList.BLOCK_LIST + 1;
	    int end = start + MyConstant.UserList.BLOCK_LIST - 1;
	    
	    
	    Map map = new HashMap();
	    map.put("start", start);
	    map.put("end", end);
	    
	   
	    //2-1.검색 결과 필터링 처리
    	if(!search.equals("all")) {
		
    	    if(search.equals("u_id")) {
    			map.put("u_id", search_text);
    		}
    	    else if(search.equals("u_name")) {
    	    	map.put("u_name", search_text);
    	    }
    		else if(search.equals("u_nickname")) {
				map.put("u_nickname", search_text);
			}
    		else if(search.equals("u_tel")) {
    			map.put("u_tel", search_text);
    		}
			else if(search.equals("u_status")) {
				map.put("u_status", search_text);
			}
    	}
    
    	 //전체 글 수(필터링 타입, 값에 따라 달라짐)
	    int rowTotal = admin_dao.count_userList(map);
	    
	    
	    //2-2.검색 결과에 따른 페이징
  		String search_filter = String.format("search=%s&search_text=%s", search,search_text);
	    
	    String pageMenu = Paging.getPaging("user_listForm.do", 
	    									search_filter,
							                nowPage,
							                rowTotal,
							                MyConstant.UserList.BLOCK_LIST,
							                MyConstant.UserList.BLOCK_PAGE
							                );
	    
	  
	    //2-3.페이징마다 할당되는 유저 목록 추출
	    List<UserVo> userList = admin_dao.select_userList(map);
	    
	    
		model.addAttribute("userList", userList);
		model.addAttribute("pageMenu", pageMenu);
		
		return "admin/user_list";
	}
	
	//신고 횟수 합산
	@RequestMapping("check_reportCnt.do")
	public String reportCnt(int u_idx_reported, int r_idx, Model model){
		
		int r_cnt = admin_dao.select_reportCnt(u_idx_reported);
		ReportVo r_list = admin_dao.select_reportUser2(r_idx);
		
		model.addAttribute("r_cnt",r_cnt);
		model.addAttribute("r_list",r_list);
		
		return "admin/report_cnt";
	}
	
	
}
