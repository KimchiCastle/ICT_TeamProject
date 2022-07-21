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

	//��ǰ ��ü��ȸ
	@Override
	public List<ProductVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_list",map);
	}

	//��ü��ǰ ����
	@Override
	public int rowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_rowtotal");
	}
	
	//����,��ǰ�� �˻� ����
	@Override
	public int rowTotal_pp(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_rowtotal_pp", map);
	}
	
	//���ݰ˻� ����
	@Override
	public int rowTotal_p_price(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_rowtotal_p_price", map);
	}
	
	//��ǰ�˻� ����
	@Override
	public int rowTotal_search(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_rowtotal_search", map);
	}

	
	//ī�װ� ����
	@Override
	public int rowTotal_cate(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product_rowtotal_c_idx",c_idx);
	}




	
	// ī�װ��� ��ȸ 
	@Override
	public List<ProductVo> selectList_cate(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_c_idx", map);
	}

	//ȸ��
	@Override
	public List<ProductVo> selectList(int u_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_user_idx",u_idx);
	}

	//��ǰ �ϳ� ��ȸ
	@Override
	public ProductVo selectList2(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_p_idx",p_idx);
	}
	
	//��ǰ������ ��ǰ�̹��� �ϳ��� ��������
	@Override
	public ProductVo selectListproduct(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_p_idx_one",p_idx);
	}
	
	
	//�ֱ� ��ǰ ���ε� �Խù� 6�� ��ȸ
	@Override
	public List<ProductVo> selectRecentList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.recent_product");
	}

	//admin mainpage���� ��ǰ ���ε差
	@Override
	public int todayProductCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.today_count");
	}

	//��ǰ ���
	@Override
	public int insert(ProductVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product.product_insert",vo);
	}


	// ��ǰ �˻� ���
	@Override
	public List<ProductVo> select_search(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_list_search",map);
	}
	
	// ���� ���� ��ǰ�� �˻�
	@Override
	public List<ProductVo> select_price_text_search(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_price_text_search",map);
	}
	
	// ���� �����˻�
	@Override
	public List<ProductVo> select_price_search(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.product_price_search",map);
	}
	
	
	//��ǰ��Ͻ� p_idx �˾Ƴ��� ���� �޼���
	@Override
	public int selectMaxIdx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.product_max_idx");
	}
	
	//��ǰ ����
	@Override
	public int update(ProductVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("product.product_update",vo);
	}

	

	
	
	
	

	



	
	
	
}
