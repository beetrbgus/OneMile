package com.kh.onemile.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.repository.commu.CommuDao;
import com.kh.onemile.repository.notice.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao noticeDao;

	 @Override
	 public List list() throws Exception {
	  return noticeDao.list();
	 }

}