package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	
	//전역변수 !!
	DataSource ds;
	
	//single-ton : 객체 1개만 생성해서 사용하자!
	//스태틱객체는 무조건 하나만 만들어진다.

	static DBService single = null;

	//스태틱은 무조건 스태틱으로만
	public static DBService getInstance() {

		//객체가 없으면 생성해라 호출된 한번만 객체를 생성
		if (single == null)
			single = new DBService();

		return single;
	}

	//외부에서 객체를 생성하지 못하게 막음
	private DBService() {
		// TODO Auto-generated constructor stub
		//JNDI(Java Naming Directory(검색) Interface)
		
		try {
			//1.InitialContext생성 네이밍을 사용할 수 있는 객체
			InitialContext ic = new InitialContext();
			
			//2.Resource의 저장소 Context정보 구하기
			//컨택스트 위치를 찾기
			//		현재 실행되고 있는 내 context정보를 구한다.
			//Context context = (Context)ic.lookup("java:comp/env");
			
			//3.Context 내의 Resource정보를 획득
			//ds = (DataSource) context.lookup("jdbc/oracle_test");
			
			//룩업을 한번에 할 수도 있다. 2 + 3
			ds = (DataSource) ic.lookup("java:comp/env/jdbc/oracle_test");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//DBCP에 저장된 커넥션 얻어오기
	public Connection getConnection() throws SQLException {
	
		//이안에서 예외를 처리해버리면,
		//바깥에 사용자는 어떤 에러가 나온지 알 수 없으니
		//사용자에게 Exception을 throws 한다.
		
		return ds.getConnection();
		
		
	}
	

}
