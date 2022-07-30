package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.TradeVo;

public class TradeDaoImpl implements TradeDao{

	SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//거래테이블 등록
	@Override
	public int tradeInsert(TradeVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("trade.trade_insert",vo);
	}

	//상품 상태 업데이트
	@Override
	public int statusUpdate(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("trade.trade_update", map);
	}
	
	
	//방문자가 구매하는지??
	@Override
	public TradeVo select_user(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trade.trade_select",map);
	}
	
	//거래 취소
	@Override
	public int delete(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("trade.trade_cancel", p_idx);
	}
	
	
	
}
