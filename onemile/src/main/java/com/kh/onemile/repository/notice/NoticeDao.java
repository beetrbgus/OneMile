package com.kh.onemile.repository.notice;

import java.util.List;
import com.kh.onemile.entity.notice.NoticeDTO;

public interface NoticeDao {

	 public List list() throws Exception;

	Integer getMaxSeq();

	int write(NoticeDTO noticedto);

}