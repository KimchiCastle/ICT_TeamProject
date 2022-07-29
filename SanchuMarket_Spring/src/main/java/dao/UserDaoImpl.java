package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.UserVo;

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
		
		/*
		 * System.out.printf("daoimple의u_name:%s\n",vo.getU_name());
		 * System.out.printf("daoimple의u_tel:%s\n",vo.getU_tel());
		 */
		
		return sqlSession.selectList("user.findId", vo);
	}
	
	//비밀번호 찾기
	public int updatePwd(UserVo vo) {
		return sqlSession.update("user.pwd_update",vo);
	}
	
	
	public int delete(String u_id) {
		
		return sqlSession.delete("user.withdraw_account", u_id);
		
	}

	
}
