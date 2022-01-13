package com.kh.onemile.service.cobuy;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;
import com.kh.onemile.entity.map.MapDTO;
import com.kh.onemile.entity.product.ProductBuyDTO;
import com.kh.onemile.repository.cobuy.CobuyBuyDao;
import com.kh.onemile.repository.cobuy.CobuyDao;
import com.kh.onemile.repository.image.middle.MiddleImageDAO;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.map.MapService;
import com.kh.onemile.util.DateToString;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.cobuy.CobuyCatVO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;
import com.kh.onemile.vo.cobuy.CobuyVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;

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
	@Qualifier("cbiDAO")
	private MiddleImageDAO middleImageDao; // 공동구매 중간 테이블
	@Autowired
	private MapService mapService;
	@Autowired
	private Sequence seq;
	@Autowired
	private DateToString dateToString;
	@Autowired
	private CobuyBuyDao cobuyBuyDao; 
	@Override
	public int reg(CobuyRegVO cobuyRegVO) throws IllegalStateException, IOException {
		int cbNo = seq.nextSequence(seqName); // 공동구매 상품 번호

		// 지도 등록
		MapDTO mapDTO = new MapDTO();
		mapDTO.setLat(cobuyRegVO.getLat());
		mapDTO.setLng(cobuyRegVO.getLng());
		mapDTO.setDetailAddress(cobuyRegVO.getDetailAddress());

		int mapNo = mapService.regMap(mapDTO);

		// 공구 테이블에 등록
		cobuyRegVO.setMapNo(mapNo);
		cobuyRegVO.setCobuyNo(cbNo);
		cobuyDao.reg(cobuyRegVO);

		MiddleImgTableDTO imgMidDTO = new MiddleImgTableDTO();
		imgMidDTO.setConnTableNo(cbNo); // 공구 상품 번호

		List<Integer> imgNoList = imageService.regImage(cobuyRegVO.getAttach(), folderName);
		for (int imgNo : imgNoList) {
			// 연결 테이블
			imgMidDTO.setImgNo(imgNo);
			// 중간 이미지 테이블에 등록
			middleImageDao.reg(imgMidDTO);
			log.debug("등록 완료  cobuyImgMidDTO   " + imgMidDTO.toString());
		}

		return cbNo;
	}

	@Override
	public List<CobuyListVO> getList(int startRow, int endRow) {
		return cobuyDao.cobuyList(startRow, endRow);
	}

	@Override
	public CobuyDetailVO getDetail(int cobuyNo) {
		CobuyDetailVO result = cobuyDao.detail(cobuyNo);
		System.err.println(result.getCobuyNo());
		result.setDeadLinestr(dateToString.dateToString(result.getDeadLine()));
		result.setCountConstomer(cobuyBuyDao.countConstomer(cobuyNo));
		return result;
	}

	@Override
	public void modify(CobuyDetailVO cobuyModDTO) throws IllegalStateException, IOException {
		// 공구 테이블에 수정
		cobuyDao.modify(cobuyModDTO);
		MapDTO mapDTO = new MapDTO();
		mapDTO.setMapNo(cobuyModDTO.getMapNo());
		mapDTO.setLat(cobuyModDTO.getLat());
		mapDTO.setLng(cobuyModDTO.getLng());
		mapDTO.setDetailAddress(cobuyModDTO.getDetailAddress());

		mapService.modify(mapDTO);

		MiddleImgTableDTO imgMidDTO = new MiddleImgTableDTO();
		imgMidDTO.setConnTableNo(cobuyModDTO.getCobuyNo());
		
		if (cobuyModDTO.getAttach() != null) {
			System.err.println("if문 시작");
			middleImageDao.delete(cobuyModDTO.getCobuyNo());
			System.err.println("삭제실행");
			List<Integer> imgNoList = imageService.regImage(cobuyModDTO.getAttach(), folderName);
			
			for (int imgNo : imgNoList) {
				// 연결 테이블
				imgMidDTO.setImgNo(imgNo);
				// 중간 이미지 테이블에 등록
				middleImageDao.reg(imgMidDTO);
			}
		}
	}

	@Override
	public void delete(int cobuyNo) {
		cobuyDao.delete(cobuyNo);
	}

	@Override
	public List<CobuyCatVO> getMiddleName() {
		return cobuyDao.getMiddleName();
	}

	@Override
	public ConfirmVO getConfirm(ConfirmVO confirmVO) {
		CobuyDTO cobuyDTO = cobuyDao.getConfirm(confirmVO);

		int totalPrice = confirmVO.getQuantity() * cobuyDTO.getPrice();
		confirmVO.setProductNo(cobuyDTO.getCobuyNo());
		confirmVO.setTotalAmount(totalPrice);
		confirmVO.setPrice(cobuyDTO.getPrice());
		confirmVO.setProductName(cobuyDTO.getPname());
		confirmVO.setType("TC0ONETIME");

		return confirmVO;
	}

	@Override
	public List<CobuyListVO> getList(PaginationVO paginationVO) {
		return cobuyDao.cobuyList(paginationVO);
	}

	@Override
	public List<ProductBuyDTO> getbuyList(int memberNo) {
		return cobuyDao.getbuyList(memberNo);
	}

}
