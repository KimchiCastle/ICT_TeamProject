package dao.product;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.product.ProductVo;

public class ProductDao {
	
	
	SqlSessionFactory factory;
	
	//single-ton : 객체 1개만 생성해서 사용
	static ProductDao single = null;

	public static ProductDao getinstance() {

		//객체가 null이면 생성해라
		if (single == null)
			single = new ProductDao();

		return single;
	}

	//외부에서 생성하지 말 것
	private ProductDao() {
		// TODO Auto-generated constructor stub
		
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();

	}
	
	public List<ProductVo> selectList() {
		

		List<ProductVo> list = null;

		
		return list;
	}

}
