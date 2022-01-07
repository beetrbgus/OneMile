package com.kh.onemile.service.miles;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.image.middle.MilesImgMidDTO;
import com.kh.onemile.repository.image.middle.MiddleImageDAO;
import com.kh.onemile.repository.miles.MilesDao;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.MilesVO;

@Service
public class MilesServiceImpl implements MilesService{
	//파일 저장 폴더
	private final String folderName="/miles";
	//시퀀스 이름
	private final String SEQID = "miles_seq";
	
	@Autowired
	private Sequence seq;
	@Autowired
	private MilesDao milesDao;
	@Autowired
	private ImageService imageService; //이미지 서비스
	@Autowired @Qualifier("miDAO")
	private MiddleImageDAO middleImageDao; // 공동구매 중간 테이블
	
	//마일즈 생성
	@Override
	public void create(MilesVO milesVo) throws IllegalStateException, IOException {
		//마일즈 번호
		int milesNo = seq.nextSequence(SEQID);
		milesVo.setMilesNo(milesNo);
		
		//마일즈 테이블에 등록
		milesDao.create(milesVo);
		
		
	}
}