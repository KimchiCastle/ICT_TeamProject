package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.JjimVo;

public class JjimDaoImpl implements JjimDao {

	SqlSession sqlSession;
	
	
	public JjimDaoImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public JjimVo selectOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(JjimVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("jjim.jjim_insert",vo);
	}

}
