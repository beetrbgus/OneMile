package com.kh.onemile.repository.social.participant;

import java.util.List;

import com.kh.onemile.vo.social.participate.ParticipateDetailVO;
import com.kh.onemile.vo.social.participate.ParticipateVO;

public interface ParticipantDao {

	public boolean getPartiCnt(int socialNo);

	public void reg(ParticipateVO participateVO);

	public void approve(ParticipateVO participateVO);

	public void reject(ParticipateVO participateVO);

	public String getParti(int memberNo,int socialNo);

	public void regHost(ParticipateVO participateVO);

	public List<ParticipateDetailVO> getPaticipantList(int socialNo, int memberNo);

}
