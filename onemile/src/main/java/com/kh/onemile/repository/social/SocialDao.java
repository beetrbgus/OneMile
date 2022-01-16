package com.kh.onemile.repository.social;

import java.util.List;

import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialIndexVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;

public interface SocialDao {
	public void reg(SocialDTO socialDto);
	public List<SocialListVO> getList(PaginationVO paginationVO);
	public SocialDetailVO getDetail(int socialNo);
	public List<SocialDTO> getCount(int memberNo);
	public List<SocialListVO> getMemberByList(int memberNo);
	public void modify(SocialRegVO socialRegVO);
	public List<SocialIndexVO> getIndexList();
	public void delete(int socialNo);
}
