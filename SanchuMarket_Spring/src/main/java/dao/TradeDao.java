package dao;

import java.util.Map;

import vo.TradeVo;

public interface TradeDao {

	
	
	public int tradeInsert(TradeVo vo);

	public int statusUpdate(Map Map);

}
