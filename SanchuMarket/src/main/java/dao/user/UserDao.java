package dao.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.user.UserVo;

public class UserDao {

	SqlSessionFactory factory;
	//single-ton : 객체 1개만 생성해서 사용하자!
	//스태틱객체는 무조건 하나만 만들어진다.
	static UserDao single = null;

	//스태틱은 무조건 스태틱으로만
	public static UserDao getInstance() {

		//객체가 없으면 생성해라 호출된 한번만 객체를 생성
		if (single == null)
			single = new UserDao();

		return single;
	}

	//외부에서 객체를 생성하지 못하게 막음
	private UserDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//관리자 전체 회원 조회
	public List<UserVo> selectList(){
		
		List<UserVo> list = null;
		
		SqlSession sqlsession = factory.openSession();
		
		list = sqlsession.selectList("user.user_list");
		
		sqlsession.close();
		
		return list;
	}
	
	public List<UserVo> selectList(int u_idx) {

		List<UserVo>list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("product.product_user_list",u_idx);
		
		sqlSession.close();

		return list;
	}
	
	public UserVo selectOneByIdx(int u_idx){
		
		UserVo user = null;
		
		SqlSession sqlsession = factory.openSession();
		
		user = sqlsession.selectOne("user.user_idx", u_idx);
		
		sqlsession.close();
		
		return user;
	}
	// 판매자 상세정보 페이지 데이터 가져오기용
	public UserVo selectOneByIdxTime(int u_idx){
		
		UserVo user = null;
		
		SqlSession sqlsession = factory.openSession();
		
		user = sqlsession.selectOne("user.user_idx_reg", u_idx);
		
		sqlsession.close();
		
		return user;
	}
	
	//회원가입시 아이디 중복 방지, 로그인
	public UserVo selectOneById(String u_id){
		
		UserVo user = null;
		
		SqlSession sqlsession = factory.openSession();
		
		user = sqlsession.selectOne("user.check_id", u_id);
		
		sqlsession.close();
		
		return user;
	}
	
	//회원가입시 닉네임 중복 방지
	public UserVo selectOneByNickname(String u_nickname){
		
		UserVo user = null;
		
		SqlSession sqlsession = factory.openSession();
		
		user = sqlsession.selectOne("user.check_nickname", u_nickname);
		
		sqlsession.close();
		
		return user;
	}
	
	//회원가입시 이메일 중복 방지
	public UserVo selectOneByEmail(String email) {
		
		UserVo user = null;
		
		SqlSession sqlsession = factory.openSession();
		
		user = sqlsession.selectOne("user.check_email", email);
		
		sqlsession.close();
		
		return user;
	}
	//admin mainpage 금일 방문수
	public int selectTodayCount() {
		
		int count = 0;
		
		SqlSession sqlSession = factory.openSession();

		count = sqlSession.selectOne("trade.today_count");

		sqlSession.close();
		
		return count;
	}
		
	public int insert(UserVo vo) {
		
		int res = 0;
		
		SqlSession sqlsession = factory.openSession(true);

		res = sqlsession.insert("user.user_insert", vo);
		
		sqlsession.close();
		
		return res;
	}

	public int update(UserVo vo) {

		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);//auto commit
		
		res = sqlSession.update("user.user_update",vo);

		sqlSession.close();
		
		return res;
	}
	
	public int delete(String u_id) {
		
		int res = 0;
		
		SqlSession sqlsession = factory.openSession(true);
		
		res = sqlsession.delete("user.withdraw_account", u_id);
		
		sqlsession.close();
		
		return res;
		
	}
	
}
