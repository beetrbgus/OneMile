package com.kh.onemile.repository.social;

import java.util.List;

import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialIndexVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;

public interface SocialDao {
	void reg(SocialDTO socialDto);
	List<SocialListVO> getList(PaginationVO paginationVO);
	SocialDetailVO getDetail(int socialNo);
	List<SocialDTO> getCount(int memberNo);
	List<SocialListVO> getMemberByList(int memberNo);
	void modify(SocialRegVO socialRegVO);
	List<SocialIndexVO> getIndexList();
}
