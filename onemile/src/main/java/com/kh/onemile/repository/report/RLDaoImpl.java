package com.kh.onemile.repository.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.vo.report.ReportRegVO;

@Service
public class RLDaoImpl implements RLDao{
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void reg(ReportRegVO reportVO) {
		sqlSession.insert("", reportVO);
	}

	@Override
	public void delete(int rlNo) {
		sqlSession.update("", rlNo);
	}

	@Override
	public void adminDelete(int rlNo) {
		sqlSession.delete("", rlNo);
	}

}
