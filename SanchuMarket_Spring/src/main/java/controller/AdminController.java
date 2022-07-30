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

import common.MyConstant;
import dao.AdminDao;
import service.AdminService;
import util.Paging;
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
	public String userList(@RequestParam(value="page", required=false, defaultValue="1") int nowPage, 
																						Model model) {
		
	    int start = (nowPage-1) * MyConstant.UserList.BLOCK_LIST + 1;
	    int end = start + MyConstant.UserList.BLOCK_LIST - 1;
	    
	    int rowTotal = admin_dao.count_userList();
	    
	    String pageMenu = Paging.getPaging("user_listForm.do", 
							                nowPage,
							                rowTotal,
							                MyConstant.UserList.BLOCK_LIST,
							                MyConstant.UserList.BLOCK_PAGE
							                );
	    
	    Map map = new HashMap();
	    map.put("start", start);
	    map.put("end", end);
	    
	    List<UserVo> userList = admin_dao.select_userList(map);
	    
	    System.out.println(userList.size());
	    
	    for(int i = 0; i < userList.size(); i++) {
	    	System.out.printf("username:%s\n",userList.get(i).getU_name());
	    	System.out.printf("userid:%s\n",userList.get(i).getU_id());
	    	System.out.printf("userstatus:%s\n",userList.get(i).getU_status());
	    }
	    
		model.addAttribute("userList", userList);
		model.addAttribute("pageMenu", pageMenu);
		
		return "admin/user_list";
	}
	
		
	
	 
	 
	
	
}
