package dao;

import java.util.List;

import vo.user.UserVo;

public interface UserDao {

	
	//관리자 전체 회원 조회
	public List<UserVo> selectList();
		
	
	public List<UserVo> selectList(int u_idx);

	
	public UserVo selectOneByIdx(int u_idx);
		
		
	// 판매자 상세정보 페이지 데이터 가져오기용
	public UserVo selectOneByIdxTime(int u_idx);
		
	
	//회원가입시 아이디 중복 방지, 로그인
	public UserVo selectOneById(String u_id);
		
	
	//회원가입시 닉네임 중복 방지
	public UserVo selectOneByNickname(String u_nickname);
		
	
	//회원가입시 이메일 중복 방지
	public UserVo selectOneByEmail(String email);
	
	//admin mainpage 금일 방문수
	public int selectTodayCount();
	
		
	public int insert(UserVo vo);
		

	public int update(UserVo vo);

	
	public int delete(String u_id);
	
	
}
