package com.kh.onemile.service.social;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.vo.SocialVO;
import com.kh.onemile.vo.social.SocialRegVO;

public interface SocialService {
	public void reg(SocialRegVO socialRegVO) throws IllegalStateException, IOException;
	public SocialVO detail(int socialNo);
	public List<SocialDTO> list();
	public void changeSocial(SocialVO socialVo);
}
