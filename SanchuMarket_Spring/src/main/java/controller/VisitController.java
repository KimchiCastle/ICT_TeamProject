package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.VisitDao;

@Controller
@RequestMapping("/visit/")
public class VisitController {
	
	VisitDao visit_dao;
	
	public void setVisit_dao(VisitDao visit_dao) {
		this.visit_dao = visit_dao;
	}
	
	//admin 방문자수 통계 조회
	@RequestMapping("todayVisitCount.do")
	public int todayVisitCount() {
		
		int count = visit_dao.todayVisitCount();
		
		return count;
	}
	
	@RequestMapping("todayVisitInsert.do")
	public int todayVisitInsert() {
		
		int res = visit_dao.todayVisitInsert();
		
		return res;
	}
	
	@RequestMapping("todayVisitUpdate.do")
	public int todayVisitUpdate(int count) {
		
		int res = visit_dao.todayVisitUpdate(count);
		
		return res;
	}

}
