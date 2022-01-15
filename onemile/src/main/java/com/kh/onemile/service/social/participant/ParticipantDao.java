package com.kh.onemile.service.social.participant;

import com.kh.onemile.vo.social.participate.ParticipateVO;

public interface ParticipantDao {

	public boolean getPartiCnt(int socialNo);

	public void reg(ParticipateVO participateVO);

	public void approve(ParticipateVO participateVO);

	public void reject(ParticipateVO participateVO);

	public String getParti(int memberNo,int socialNo);

}
