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
	
	//�̹��� ���ϸ� DB�� �ֱ�
	public int insert(ImageVo vo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("image.image_insert",vo);
	}

	
	//��ǰ�� �ش��ϴ� �̹��� ��ü �޾ƿ���
	public ImageVo selectOne(int p_idx) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("image.image_selectOne", p_idx);
	}
	
	//�̹��� idx�� �ش��ϴ� �̹��� ���ϸ� ������ ����
	@Override
	public ImageVo selectOneImage(int i_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("image.image_selectOneImage",i_idx);
	}
	
	
	//��ü �̹�������Ʈ ��ȸ
	public List<ImageVo> selectList() {
		// TODO Auto-generated method stub
		
		return  sqlSession.selectList("image.image_list");
	}
	
	
	//�̹��� ����
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


	
	
	
}
