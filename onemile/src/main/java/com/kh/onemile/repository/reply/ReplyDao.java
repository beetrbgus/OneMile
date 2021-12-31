package com.kh.onemile.repository.reply;

import java.util.List;

import com.kh.onemile.entity.reply.ReplyDTO;
import com.kh.onemile.vo.ReplyVO;

public interface ReplyDao {
	void write(ReplyDTO replyDto);
	int getSeq();
	List<ReplyVO> listByBoardNo(int boardNo);
	void delete(int replyNo);
	void edit(ReplyDTO replyDto);
}
