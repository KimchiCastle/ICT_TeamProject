package dao;

import java.util.List;
import java.util.Map;

import vo.ImageVo;

public interface ImageDao {

	//�̹��� ���ϸ� DB�� �ֱ�
	public int insert(ImageVo vo);
	
	//��ǰ�� �ش��ϴ� �̹��� ��ü �޾ƿ���
	public ImageVo selectOne(int p_idx); 
		
	//�̹��� idx�� �ش��ϴ� �̹��� ���ϸ� ������ ����
	public ImageVo selectOneImage(int i_idx);
	
	//��ü �̹�������Ʈ ��ȸ
	public List<ImageVo> selectList();
	
	//�̹��� ����
	public int imageUpdate(Map map);
	
	//idx�� �ش��ϴ� �̹��� ����
	public int deleteImage(int i_idx);
}
