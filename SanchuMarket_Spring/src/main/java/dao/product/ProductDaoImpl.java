package dao.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.product.ProductVo;

public class ProductDaoImpl implements ProductDao {

	SqlSession sqlSession;
	
	
	public ProductDaoImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	//상품 전체조회
	@Override
	public List<ProductVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_list");
	}

	// 카테고리별 조회 
	@Override
	public List<ProductVo> selectList_cate(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_c_idx", c_idx);
	}

	//회원
	@Override
	public List<ProductVo> selectList(int u_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_user_idx",u_idx);
	}

	//상품 하나 조회
	@Override
	public ProductVo selectList2(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_p_idx",p_idx);
	}
	
	//상품정보와 상품이미지 하나만 가져오기
	@Override
	public ProductVo selectListproduct(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_p_idx_one",p_idx);
	}
	
	
	//최근 상품 업로드 게시물 6개 조회
	@Override
	public List<ProductVo> selectRecentList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.recent_product");
	}

	//admin mainpage금일 상품 업로드량
	@Override
	public int todayProductCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.today_count");
	}

	//상품 등록
	@Override
	public int insert(ProductVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product.product_insert",vo);
	}


	// 상품 검색 기능
	@Override
	public List<ProductVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_list_search",map);
	}
	
	// 가격 범위 상품명 검색
	@Override
	public List<ProductVo> select_price_text_search(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_price_text_search",map);
	}
	
	// 가격 범위검색
	@Override
	public List<ProductVo> select_price_search(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_price_search",map);
	}
	
	
	//상품등록시 p_idx 알아내기 위한 메서드
	@Override
	public int selectMaxIdx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_max_idx");
	}





	

	

	



	
	
	
}
