package dao;

import java.util.Map;

import vo.JjimVo;

public interface JjimDao {
	
	public JjimVo selectOne();
	
	public int insert(JjimVo vo);
	
}
