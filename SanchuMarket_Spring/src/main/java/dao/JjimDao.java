package dao;

import java.util.Map;

import vo.JjimVo;

public interface JjimDao {
	
	public JjimVo selectOne(Map map);
	
	public int insert(JjimVo vo);
	
	public int delete(JjimVo vo);
}
