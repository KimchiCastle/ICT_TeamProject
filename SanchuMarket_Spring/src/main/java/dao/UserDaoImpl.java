package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ReportVo;
import vo.UserVo;
import vo.WithdrawlVo;

public class UserDaoImpl implements UserDao{

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//관리자 전체 회원 조회
	public List<UserVo> selectList(){
		
		return sqlSession.selectList("user.user_list");
	}
	
	
	public List<UserVo> selectList(int u_idx) {

		return sqlSession.selectList("product.product_user_list",u_idx);
	}
	
	
	public UserVo selectOneByIdx(int u_idx){
		
		return sqlSession.selectOne("user.user_idx", u_idx);
	}
	
	
	// 판매자 상세정보 페이지 데이터 가져오기용
	public UserVo selectOneByIdxTime(int u_idx){
		
		return sqlSession.selectOne("user.user_idx_reg", u_idx);
	}
	
	
	//id존재여부
	public UserVo selectOneById(String u_id){
		
		return sqlSession.selectOne("user.check_id", u_id);
		
	}
	
	//nickname존재여부
	public UserVo selectOneByNickname(String u_nickname){
		
		return sqlSession.selectOne("user.check_nickname", u_nickname);
	}
	
	
	//email존재여부
	public UserVo selectOneByEmail(String email) {
		
		return sqlSession.selectOne("user.check_email", email);
		
	}
	
	
	//비밀번호 찾기시 아이디,이메일 존재 여부
	public int countForFindPwd(UserVo vo) {
		
		return sqlSession.selectOne("user.check_emailAndId",vo);
	}
	
	
	public int insert(UserVo vo) {

		return sqlSession.insert("user.user_insert", vo);
	}
	

	public int update(UserVo vo) {

		return sqlSession.update("user.user_update",vo);
	}
	
	//아이디찾기(중복아이디허용)
	public List<String> selectIdByNameTel(UserVo vo) {
		
		return sqlSession.selectList("user.findId", vo);
	}
	
	//비밀번호 찾기
	public int updatePwd(UserVo vo) {
		return sqlSession.update("user.pwd_update",vo);
	}
	
	
	public int delete(String u_id) {
		
		return sqlSession.delete("user.withdraw_account", u_id);
		
	}


	//회원탈퇴시 비밀번호 조회
	@Override
	public UserVo selectOneByPwd(Map check) {
		
		return sqlSession.selectOne("user.check_pwd", check);
	}

	//회원 상태 업데이트 1
	@Override
	public int updateStatus(Map updateMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.user_status_update",updateMap);
	}
	
	//회원 상태 업데이트 2
	@Override
	public int insertWithdrawl(WithdrawlVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.insert_Withdrawl",vo);
	}

	//회원정보 수정, 이미지도 같이
	@Override
	public int updateInfo(UserVo userVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.user_info_update", userVo);
	}

	//회원정보 수정, 이미지없이
	@Override
	public int updateInfoNoImg(UserVo userVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.user_info_update_noImg", userVo);
	}


	@Override
	public int insertReportedUser(ReportVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.insert_report",vo);
	}


	@Override
	public int checkReportHistory(ReportVo vo) {
		
		return sqlSession.selectOne("user.check_reportHistory",vo);
	}

	
}
