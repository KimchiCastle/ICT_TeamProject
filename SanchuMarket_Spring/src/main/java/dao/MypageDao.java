package dao;

import java.util.List;

import vo.ProductVo;
import vo.UserVo;

public interface MypageDao {
	
	// 내 정보 수정하기
	public int user_update(UserVo vo);
	
	// 회원 탈퇴하기
	public int withdraw_user(int u_idx);
	
	//u_idx 별 리스트
	public List<ProductVo> selectList(int u_idx);
	
}
