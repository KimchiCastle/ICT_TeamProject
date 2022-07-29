package dao;

import java.util.List;
import java.util.Map;

import vo.ProductVo;

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
	public Map countAnnualEnroll();

}
