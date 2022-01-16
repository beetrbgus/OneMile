package com.kh.onemile.repository.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.onemile.vo.report.middle.MiddleRLVO;

@Qualifier("cobuy")
@Repository
public class CobuyRLDaoImpl implements MiddleRLDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void reg(MiddleRLVO middleRLVO) {
		sqlSession.insert("cbrl.reg", middleRLVO);
	}  

	@Override
	public void delete(int rlNo) {
		sqlSession.update("cbrl.delete", rlNo);
	}

	@Override
	public void adminDelete(int rlNo) {
		sqlSession.delete("cbrl.adminDelete", rlNo);
	}

}
