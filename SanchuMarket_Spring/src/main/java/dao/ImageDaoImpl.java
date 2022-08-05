package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ImageVo;

public class ImageDaoImpl implements ImageDao {

	SqlSession sqlSession;

	public ImageDaoImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	//이미지 파일명 DB에 넣기
	public int insert(ImageVo vo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("image.image_insert",vo);
	}

	
	//상품에 해당하는 이미지 객체 받아오기
	public List<ImageVo> selectOne(int p_idx) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("image.image_selectOne", p_idx);
	}
	
	//이미지 idx에 해당하는 이미지 파일명 가지고 오기
	@Override
	public ImageVo selectOneImage(int i_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("image.image_selectOneImage",i_idx);
	}
	
	
	//전체 이미지리스트 조회
	public List<ImageVo> selectList() {
		// TODO Auto-generated method stub
		
		return  sqlSession.selectList("image.image_list");
	}
	
	
	//이미지 수정
	@Override
	public int imageUpdate(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("image.image_update", map);
	}

	@Override
	public int deleteImage(int i_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("image.image_datadelete", i_idx);
	}

	@Override
	public int deleteAllImage(int p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("image.image_alldelete", p_idx);
	}


	
	
	
}
