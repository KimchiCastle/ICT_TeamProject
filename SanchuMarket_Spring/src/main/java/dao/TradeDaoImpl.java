package dao;

import org.apache.ibatis.session.SqlSession;

public class TradeDaoImpl {

	SqlSession sqlSession;
	
	//admin mainpage 금일 거래량
	public int selectTodayCount() {
		
		return sqlSession.selectOne("trade.today_count");
	}
}
