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


	@Override
	public List<ProductVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_list");
	}


	@Override
	public List<ProductVo> selectList_cate(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_c_idx", c_idx);
	}


	@Override
	public List<ProductVo> selectList(int u_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_user_idx",u_idx);
	}


	@Override
	public ProductVo selectList2(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_p_idx",p_idx);
	}


	@Override
	public List<ProductVo> selectRecentList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.recent_product");
	}


	@Override
	public int todayProductCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.today_count");
	}


	@Override
	public int insert(ProductVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product.product_insert",vo);
	}


	@Override
	public ProductVo selectOne(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_selectOne", p_idx);
	}


	@Override
	public List<ProductVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_list_search",map);
	}


	@Override
	public int selectMaxIdx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_max_idx");
	}


	

	

	



	
	
	
}
