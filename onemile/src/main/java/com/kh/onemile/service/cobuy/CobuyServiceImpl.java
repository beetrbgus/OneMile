package com.kh.onemile.service.cobuy;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.cobuy.CobuyModDTO;
import com.kh.onemile.entity.image.middle.CobuyImgMidDTO;
import com.kh.onemile.entity.map.MapDTO;
import com.kh.onemile.repository.cobuy.CobuyDao;
import com.kh.onemile.repository.image.middle.CobuyMidImgDao;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.map.MapService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;
import com.kh.onemile.entity.menu.MiddleNameDTO;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Slf4j
@Service
public class CobuyServiceImpl implements CobuyService {
	// 파일 저장 폴더
	private final String folderName = "/cobuy";
	// 시퀀스 이름
	private final String seqName = "cobuy_seq";

	@Autowired
	private CobuyDao cobuyDao; // 공동 구매 서비스
	@Autowired
	private ImageService imageService; // 이미지 서비스
	@Autowired
	private CobuyMidImgDao middleService; // 이미지 중간 테이블 서비스
	@Autowired
	private MapService mapService;
	@Autowired
	private Sequence seq;

	@Override
	public int reg(CobuyRegVO cobuyRegVO) throws IllegalStateException, IOException {
		int cbNo = seq.nextSequence(seqName); // 공동구매 상품 번호
		log.debug("cbNo       " + cbNo);
		System.out.println("----------------------------");
		System.out.println("cobuyDetailVO.getDetailAddress    "+ cobuyRegVO.getDetailAddress());
		// 지도 등록
		MapDTO mapDTO = new MapDTO();
		mapDTO.setLat(cobuyRegVO.getLat());
		mapDTO.setLng(cobuyRegVO.getLng());
		mapDTO.setDetailAddress(cobuyRegVO.getDetailAddress());
		
		log.debug("cobuyDetailVO.getDetailAddress()      "+cobuyRegVO.getDetailAddress());
		int mapNo = mapService.regMap(mapDTO);

		// 공구 테이블에 등록
		cobuyRegVO.setMapNo(mapNo);
		cobuyRegVO.setCobuyNo(cbNo);
		cobuyDao.reg(cobuyRegVO);
		
		// 등록 후 상세페이지로 돌아가기 위해 공구 상품 번호 반환.
		return cbNo;
	}

	@Override
	public List<CobuyListVO> getList() {
		return cobuyDao.cobuyList();
	}

	@Override
	public CobuyDetailVO getDetail(int cobuyNo) {
		return cobuyDao.detail(cobuyNo);
	}

	@Override
	public void modify(CobuyModDTO cobuyModDTO) {
		// 공구 테이블에 수정
		cobuyDao.modify(cobuyModDTO);
		MapDTO mapDTO = new MapDTO();
		mapDTO.setMapNo(cobuyModDTO.getMapNo());
		mapDTO.setLat(cobuyModDTO.getLat());
		mapDTO.setLng(cobuyModDTO.getLng());
		mapDTO.setDetailAddress(cobuyModDTO.getDetailAddress());
		
		mapService.modify(mapDTO);
		
	}

	@Override
	public void delete(int cobuyNo) {
		cobuyDao.delete(cobuyNo);
	}

	@Override
	public List<MiddleNameDTO> getMiddleName() {
		
		return cobuyDao.getMiddleName();
	}

}
