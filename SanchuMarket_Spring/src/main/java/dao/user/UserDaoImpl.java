package dao.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.user.UserVo;

public class UserDaoImpl {

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
	
	
	//회원가입시 아이디 중복 방지, 로그인
	public UserVo selectOneById(String u_id){
		
		return sqlSession.selectOne("user.check_id", u_id);
		
	}
	
	//회원가입시 닉네임 중복 방지
	public UserVo selectOneByNickname(String u_nickname){
		
		return sqlSession.selectOne("user.check_nickname", u_nickname);
	}
	
	
	//회원가입시 이메일 중복 방지
	public UserVo selectOneByEmail(String email) {
		
		return sqlSession.selectOne("user.check_email", email);
		
	}
	
	
	//admin mainpage 금일 방문수
	public int selectTodayCount() {

		return sqlSession.selectOne("trade.today_count");
	}
		
	
	public int insert(UserVo vo) {
		

		return sqlSession.insert("user.user_insert", vo);
		
	}

	public int update(UserVo vo) {

		return sqlSession.update("user.user_update",vo);
	}
	
	
	public int delete(String u_id) {
		
		return sqlSession.delete("user.withdraw_account", u_id);
		
	}
	
}
