package com.kh.onemile.service.miles;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.image.middle.MilesImgMidDTO;
import com.kh.onemile.entity.miles.MilesDTO;
import com.kh.onemile.repository.image.middle.MilesImageDao;
import com.kh.onemile.repository.miles.MilesDao;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.MilesVO;

@Service
public class MilesServiceImpl implements MilesService{
	private final String folderName="/miles";
	private final String SEQID = "miles_seq";
	
	@Autowired
	private Sequence seq;
	@Autowired
	private MilesDao milesDao;
	@Autowired
	private ImageService imageService;
	@Autowired
	private MilesImageDao middleService;
	
	@Override
	public void create(MilesVO milesVo) throws IllegalStateException, IOException {
		int milesNo = seq.nextSequence(SEQID);
		
		milesDao.create(milesVo);
		
		if(milesVo.getAttach()!=null) {
			List<Integer> imgNoList = imageService.regImage(milesVo.getAttach(), folderName);
			
			MilesImgMidDTO milesImgMidDto = new MilesImgMidDTO();
			
			milesImgMidDto.setImgNoList(imgNoList);
			milesImgMidDto.setMilesNo(milesNo);
			
			middleService.reg(milesImgMidDto);
		}
	}
}