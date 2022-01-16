package com.kh.onemile.repository.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.onemile.vo.report.ReportRegVO;

@Qualifier("social")
@Repository
public class SocialRLDaoImpl implements ReportDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void reg(ReportRegVO reportVO) {
		sqlSession.insert("rl.reg", reportVO);
	}  

	@Override
	public void delete(int rlNo) {
		sqlSession.update("rl.delete", rlNo);
	}

	@Override
	public void adminDelete(int rlNo) {
		sqlSession.delete("rl.adminDelete", rlNo);
	}

}
