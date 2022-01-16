package com.kh.onemile.repository.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.onemile.vo.report.ReportRegVO;
import com.kh.onemile.vo.report.middle.MiddleRLVO;

@Qualifier("social")
@Repository
public class SocialRLDaoImpl implements MiddleRLDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void reg(MiddleRLVO middleRLVO) {
		sqlSession.insert("srl.reg", middleRLVO);
	}  

	@Override
	public void delete(int rlNo) {
		sqlSession.update("srl.delete", rlNo);
	}

	@Override
	public void adminDelete(int rlNo) {
		sqlSession.delete("srl.adminDelete", rlNo);
	}

}
