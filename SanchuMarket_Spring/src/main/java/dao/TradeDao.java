package dao;

import vo.TradeVo;

public interface TradeDao {

	
	//admin mainpage 금일 거래량
	public int todayTradeCount();
	
	public int tradeInsert(TradeVo vo);

}
