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
		
		//�ǽð� ��ǰ&ä�� ���ε�(list��ĭ �ȿ� �ֱ� vo��ü �ϳ� ������(�ִ� 6��))
		List<ProductVo> p_list = product_dao.selectList();
		List<ChatVo> ch_list = chat_dao.SelectRecentList();
		
		//���� ��ǰ���ε�
		int today_p_count = product_dao.todayProductCount();
		
		//���� �ŷ���
		int today_t_count = trade_dao.todayTradeCount();
		
		//���� �湮�ڼ�
		int today_v_count = visit_dao.todayVisitCount();
		
		//���� �����ڼ�
		int today_u_count = user_dao.todayEnrollCount();

		Map map = new HashMap();
		
		map.put("p_list", p_list);
		map.put("ch_list", ch_list);
		map.put("today_p_count",today_p_count);
		map.put("today_t_count",today_t_count);
		map.put("today_v_count",today_v_count);
		map.put("today_u_count",today_u_count);
		
		//service�� ��� joinpoint���� advice�� �Ѿ�� �α��� 1.234�� �Ŀ� ���. 
		//list�޼ҵ� ȣ�� ������ 1.234�� ������Ű�°�.
		/*
		 * try { Thread.sleep(1234); } catch (InterruptedException e) {
		 * e.printStackTrace(); }
		 */
		
		return map;
	}

}
