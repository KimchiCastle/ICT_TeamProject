package dao;

import java.util.List;
import java.util.Map;

import vo.ProductVo;

public interface ProductDao {


	//상품 전체조회
	public List<ProductVo> selectList(); 

		
	// 카테고리별 조회
	public List<ProductVo> selectList_cate(int c_idx);
		
	//u_idx 유저정보 넘김
	public List<ProductVo> selectList(int u_idx);
	
	
	//상품정보 넘김
	public ProductVo selectList2(int p_idx);
	
	//상품정보와 상품이미지 하나만 가져오기
	public ProductVo selectListproduct(int p_idx);

	//최근 상품 조회(mainpage_admin)
	public List<ProductVo> selectRecentList();
		
	
	public int todayProductCount();
		
	
	// 상품등록 메서드
	public int insert(ProductVo vo);
	
		
	//상품검색
	public List<ProductVo> selectList(Map map);
	
	public int selectMaxIdx();

	//가격 범위 상품명 검색
	public List<ProductVo> select_price_text_search(Map map);

	//가격 범위검색
	public List<ProductVo> select_price_search(Map map);

	
	// 상품 수정
	public int update(ProductVo vo);
	


//	//상품리스트 테스트
//	public List<ProductVo> select();
//	
	
}
