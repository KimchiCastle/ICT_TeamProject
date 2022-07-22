package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVo;
import vo.UserVo;

public class MypageDaoImpl implements MypageDao {
	
	SqlSession sqlSession;
		
	public MypageDaoImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public int user_update(UserVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypage.mypage_update",vo);
	}

	@Override
	public int withdraw_user(int u_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("user_market.user_market_withdraw",u_idx);
	}

	@Override
	public List<ProductVo> selectList(int u_idx) {
		// TODO Auto-generated method stub
		return null;
	}

}
