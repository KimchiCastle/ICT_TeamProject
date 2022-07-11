package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.chat.ChatDao;
import dao.product.ProductDao;
import dao.trade.TradeDao;
import vo.chat.ChatVo;
import vo.product.ProductVo;

public class AdminServiceImpl implements AdminService {

	ProductDao product_dao;
	ChatDao chat_dao;
	TradeDao trade_dao;
	


	public AdminServiceImpl(ProductDao product_dao, ChatDao chat_dao, TradeDao trade_dao) {
		super();
		this.product_dao = product_dao;
		this.chat_dao = chat_dao;
		this.trade_dao = trade_dao;
	}


	@Override
	public Map list() {
		
		//실시간 상품&채팅 업로드(list한칸 안에 최근 vo객체 하나 들어가있음(최대 6개))
		List<ProductVo> p_list = product_dao.selectList();
		List<ChatVo> ch_list = chat_dao.SelectRecentList();
		
		//금일 상품업로드
		int today_p_count = product_dao.selectTodayCount();
		
		//금일 거래량
		int today_t_count = trade_dao.selectTodayCount();

		Map map = new HashMap();
		
		map.put("p_list", p_list);
		map.put("ch_list", ch_list);
		map.put("today_p_count",today_p_count);
		map.put("today_t_count",today_t_count);
		
		//service의 모든 joinpoint들이 advice로 넘어가는 로깅이 1.234초 후에 뜬다. 
		//list메소드 호출 간격을 1.234초 유지시키는것.
		/*
		 * try { Thread.sleep(1234); } catch (InterruptedException e) {
		 * e.printStackTrace(); }
		 */
		
		return map;
	}

}
