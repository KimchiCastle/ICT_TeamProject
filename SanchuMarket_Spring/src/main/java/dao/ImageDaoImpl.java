package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ImageVo;

public class ImageDaoImpl implements ImageDao {

	SqlSession sqlSession;
	

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(ImageVo vo) {
		// TODO Auto-generated method stub
		
		int res = 0;
		
		
		
		res = sqlSession.insert("image.image_insert",vo);
		
		
		sqlSession.close();
		
		
		return res;
	}

	public ImageVo selectOne(int p_idx) {
		// TODO Auto-generated method stub
		
		ImageVo vo = null;
		
		vo = sqlSession.selectOne("image.image_selectOne", p_idx);
	
		
		return vo;
	}

	public List<ImageVo> selectList() {
		// TODO Auto-generated method stub
		List<ImageVo> list = null;
		
		list = sqlSession.selectList("image_list_p_idx");
		
		return list;
	}
	
	
	
	
}
