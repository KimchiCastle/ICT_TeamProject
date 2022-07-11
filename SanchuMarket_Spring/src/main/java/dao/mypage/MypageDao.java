package dao.mypage;

import java.util.List;

import vo.product.ProductVo;

public interface MypageDao {
	
	//판매중인 제품 정보 불러오기
	public List<ProductVo> selectlist(int u_idx);
	
	// 내 정보 수정하기
	public int user_update(int u_idx);
	
	// 회원 탈퇴하기
	public int withdraw_user(int u_idx);
}
