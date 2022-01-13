package com.kh.onemile.service.social;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.vo.SocialVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;

public interface SocialService {
	public void reg(SocialRegVO socialRegVO) throws IllegalStateException, IOException;
	public SocialVO detail(int socialNo);
	public void changeSocial(SocialVO socialVo);
	public List<SocialListVO> list();
	public List<SocialListVO> getList(String category);
	public List<SocialDetailVO> getDetail(int socialNo);
	public List<SocialDTO> getCount(int memberNo);
}
