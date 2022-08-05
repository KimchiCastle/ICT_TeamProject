package dao;

import java.util.List;
import java.util.Map;

import vo.CategoryVo;
import vo.ProductVo;

public interface ProductDao {


	//상품 전체조회
	public List<ProductVo> selectList(Map map); 

	//전체상품 개수
	public int				rowTotal();
	//상품검색 개수
	public int 				rowTotal_search(Map map);
	//가격범위상품명 개수	
	public int				rowTotal_pp(Map map);
	//가격검색 개수		
	public int			   	rowTotal_p_price(Map map);
	//카테고리 개수
	public int 				rowTotal_cate(int c_idx);
		
		
	// 카테고리별 조회
	public List<ProductVo> selectList_cate(Map map);
		
	//u_idx 유저정보 넘김 회원이 올린 상품조회
	public List<ProductVo> selectList(int u_idx);
	
	
	//상품정보 넘김 이미지 전부 가져옴
	public ProductVo selectList2(int p_idx);
	
	//상품정보와 상품이미지 하나만 가져오기
	public ProductVo selectListproduct(int p_idx);


	// 상품등록 메서드
	public int insert(ProductVo vo);
	
		
	//상품검색
	public List<ProductVo> select_search(Map map);
	
	public int selectMaxIdx();

	//가격 범위 상품명 검색
	public List<ProductVo> select_price_text_search(Map map);

	//가격 범위검색
	public List<ProductVo> select_price_search(Map map);

	//최근 올라온 상품 6개 조회
	public List<ProductVo> select_recent_product();
	
	// 상품 수정
	public int update(ProductVo vo);
	
	//상품 상태 수정
	public int statusUpdate(Map map);

	//조회수 업데이트
	public int updateClick(int p_idx);
	
	//상품삭제
	public int deleteProduct(int p_idx);
	


	
}
