package dao;

import org.apache.ibatis.session.SqlSession;

public class TradeDaoImpl implements TradeDao{

	SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}



	//admin mainpage ���� �ŷ���
	public int todayTradeCount() {
		
		return sqlSession.selectOne("trade.today_count");
	}
}
