package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CategoryVo;
import vo.ProductVo;
import vo.ReportVo;
import vo.UserVo;
import vo.WithdrawlVo;

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
	
	
	public List<UserVo> countAnnualEnroll() {
		
		return sqlSession.selectList("user.annual_enroll_count");
	}
	
	@Override
	public List<WithdrawlVo> countAnnualWithdrawl() {
		
		return sqlSession.selectList("user.annual_withdrawl_count");
	}
	
	//카테고리에 해당하는 상품 개수 받아오기
	@Override
	public List<CategoryVo> select_category_cnt() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_categorycnt");
	}
	
	
	//전체 카티고리가 총 몇갠지 받아오기
	@Override
	public List<CategoryVo> select_category_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_categorynum");
	}
	
	//유저관리 - 페이징을 위한 start-end 조건으로 유저 조회
	public List<UserVo> select_userList(Map map){
		
		return sqlSession.selectList("user.user_conditionList", map);
	}
	
	//유저관리 - 페이징을 위한 start-end를 검색 조건별로 조회
	public int count_userList(Map map) {
		
		return sqlSession.selectOne("user.user_list",map);
	}

	//최근 신고 유저 조회
	@Override
	public List<ReportVo> select_reportUser() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.report_userList");
	}
	//신고 횟수 합산
	@Override
	public int select_reportCnt(int u_idx_reported) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.report_sum",u_idx_reported);
	}
	
	public ReportVo select_reportUser2(int r_idx) {
		
		return sqlSession.selectOne("user.report_userVo",r_idx);
	}





}
