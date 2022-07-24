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
	public JjimVo selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("jjim.jjim_select", map);
	}

	@Override
	public int insert(JjimVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("jjim.jjim_insert",vo);
	}

	@Override
	public int delete(JjimVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("jjim.jjim_delete", vo);
	}

}
