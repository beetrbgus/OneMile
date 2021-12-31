package com.kh.onemile.repository.reply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.commu.CommuReplyDTO;
@Repository
public class CommuReplyDaoImpl implements CommuReplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(CommuReplyDTO commuReplyDto) {
		sqlSession.insert("crp.write", commuReplyDto);
	}

	@Override
	public int getSeq() {
		int seq = sqlSession.selectOne("crp.sequence");
		return seq;
	}

	@Override
	public void delete(int replyNo) {
		sqlSession.delete("crp.delete", replyNo);
	}
}
