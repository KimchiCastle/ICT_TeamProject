package dao;

import org.apache.ibatis.session.SqlSession;

public class VisitDaoImpl implements VisitDao{

	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//admin mainpage ���� �湮�ڼ�
	public int todayVisitCount() {
		
		return sqlSession.selectOne("visit.today_count");
	}
	
}
