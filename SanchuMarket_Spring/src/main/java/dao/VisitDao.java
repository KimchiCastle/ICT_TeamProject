package dao;

import vo.VisitVo;

public interface VisitDao {
	
		
		//첫 방문자 유무 조회
		VisitVo todayVisitSelect();
		int todayVisitInsert();
		int todayVisitUpdate(int count);

}
