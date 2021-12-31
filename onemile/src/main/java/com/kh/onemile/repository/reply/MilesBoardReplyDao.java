package com.kh.onemile.repository.reply;

import com.kh.onemile.entity.miles.board.MilesBoardReplyDTO;

public interface MilesBoardReplyDao {
	void write(MilesBoardReplyDTO milesBoardReplyDto);
	int getSeq();
	void delete(int replyNo);
}
