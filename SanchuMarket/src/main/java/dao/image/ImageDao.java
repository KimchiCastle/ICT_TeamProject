package dao.image;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.image.ImageVo;
import vo.product.ProductVo;

public class ImageDao {

	
	SqlSessionFactory factory;
	
	//single-ton : 객체 1개만 생성해서 사용하자!
	//스태틱객체는 무조건 하나만 만들어진다.
	static ImageDao single = null;

	//스태틱은 무조건 스태틱으로만
	public static ImageDao getInstance() {

		//객체가 없으면 생성해라 호출된 한번만 객체를 생성
		if (single == null)
			single = new ImageDao();

		return single;
	}

	//외부에서 객체를 생성하지 못하게 막음
	private ImageDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
		
	}

	public int insert(ImageVo vo) {
		// TODO Auto-generated method stub
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		
		res = sqlSession.insert("image.image_insert",vo);
		
		
		sqlSession.close();
		
		
		return res;
	}

	public ImageVo selectOne(int p_idx) {
		// TODO Auto-generated method stub
		
		ImageVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("image.image_selectOne", p_idx);
		
		//connection 닫기
		sqlSession.close();
		
		return vo;
	}
	
	
	
	
}
