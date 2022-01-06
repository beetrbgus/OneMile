package com.kh.onemile.service.notice;

import java.util.List;

import com.kh.onemile.entity.notice.NoticeDTO;

public interface NoticeService {
	public List list() throws Exception;

	public int write(NoticeDTO noticedto) throws Exception;

}