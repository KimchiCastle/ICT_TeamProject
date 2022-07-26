package dao;

import vo.VisitVo;

public interface VisitDao {
	
		//admin mainpage 금일 방문자수
		int todayVisitCount();
		
		//첫 방문자 유무 조회
		VisitVo todayVisitSelect();
		int todayVisitInsert();
		int todayVisitUpdate(int count);

}
