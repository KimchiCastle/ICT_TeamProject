package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ProductDao;
import dao.UserDao;
import util.Mytime;
import vo.ProductVo;
import vo.ReportVo;
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
	public String seller_list(Model model, int u_idx) {
		
		//판매자가 올린 판매상품 전체 조회
		List<ProductVo> product_list = product_dao.selectList(u_idx);
		
		//선택한 판매자 정보 알아오기(+ 가입날짜도)
		UserVo user_info = user_dao.selectOneByIdxTime(u_idx);
		
		//시간 계산 메서드 
		Mytime.time_cal(product_list);
		
		//가입날짜 구하기 메서드
		String u_time = user_info.getU_time();
		int u_time_int = (Integer.parseInt(u_time)/84000);
		u_time = String.format("%d", u_time_int);
		
		//구한 값 다시 판매자 정보에 넣음
		user_info.setU_regdate(u_time);
		
		//content 를 include 했기때문에 list이름으로 request binding 해야 한다.
		model.addAttribute("list",product_list);
		model.addAttribute("user_info",user_info);

		
		return "sellerpage/seller_page";
	}
	

	@RequestMapping("check_reportHistory.do")
	@ResponseBody
	public Map checkReportHistory(ReportVo vo) {
		
		//신고자가 동일 인물을 신고한 이력 조회해서
		int reportCnt = user_dao.checkReportHistory(vo);
		
		Map map = new HashMap();
		boolean bResult = false;
		
		//신고 이력이 없을시 true(신고가능)
		if(reportCnt==0) {
			bResult = true;
		}
		
		map.put("result", bResult);
		return map;
	}
	
	@RequestMapping("report.do")
	@ResponseBody
	public Map report(ReportVo vo) {
		
		
		int res = user_dao.insertReportedUser(vo);
		
		String result;
		Map map = new HashMap();
		
		if(res == 1) {
			result = "report_success";
		}else {
			result = "report_failed";
		}
		
		map.put("result", result);
		
		return map;
	}
	
	
}
