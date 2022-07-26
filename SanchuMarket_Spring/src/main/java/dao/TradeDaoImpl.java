package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.TradeVo;

public class TradeDaoImpl implements TradeDao{

	SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	//admin mainpage 금일 거래량
	public int todayTradeCount() {
		
		return sqlSession.selectOne("trade.today_count");
	}


	@Override
	public int tradeInsert(TradeVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("trade.trade_insert",vo);
	}


	@Override
	public int statusUpdate(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("trade.trade_update", map);
	}
	
	
	
}
