package com.kh.onemile.service.social.participant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.repository.social.participant.ParticipantDao;
import com.kh.onemile.vo.social.participate.ParticipateDetailVO;
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
	public void approve(int socialNo,int partiMemberNo) {
		
		ParticipateVO participateVO =new ParticipateVO();
		participateVO.setMemberNo(partiMemberNo);
		participateVO.setSocialNo(socialNo);
		
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
	@Override
	public List<ParticipateDetailVO> getPaticipantList(int socialNo, int memberNo) {
		return participantDao.getPaticipantList(socialNo,memberNo);
	}
	
}
