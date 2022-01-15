package com.kh.onemile.service.social.participant;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.vo.social.participate.ParticipateVO;

@Repository
public class ParticipantDaoImpl implements ParticipantDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean getPartiCnt(int socialNo) {
		int result = sqlSession.selectOne("participant.getpartiCnt", socialNo);
		return result>0; 
	}

	@Override
	public void reg(ParticipateVO participateVO) {
		sqlSession.insert("participant.reg",participateVO);
	}

	@Override
	public void approve(ParticipateVO participateVO) {
		sqlSession.update("participant.approve", participateVO);
	}

	@Override
	public void reject(ParticipateVO participateVO) {
		sqlSession.delete("participant.reject", participateVO);
	}

	@Override
	public String getParti(int memberNo, int socialNo) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", memberNo);
		map.put("socialNo", socialNo);
		return sqlSession.selectOne("participant.getParti",map);
	}
	
}
