package com.kh.onemile.service.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.commu.CommuReplyDTO;
import com.kh.onemile.entity.miles.board.MilesBoardReplyDTO;
import com.kh.onemile.entity.reply.ReplyDTO;
import com.kh.onemile.repository.reply.CommuReplyDao;
import com.kh.onemile.repository.reply.MilesBoardReplyDao;
import com.kh.onemile.repository.reply.ReplyDao;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.reply.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	final String SEQID = "reply_seq";
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private MilesBoardReplyDao mbReplyDao;
	
	@Autowired
	private CommuReplyDao commuReplyDao;
	
	@Autowired
	private Sequence seq;
	
	@Override
	public void writeReply(ReplyVO replyVo) {
		
		//시퀀스 가져오기
		int replyNo = seq.nextSequence(SEQID);
		
		//댓글 테이블
		ReplyDTO replyDto = new ReplyDTO();
		replyDto.setReplyNo(replyNo);
		replyDto.setMemberNo(replyVo.getMemberNo());
		replyDto.setReplyReceiverNo(replyVo.getReplyReceiverNo());
		replyDto.setContent(replyVo.getContent());
		replyDto.setRegDate(replyVo.getRegDate());
		replyDto.setViewYN(replyVo.getViewYN());
		
		//마일즈 게시판 댓글인지 아닌지 판정 (마일즈 게시판 번호가 있다면)
		boolean isMiles = replyVo.getMbNo()!=0;
		//커뮤니티 댓글인지 아닌지 판정(커뮤니티 번호가 있다면)
		boolean isCommu = replyVo.getCommuNo()!=0;
		
		//마일즈 게시판 댓글 dto 설정
		if(isMiles) {
			MilesBoardReplyDTO milesBoardReplyDto = new MilesBoardReplyDTO();
			
			//마일즈 게시판 댓글 시퀀스 생성
			int mbReplyNo = mbReplyDao.getSeq();
			milesBoardReplyDto.setReplyNo(replyNo); //시퀀스 번호 추가
			milesBoardReplyDto.setMrNo(mbReplyNo);
			milesBoardReplyDto.setMbNo(replyVo.getMbNo());
			
			//마일즈 게시판 댓글 write
			mbReplyDao.write(milesBoardReplyDto);
		}
		
		//커뮤니티 댓글 dto 설정
		if(isCommu) {
			CommuReplyDTO commuReplyDto = new CommuReplyDTO();
			
			int crpNo = commuReplyDao.getSeq();
			commuReplyDto.setCommuNo(replyVo.getCommuNo());
			commuReplyDto.setCrpNo(crpNo);
			commuReplyDto.setReplyNo(replyNo);
			
			commuReplyDao.write(commuReplyDto);
		}
		
		//댓글 테이블 추가
		replyDao.write(replyDto);
	}

	@Override
	public List<ReplyVO> listByBoardNo(int boardNo) {
		List<ReplyVO> list = replyDao.listByBoardNo(boardNo);
		return list;
	}

	@Override
	public void deleteReply(int replyNo) {
		
	}

	@Override
	public void editReply(ReplyVO replyVo) {
		ReplyDTO replyDto = new ReplyDTO();
		replyDto.setReplyNo(replyVo.getReplyNo());
		replyDto.setMemberNo(replyVo.getMemberNo());
		replyDto.setReplyReceiverNo(replyVo.getReplyReceiverNo());
		replyDto.setContent(replyVo.getContent());
		replyDto.setRegDate(replyVo.getRegDate());
		replyDto.setViewYN(replyVo.getViewYN());
		
		//댓글 테이블 추가
		replyDao.edit(replyDto);
	}
}
