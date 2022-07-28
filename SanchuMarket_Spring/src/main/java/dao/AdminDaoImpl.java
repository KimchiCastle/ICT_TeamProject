package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVo;

public class AdminDaoImpl implements AdminDao{

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Admin 페이지 최근상품 6개 조회
	@Override
	public List<ProductVo> select_recent_product() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.recent_product_six");
	}	
	
	//admin mainpage금일 상품 업로드량
	@Override
	public int todayProductCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.today_count");
	}
	
	//최근 상품 업로드 게시물 6개 조회
	@Override
	public List<ProductVo> selectRecentList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.recent_product");
	}
		
	//admin mainpage 금일 거래량
	public int todayTradeCount() {
		
		return sqlSession.selectOne("trade.today_count");
	}	
		
	//admin mainpage 금일 방문자수 통계
	public int todayVisitCount() {
		
		return sqlSession.selectOne("visit.today_count");
	}	
		
	//admin mainpage 금일 가입수
	public int todayEnrollCount() {
		
		return sqlSession.selectOne("user.enroll_count");
	}	
	
	//vo객체를 비효율적으로 만들지 않기 위해 map으로 포장.
	public Map<String,String> countAnnualEnroll() {
		
		return sqlSession.selectMap("user.count_enroll","");
	}


}
