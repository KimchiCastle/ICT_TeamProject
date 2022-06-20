package dao.product;

import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;

public class ProductDao123 {
	
	
	SqlSessionFactory factory;
	
	//single-ton : 객체 1개만 생성해서 사용하자!
	//스태틱객체는 무조건 하나만 만들어진다.
	static ProductDao123 single = null;

	//스태틱은 무조건 스태틱으로만
	public static ProductDao123 getInstance() {

		//객체가 없으면 생성해라 호출된 한번만 객체를 생성
		if (single == null)
			single = new ProductDao123();

		return single;
	}

	//외부에서 객체를 생성하지 못하게 막음
	private ProductDao123() {
		// TODO Auto-generated constructor stub
		
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
		
		
	}
	
	
	
}
