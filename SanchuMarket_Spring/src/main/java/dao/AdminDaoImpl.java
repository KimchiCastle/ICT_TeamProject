package dao;

import org.apache.ibatis.session.SqlSession;

public class AdminDaoImpl {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
}
