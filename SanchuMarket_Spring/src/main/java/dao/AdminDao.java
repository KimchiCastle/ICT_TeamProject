package dao;

import java.util.List;
import java.util.Map;

import vo.CategoryVo;
import vo.ProductVo;
import vo.UserVo;
import vo.WithdrawlVo;

public interface AdminDao {

	
	//최근 상품 조회
	public List<ProductVo> selectRecentList();

	//최근 올라온 상품 6개 조회
	public List<ProductVo> select_recent_product();
	
	//상품업로드
	public int todayProductCount();

	//금일 거래량
	public int todayTradeCount();

	//금일 방문자수
	int todayVisitCount();

	//금일 가입수
	public int todayEnrollCount();
	
	//년도별 가입자수
	public List<UserVo> countAnnualEnroll();
	
	//년도별 탈퇴자수
	public List<WithdrawlVo> countAnnualWithdrawl();
	
	//카테고리에 해당하는 상품 개수 받아오기
	public List<CategoryVo> select_category_cnt();
	
	//전체 카티고리가 총 몇갠지 받아오기
	public List<CategoryVo> select_category_list();
	
	//유저관리 - 페이징을 위한 5개 조건으로 유저 조회
	public List<UserVo> select_userList(Map map);
	
	////유저관리 - 검색 조건별로 페이징을 위한 start-end count
	public int count_userList(Map map);

	

}
