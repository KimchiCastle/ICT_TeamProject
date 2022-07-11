package dao.image;

import java.util.List;

import vo.image.ImageVo;

public interface ImageDao {


	public int insert(ImageVo vo);
	
		
	public ImageVo selectOne(int p_idx); 
		

	public List<ImageVo> selectList();
		
	
}