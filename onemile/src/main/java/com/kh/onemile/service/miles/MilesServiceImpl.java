package com.kh.onemile.service.miles;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.image.middle.MilesImgMidDTO;
import com.kh.onemile.repository.image.MilesImageDao;
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
	@Autowired
	private MilesImageDao middleService; // 이미지 중간 테이블 서비스
	
	//마일즈 생성
	@Override
	public void create(MilesVO milesVo) throws IllegalStateException, IOException {
		//마일즈 번호
		int milesNo = seq.nextSequence(SEQID);
		milesVo.setMilesNo(milesNo);
		
		//마일즈 테이블에 등록
		milesDao.create(milesVo);
		
		if(milesVo.getAttach()!=null) {
            List<Integer> imgNoList = imageService.regImage(milesVo.getAttach(), folderName);
            
            //연결 테이블
            MilesImgMidDTO milesImgMidDto = new MilesImgMidDTO();
            
            milesImgMidDto.setImgNoList(imgNoList);// 이미지 갯수만큼 넣어 줌
            milesImgMidDto.setMilesNo(milesNo);//마일즈 번호
            
            //중간 이미지 테이블에 등록
            middleService.reg(milesImgMidDto);
        }
	}
}