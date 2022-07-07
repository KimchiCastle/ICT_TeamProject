package dao.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.product.ProductVo;

public class ProductDao {

	SqlSessionFactory factory;

	// single-ton : 객체 1개만 생성해서 사용
	static ProductDao single = null;

	public static ProductDao getinstance() {

		// 객체가 null이면 생성해라
		if (single == null)
			single = new ProductDao();

		return single;
	}

	// 외부에서 생성하지 말 것
	private ProductDao() {
		// TODO Auto-generated constructor stub

		factory = MyBatisConnector.getInstance().getSqlSessionFactory();

	}

	public List<ProductVo> selectList() {

		List<ProductVo> list = null;

		// 1.SqlSession얻어오기
		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList("product.product_list");

		// 3.닫기
		sqlSession.close();

		return list;
	}
	
	//u_idx 유저정보 넘김
	public List<ProductVo> selectList(int u_idx) {
		// TODO Auto-generated method stub
		
		List<ProductVo> list = null;

		// 1.SqlSession얻어오기
		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList("product.product_user_idx",u_idx);

		// 3.닫기
		sqlSession.close();
		
		
		return list;
	}
	
	//상품정보 넘김
	public ProductVo selectList2(int p_idx) {
		// TODO Auto-generated method stub
		ProductVo vo = null;

		// 1.SqlSession얻어오기
		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("product.product_p_idx",p_idx);

		// 3.닫기
		sqlSession.close();
		
		
		return vo;
	}


	//최근 상품 조회(mainpage_admin)
	public List<ProductVo> selectRecentList() {
		
		List<ProductVo> list = null;

		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList("product.recent_product");

		sqlSession.close();
		
		return list;
	}
	
	public int selectTodayCount() {
		
		int count = 0;
		
		SqlSession sqlSession = factory.openSession();

		count = sqlSession.selectOne("product.today_count");

		sqlSession.close();
		
		return count;
		
	}
	
	
	
	// 상품등록 메서드
	public int insert(ProductVo vo) {
		// TODO Auto-generated method stub
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("product.product_insert",vo);
		
		
		sqlSession.close();
		
		return res;
	}
	
	//상품 1개 조회 메서드
	public ProductVo selectOne(int p_idx) {
		// TODO Auto-generated method stub
		
		ProductVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("product.product_selectOne", p_idx);
		
		//connection 닫기
		sqlSession.close();
		
		return vo;
	}


	
	
	
}
