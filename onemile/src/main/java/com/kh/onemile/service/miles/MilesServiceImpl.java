package com.kh.onemile.service.miles;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.onemile.entity.miles.MilesDTO;
import com.kh.onemile.repository.miles.MilesDao;
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
	
	//마일즈 생성
	@Override
	public void create(MilesVO milesVo) {
		//마일즈 번호
		int milesNo = seq.nextSequence(SEQID);
		
		
		//마일즈 DTO 설정
		MilesDTO milesDTO = new MilesDTO();
		milesDTO.setMilesNo(milesNo);
		milesDTO.setMemberNo(milesVo.getMemberNo());
		milesDTO.setName(milesVo.getName());
		milesDTO.setContext(milesVo.getContext());
		milesDTO.setArea(milesVo.getArea());
		milesDTO.setSmallName(milesVo.getSmallName());
		
		milesDao.create(milesDTO);
	}
}