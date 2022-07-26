package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ChatDao;
import dao.ProductDao;
import dao.TradeDao;
import dao.UserDao;
import dao.VisitDao;
import vo.ChatVo;
import vo.ProductVo;

public class AdminServiceImpl implements AdminService {

	ProductDao product_dao;
	ChatDao chat_dao;
	TradeDao trade_dao;
	UserDao user_dao;
	VisitDao visit_dao;
	
	
	public AdminServiceImpl(ProductDao product_dao, ChatDao chat_dao, TradeDao trade_dao, UserDao user_dao,
			VisitDao visit_dao) {
		super();
		this.product_dao = product_dao;
		this.chat_dao = chat_dao;
		this.trade_dao = trade_dao;
		this.user_dao = user_dao;
		this.visit_dao = visit_dao;
	}

	@Override
	public Map list() {
		
		//실시간 상품&채팅 업로드(list한칸 안에 최근 vo객체 하나 들어가있음(최대 6개))
		List<ProductVo> p_list = product_dao.select_recent_product();
//		List<ChatVo> ch_list = chat_dao.SelectRecentList();
		
		//금일 상품업로드
		int today_p_count = product_dao.todayProductCount();
		
		//금일 거래량
//		int today_t_count = trade_dao.todayTradeCount();
		
		//금일 방문자수
		int today_v_count = visit_dao.todayVisitCount();
		
		//금일 가입자수
//		int today_u_count = user_dao.todayEnrollCount();

		Map map = new HashMap();
		
		map.put("p_list", p_list);
//		map.put("ch_list", ch_list);
		map.put("today_p_count",today_p_count);
//		map.put("today_t_count",today_t_count);
		map.put("today_v_count",today_v_count);
//		map.put("today_u_count",today_u_count);
		
		//service의 모든 joinpoint들이 advice로 넘어가는 로깅이 1.234초 후에 뜬다. 
		//list메소드 호출 간격을 1.234초 유지시키는것.
		/*
		 * try { Thread.sleep(1234); } catch (InterruptedException e) {
		 * e.printStackTrace(); }
		 */
		
		return map;
	}

}
