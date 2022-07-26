package dao;

import org.apache.ibatis.session.SqlSession;

import vo.VisitVo;

public class VisitDaoImpl implements VisitDao{

	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//admin mainpage 금일 방문자수 통계
	public int todayVisitCount() {
		
		return sqlSession.selectOne("visit.today_count");
	}
	
	//금일 첫 방문자 유무 조회
	public VisitVo todayVisitSelect() {
		
		return sqlSession.selectOne("visit.today_visit");
	}

	//금일 첫 방문자일때 방문자 record insert
	public int todayVisitInsert() {
		
		return sqlSession.insert("visit.today_visitInsert");
	}
	
	//인터셉터에서 쿠키value가 1인 쿠키가 있을때 + 금일 방문자수가 존재할때
	public int todayVisitUpdate(int count) {
		
		return sqlSession.update("visit.today_visitUpdate");
	}

	
	
	
}
