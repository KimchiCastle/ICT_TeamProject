package dao;

import java.util.List;
import java.util.Map;

import vo.ReportVo;
import vo.UserVo;
import vo.WithdrawlVo;

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
	
	//비밀번호 찾기시 아이디,이메일 존재 여부
	public int countForFindPwd(UserVo vo);
	
		
	public int insert(UserVo vo);
		

	public int update(UserVo vo);

	
	public int delete(String u_id);


	public int updatePwd(UserVo vo);


	public List<String> selectIdByNameTel(UserVo vo);

	//회원탈퇴시 비밀번호 체크
	public UserVo selectOneByPwd(Map check);

	//회원상태 업데이트
	public int updateStatus(Map updateMap);
	
	//회원상태 업데이트2
	public int insertWithdrawl(WithdrawlVo vo);

	//회원상태 업데이트, 회원복구
	public int deleteWithdrawl(WithdrawlVo vo);
	
	//회원정보 수정
	public int updateInfo(UserVo userVo);

	//회원정보 수정, 이미지없이
	public int updateInfoNoImg(UserVo userVo);

	//신고 이력 조회
	public int checkReportHistory(ReportVo vo);
	
	//신고
	public int insertReportedUser(ReportVo vo);
	
	
	

	
	
}
