package dao;

import java.util.List;
import java.util.Map;

import vo.ImageVo;

public interface ImageDao {

	//이미지 파일명 DB에 넣기
	public int insert(ImageVo vo);
	
	//상품에 해당하는 이미지 객체 받아오기
	public ImageVo selectOne(int p_idx); 
		
	//이미지 idx에 해당하는 이미지 파일명 가지고 오기
	public ImageVo selectOneImage(int i_idx);
	
	//전체 이미지리스트 조회
	public List<ImageVo> selectList();
	
	//이미지 수정
	public int imageUpdate(Map map);
	
	//idx에 해당하는 이미지 삭제
	public int deleteImage(int i_idx);
}
