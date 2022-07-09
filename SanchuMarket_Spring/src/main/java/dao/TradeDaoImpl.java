package dao.trade;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.trade.TradeDao;
import service.MyBatisConnector;

public class TradeDaoImpl {

	SqlSessionFactory factory;

	// single-ton : 객체 1개만 생성해서 사용
	static TradeDaoImpl single = null;

	public static TradeDaoImpl getinstance() {

		// 객체가 null이면 생성해라
		if (single == null)
			single = new TradeDaoImpl();

		return single;
	}

	// 외부에서 생성하지 말 것
	private TradeDaoImpl() {
		// TODO Auto-generated constructor stub

		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//admin mainpage 금일 거래량
	public int selectTodayCount() {
		
		int count = 0;
		
		SqlSession sqlSession = factory.openSession();

		count = sqlSession.selectOne("trade.today_count");

		sqlSession.close();
		
		return count;
	}
}
