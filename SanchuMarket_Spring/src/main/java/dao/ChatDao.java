package dao;

import java.util.List;

import vo.ChatVo;

public interface ChatDao {

	public List<ChatVo> SelectRecentList();
	
}
