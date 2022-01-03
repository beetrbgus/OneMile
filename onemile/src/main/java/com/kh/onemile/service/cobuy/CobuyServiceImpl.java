package com.kh.onemile.service.cobuy;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.onemile.entity.image.middle.CobuyImgMidDTO;
import com.kh.onemile.entity.map.MapDTO;
import com.kh.onemile.repository.cobuy.CobuyDao;
import com.kh.onemile.repository.image.middle.CobuyMidImgDao;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.map.MapService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;

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
	public int reg(CobuyDetailVO cobuyDetailVO) throws IllegalStateException, IOException {
		int cbNo = seq.nextSequence(seqName); // 공동구매 상품 번호
		log.debug("cbNo       " + cbNo);
		System.out.println("----------------------------");
		System.out.println("cobuyDetailVO.getDetailAddress    "+ cobuyDetailVO.getDetailAddress());
		// 지도 등록
		MapDTO mapDTO = new MapDTO();
		mapDTO.setLat(cobuyDetailVO.getLat());
		mapDTO.setLng(cobuyDetailVO.getLng());
		mapDTO.setDetailAddress(cobuyDetailVO.getDetailAddress());
		log.debug("cobuyDetailVO.getDetailAddress()      "+cobuyDetailVO.getDetailAddress());
		int mapNo = mapService.regMap(mapDTO);

		// 공구 테이블에 등록
		cobuyDetailVO.setMapNo(mapNo);
		cobuyDetailVO.setCobuyNo(cbNo);
		cobuyDao.reg(cobuyDetailVO);
		log.debug("cobuyDTO 뭘까내용이???    " + cobuyDetailVO.toString());
		log.debug("파일이 없나???    " + (cobuyDetailVO.getAttach() == null) != null ? "ㅇㅇ 널임" : "아님 널 아님");
		
		if (cobuyDetailVO.getAttach() != null) {

			List<Integer> imgNoList = imageService.regImage(cobuyDetailVO.getAttach(), folderName);

			// 연결 테이블
			CobuyImgMidDTO cobuyImgMidDTO = new CobuyImgMidDTO();

			cobuyImgMidDTO.setImgNoList(imgNoList); // 이미지 갯수만큼 넣어 줌
			cobuyImgMidDTO.setCobuyNo(cbNo); // 공구 상품 번호

			// 중간 이미지 테이블에 등록
			middleService.reg(cobuyImgMidDTO);
			log.debug("등록 완료  cobuyImgMidDTO   " + cobuyImgMidDTO.toString());
		}
		// 등록 후 상세페이지로 돌아가기 위해 공구 상품 번호 반환.
		return cbNo;
	}

	@Override
	public List<CobuyListVO> getList() {
		return cobuyDao.cobuyList();
	}

	@Override
	public CobuyListVO getDetail(int cobuyNo) {
		return cobuyDao.detail(cobuyNo);
	}

	@Override
	public void modify(CobuyDetailVO cobuyDetailVO) {
		int cbNo = cobuyDetailVO.getCobuyNo();

		// 공구 테이블에 등록
//		cobuyDao.modify(cobuyDetailVO);

		log.debug("cobuyDTO 뭘까내용이???    " + cobuyDetailVO.toString());
		log.debug("파일이 없나???    " + (cobuyDetailVO.getAttach() == null) != null ? "ㅇㅇ 널임" : "아님 널 아님");
		if (cobuyDetailVO.getAttach() != null) {
//			List<Integer> imgNoList = imageService.regImage(cobuyDetailVO.getAttach(), folderName);

			// 연결 테이블
			CobuyImgMidDTO cobuyImgMidDTO = new CobuyImgMidDTO();

//			cobuyImgMidDTO.setImgNoList(imgNoList); // 이미지 갯수만큼 넣어 줌
//			cobuyImgMidDTO.setCbiNo(cbiNo); // 공구 상품 번호

			// 중간 이미지 테이블에 등록
			middleService.reg(cobuyImgMidDTO);
			log.debug("등록 완료  cobuyImgMidDTO   " + cobuyImgMidDTO.toString());
		}
		// 등록 후 상세페이지로 돌아가기 위해 공구 상품 번호 반환.
//		return cbiNo;
	}

	@Override
	public void delete(int cobuyNo) {
		cobuyDao.delete(cobuyNo);
	}

}