package com.kh.onemile.service.social;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialIndexVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;
import com.kh.onemile.vo.social.participate.ParticipateVO;

public interface SocialService {
	public int reg(SocialRegVO socialRegVO) throws IllegalStateException, IOException;
	public List<SocialListVO> getList(PaginationVO paginationVO);
	public SocialDetailVO getDetail(int socialNo);
	public List<SocialDTO> getCount(int memberNo);
	public void socialJoin(ParticipateVO participateVO);
	public void exitSocial(ParticipateVO participateVO);
	public void modify(SocialRegVO socialRegVO) throws IllegalStateException, IOException;
	public List<SocialIndexVO> indexList();
}
