package dao.image;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.image.ImageVo;

public class ImageDaoImpl implements ImageDao {

	SqlSession sqlSession;

	public ImageDaoImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	public int insert(ImageVo vo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("image.image_insert",vo);
	}

	public ImageVo selectOne(int p_idx) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("image.image_selectOne", p_idx);
	}

	public List<ImageVo> selectList() {
		// TODO Auto-generated method stub
		
		return  sqlSession.selectList("image_list_p_idx");
	}
	
	
	
	
}
