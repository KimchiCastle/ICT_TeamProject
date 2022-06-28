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
	
	//관리자 조회
	public List<UserVo> selectList(){
		
		List<UserVo> list = null;
		
		SqlSession sqlsession = factory.openSession();
		
		list = sqlsession.selectList("user.user_list");
		
		sqlsession.close();
		
		return list;
	}
	
	public UserVo selectOneByIdx(int u_idx){
		
		UserVo user = null;
		
		SqlSession sqlsession = factory.openSession();
		
		user = sqlsession.selectOne("user.user_idx", u_idx);
		
		sqlsession.close();
		
		return user;
	}
	
	//회원가입시 유저 존재 조회(ajax)
	public UserVo selectOneById(String u_id){
		
		UserVo user = null;
		
		SqlSession sqlsession = factory.openSession();
		
		user = sqlsession.selectOne("user.check_id", u_id);
		
		sqlsession.close();
		
		return user;
	}
	
	public UserVo selectOneByNickname(String u_nickname){
		
		UserVo user = null;
		
		SqlSession sqlsession = factory.openSession();
		
		user = sqlsession.selectOne("user.check_nickname", u_nickname);
		
		sqlsession.close();
		
		return user;
	}
	
	public int insert(UserVo vo) {
		
		int res = 0;
		
		SqlSession sqlsession = factory.openSession();

		res = sqlsession.selectOne("user.user_insert", vo);
		
		sqlsession.close();
		
		return res;
	}
		
	
	
}
