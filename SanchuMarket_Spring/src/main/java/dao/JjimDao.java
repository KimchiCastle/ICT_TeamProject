package dao;

import java.util.List;
import java.util.Map;

import vo.JjimVo;

public interface JjimDao {
	
	public List<JjimVo> selectList(int u_idx);
	
	public JjimVo selectOne(Map map);
	
	public int insert(JjimVo vo);
	
	public int delete(JjimVo vo);

	public JjimVo selectCount(int p_idx);
}
