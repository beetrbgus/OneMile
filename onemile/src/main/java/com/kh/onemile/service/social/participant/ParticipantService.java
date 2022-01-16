package com.kh.onemile.service.social.participant;

import java.util.List;

import com.kh.onemile.vo.social.participate.ParticipateDetailVO;
import com.kh.onemile.vo.social.participate.ParticipateVO;

public interface ParticipantService {
	public boolean getSocialPartiCnt(int socialNo);
	public void reg(ParticipateVO participateVO);
	public void approve(ParticipateVO participateVO);
	public void reject(ParticipateVO participateVO);
	public void regHost(ParticipateVO participateVO);
	public List<ParticipateDetailVO> getPaticipantList(int socialNo, int memberNo);
}
