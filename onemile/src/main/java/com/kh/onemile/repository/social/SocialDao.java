package com.kh.onemile.repository.social;

import java.util.List;

import com.kh.onemile.entity.social.SocialDTO;

public interface SocialDao {
	void reg(SocialDTO socialDto);
	List<SocialDTO> list();
	boolean changeSocial(SocialDTO socialDto);
	SocialDTO detail(int socialNo);
}
