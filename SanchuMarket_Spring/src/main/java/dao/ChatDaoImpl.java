package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.chat.ChatVo;

public class ChatDaoImpl implements ChatDao{
	
	SqlSession sqlSession;
	

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	public List<ChatVo> SelectRecentList(){
		
		List<ChatVo> list = null;

		return sqlSession.selectList("chat.recent_chat");
	}
	
	
}
