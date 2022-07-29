package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.JjimVo;

public class JjimDaoImpl implements JjimDao {

	SqlSession sqlSession;
	
	
	public JjimDaoImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	//회원이 찜한 상품 전부 조회
	@Override
	public List<JjimVo> selectList(int u_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("jjim.jjim_select",u_idx);
	}
	
	//회원이 이상품을 찜했는지
	@Override
	public JjimVo selectOne(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("jjim.jjim_select_one", map);
	}
	
	// 찜하기
	@Override
	public int insert(JjimVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("jjim.jjim_insert",vo);
	}
	
	//찜삭제
	@Override
	public int delete(JjimVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("jjim.jjim_delete", vo);
	}



}
