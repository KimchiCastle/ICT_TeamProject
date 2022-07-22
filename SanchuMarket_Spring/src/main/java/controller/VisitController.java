package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.visit.VisitDao;

@Controller
@RequestMapping("/visit/")
public class VisitController {
	
	VisitDao visit_dao;
	
	public void setVisit_dao(VisitDao visit_dao) {
		this.visit_dao = visit_dao;
	}

	public String todayVisitCount() {
		
		return "";
	}

}
