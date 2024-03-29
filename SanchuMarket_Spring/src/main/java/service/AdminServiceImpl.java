package service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.AdminDao;
import vo.CategoryVo;
import vo.ProductVo;
import vo.ReportVo;
import vo.UserVo;
import vo.WithdrawlVo;

public class AdminServiceImpl implements AdminService {

	
	AdminDao admin_dao;
	
	public void setAdmin_dao(AdminDao admin_dao) {
		this.admin_dao = admin_dao;
	}

	@Override
	public Map list() {
		
		//실시간 상품 업로드(list한칸 안에 최근 vo객체 하나 들어가있음(최대 6개))
		List<ProductVo> p_list = admin_dao.select_recent_product();
		
		//금일 상품업로드
		int today_p_count = admin_dao.todayProductCount();
		
		//금일 거래량
		int today_t_count = admin_dao.todayTradeCount();
		
		//금일 방문자수
		int today_v_count = admin_dao.todayVisitCount();
		
		//금일 가입자수
		int today_u_count = admin_dao.todayEnrollCount();
		
		
		/*
			카테고리 없는 상품이 있을 수 있으니 
			비지니스 로직 에서 처리
		*/
		
		
		//현재 상품 DB에 있는 카테고리별 상품개수 가지고옥
		List<CategoryVo> category_list = admin_dao.select_category_cnt();//4
		
		//현재 카테고리 DB에 있는 수 받아오기
		List<CategoryVo> list = admin_dao.select_category_list();//6
		
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
		
		
		//1. 년도별 회원 가입수
		List<UserVo> annual_enrollList = admin_dao.countAnnualEnroll();//DB에서불러온randomVO
		List<Integer> list2 = new ArrayList<>();//list의 월과 비교하기 위한 임시 배열
		
		for(int i = 0; i < annual_enrollList.size(); i++) {
			list2.add(annual_enrollList.get(i).getU_month());
		}
		
		//DB에서 불러온 list의 월이 12월 중 없으면 새로 월 주입(tot를 0으로 설정)
		for(int i = 1; i <= 12; i++) {
			if(!list2.contains(i)) {
				UserVo vo = new UserVo();
				vo.setU_month(i);
				vo.setU_tot(0);
				annual_enrollList.add(vo);
			}
		}
		
		//2. 년도별 회원 탈퇴수
		List<WithdrawlVo> annual_withdrawlList = admin_dao.countAnnualWithdrawl();//DB에서불러온randomVO
		List<Integer> list3 = new ArrayList<>();//list의 월과 비교하기 위한 임시 배열
		
		for(int i = 0; i < annual_withdrawlList.size(); i++) {
			list2.add(annual_withdrawlList.get(i).getW_month());
		}
		
		//DB에서 불러온 list의 월이 12월 중 없으면 새로 월 주입(tot를 0으로 설정)
		for(int i = 1; i <= 12; i++) {
			if(!list3.contains(i)) {
				WithdrawlVo vo = new WithdrawlVo();
				vo.setW_month(i);
				vo.setW_tot(0);
				annual_withdrawlList.add(vo);
			}
		}
	
		//월 정렬
		Collections.sort(annual_enrollList,new Comparator<UserVo>() {
			
			@Override
			public int compare(UserVo o1, UserVo o2) {
				
				return (o1.getU_month())-(o2.getU_month());
			}
		});
		
		Collections.sort(annual_withdrawlList,new Comparator<WithdrawlVo>() {
			
			@Override
			public int compare(WithdrawlVo o1, WithdrawlVo o2) {
				
				return (o1.getW_month())-(o2.getW_month());
			}
		});
			

		//신고 회원 조회
		List<ReportVo> r_list = admin_dao.select_reportUser();
		
		
		Map map = new HashMap();
		
		map.put("p_list", p_list);
		map.put("r_list", r_list);
		map.put("category_list", category_list);
		map.put("today_p_count",today_p_count);
		map.put("today_t_count",today_t_count);
		map.put("today_v_count",today_v_count);
		map.put("today_u_count",today_u_count);
		map.put("annual_enrollList", annual_enrollList);
		map.put("annual_withdrawlList", annual_withdrawlList);
		
	
		return map;
	}

}
