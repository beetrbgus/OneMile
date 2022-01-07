package com.kh.onemile.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.notice.NoticeDTO;
import com.kh.onemile.repository.notice.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao noticeDao;

	 @Override
	 public List list() throws Exception {
	  return noticeDao.list();
	 }
	 
	 @Override
		public int write(NoticeDTO noticeDto) throws Exception {
			
			if (noticeDao.getMaxSeq() == null) { // 게시글이 존재하지 않을 때
				noticeDto.setNt_no(1); // SEQ는 1
			} else { // 게시글이 존재할 때
				noticeDto.setNt_no(noticeDao.getMaxSeq() + 1); // 최대값에 +1
			}
			
			return noticeDao.write(noticeDto);
		}
	 
	 @Override
		public BoardDTO view(int seq) {
			dao.updateReadCount(seq);
			return dao.view(seq);
		}

		@Override
		public int update(BoardDTO dto) {
			return dao.update(dto);
		}

		@Override
		public int delete(int seq) {
			return dao.delete(seq);
		}



}