package com.kh.onemile.repository.reply;

import com.kh.onemile.entity.commu.CommuReplyDTO;

public interface CommuReplyDao {
	void write(CommuReplyDTO commuReplyDto);
	int getSeq();
	void delete(int replyNo);
}
