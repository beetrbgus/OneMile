package com.kh.onemile.repository.social.participant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.service.social.participant.ParticipantDao;
import com.kh.onemile.vo.social.participate.ParticipateVO;

@Service
public class ParticipantServiceImpl implements ParticipantService{
	@Autowired
	private ParticipantDao participantDao;
	@Override
	public boolean getSocialPartiCnt(int socialNo) {
		return participantDao.getPartiCnt(socialNo);
	}
	@Override
	public void reg(ParticipateVO participateVO) {
		participantDao.reg(participateVO);
	}
	@Override
	public void approve(ParticipateVO participateVO) {
		participantDao.approve(participateVO);
	}
	@Override
	public void reject(ParticipateVO participateVO) {
		participantDao.reject(participateVO);
	}
	@Override
	public void regHost(ParticipateVO participateVO) {
		participantDao.regHost(participateVO);
		
	}
	
}
