package dao;

import org.apache.ibatis.session.SqlSession;

public class VisitDaoImpl implements VisitDao{

	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//admin mainpage 금일 방문자수 통계
	public int todayVisitCount() {
		
		return sqlSession.selectOne("visit.today_count");
	}

	//금일 첫 방문자일때
	public int todayVisitInsert() {
		
		return sqlSession.insert("visit.today_visitInsert");
	}
	
	//인터셉터에서 쿠키value 1인 쿠키가 있을때 + 금일 방문자수가 존재할때
	public int todayVisitUpdate(int count) {
		
		return sqlSession.update("visit.today_visitUpdate");
	}
	
}
