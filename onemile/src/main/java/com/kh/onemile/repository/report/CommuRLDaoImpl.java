package com.kh.onemile.repository.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.onemile.vo.report.middle.MiddleRLVO;

@Qualifier("commu")
@Repository
public class CommuRLDaoImpl implements MiddleRLDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void reg(MiddleRLVO middleRLVO) {
		sqlSession.insert("crl.reg", middleRLVO);
	}  

	@Override
	public void delete(int rlNo) {
		sqlSession.update("crl.delete", rlNo);
	}

	@Override
	public void adminDelete(int rlNo) {
		sqlSession.delete("crl.adminDelete", rlNo);
	}

}
