package com.kh.onemile.repository.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.reply.ReplyDTO;
import com.kh.onemile.vo.ReplyVO;
@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void write(ReplyDTO replyDto) {
		sqlSession.insert("reply.write",replyDto);
	}

	@Override
	public int getSeq() {
		int seq = sqlSession.selectOne("reply.sequence");
		return seq;
	}

	@Override
	public List<ReplyVO> listByBoardNo(int boardNo) {
		List<ReplyVO> list = sqlSession.selectList("reply.listByBoardNo", boardNo);
		return list;
	}
}
