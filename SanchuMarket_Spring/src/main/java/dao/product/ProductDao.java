package dao.product;

import java.util.List;
import java.util.Map;

import vo.product.ProductVo;

public interface ProductDao {


	//상품 전체조회
	public List<ProductVo> selectList(); 

		
	// 카테고리별 조회
	public List<ProductVo> selectList_cate(int c_idx);
		
	//u_idx 유저정보 넘김
	public List<ProductVo> selectList(int u_idx);
	
	
	//상품정보 넘김
	public ProductVo selectList2(int p_idx);

	//최근 상품 조회(mainpage_admin)
	public List<ProductVo> selectRecentList();
		
	
	public int todayProductCount();
		
	
	// 상품등록 메서드
	public int insert(ProductVo vo);
	
	
	//상품 1개 조회 메서드
	public ProductVo selectOne(int p_idx);
		
	//상품검색
	public List<ProductVo> selectList(Map map);
	
	public int selectMaxIdx();

	//가격 범위 상품명 검색
	public List<ProductVo> select_price_text_search(Map map);

	//가격 범위검색
	public List<ProductVo> select_price_search(Map map);
	


//	//상품리스트 테스트
//	public List<ProductVo> select();
//	
	
}
