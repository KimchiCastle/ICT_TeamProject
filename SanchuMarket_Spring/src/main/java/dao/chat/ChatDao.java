package dao.chat;

import java.util.List;

import vo.chat.ChatVo;

public interface ChatDao {

	public List<ChatVo> SelectRecentList();
	
}
