package service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ChatDao;
import dao.ProductDao;
import dao.TradeDao;
import dao.UserDao;
import dao.VisitDao;
import vo.CategoryVo;
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
		int today_t_count = trade_dao.todayTradeCount();
		
		//금일 방문자수
		int today_v_count = visit_dao.todayVisitCount();
		
		//금일 가입자수
		int today_u_count = user_dao.todayEnrollCount();
		
		
		/*
			카테고리 없는 상품이 있을 수 있으니 
			비지니스 로직 에서 처리
		*/
		
		
		
		
		//현재 상품 DB에 있는 카테고리별 상품개수 가지고옥
		List<CategoryVo> category_list = product_dao.select_category_cnt();//4
		
		//현재 카테고리 DB에 있는 수 받아오기
		List<CategoryVo> list = product_dao.select_category_list();//6
		
		// 카테고리 사이즈 크기 지정
		List<Integer> categorysize = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++) {
			categorysize.add(i+1);
		}
		
		//상품 사이즈 크기 지정
		List<Integer> productsize = new ArrayList<Integer>();		
		
		for(int i=0; i<category_list.size(); i++) {
			productsize.add(category_list.get(i).getC_idx());
		}
		
		
		for(int i=0; i<categorysize.size(); i++) {
			
			//
			if(!productsize.contains(categorysize.get(i))) {
				CategoryVo vo = new CategoryVo(i+1, 0);
				category_list.add(vo);
			}
			
		}
		
		//객체 정렬하기
		Collections.sort(category_list, new Comparator<CategoryVo>() {

			@Override
			public int compare(CategoryVo o1, CategoryVo o2) {
				// TODO Auto-generated method stub
				
				return o1.getC_idx()-o2.getC_idx();
			}
		});
		
		
	
		
		
	
		
		//년도별 회원 가입탈퇴수
		//Map annual_enroll_count = user_dao.countAnnualEnroll();

		Map map = new HashMap();
		
		map.put("p_list", p_list);
		map.put("category_list", category_list);
		map.put("today_p_count",today_p_count);
		map.put("today_t_count",today_t_count);
		map.put("today_v_count",today_v_count);
		map.put("today_u_count",today_u_count);
		
		
		//service의 모든 joinpoint들이 advice로 넘어가는 로깅이 1.234초 후에 뜬다. 
		//list메소드 호출 간격을 1.234초 유지시키는것.
		/*
		 * try { Thread.sleep(1234); } catch (InterruptedException e) {
		 * e.printStackTrace(); }
		 */
		
		return map;
	}

}
