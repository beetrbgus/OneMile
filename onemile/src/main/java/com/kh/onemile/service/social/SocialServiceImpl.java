package com.kh.onemile.service.social;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;
import com.kh.onemile.entity.map.MapDTO;
import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.repository.image.middle.MiddleImageDAO;
import com.kh.onemile.repository.social.SocialDao;
import com.kh.onemile.repository.social.participant.ParticipantDao;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.map.MapService;
import com.kh.onemile.service.social.participant.ParticipantService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialIndexVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;
import com.kh.onemile.vo.social.participate.ParticipateDetailVO;
import com.kh.onemile.vo.social.participate.ParticipateVO;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class SocialServiceImpl implements SocialService{
	// 시퀀스 이름
	private final String seqName = "social_seq";
	// 파일 저장 폴더
	private final String folderName = "/social";

	@Autowired
	private MapService mapService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private SocialDao socialDao;
	@Autowired @Qualifier("smiDAO")
	private MiddleImageDAO middleImageDao;
	@Autowired
	private Sequence seq;
	@Autowired
	private ParticipantDao participantDao;
	@Autowired
	private ParticipantService participantService;
	@Override
	public int reg(SocialRegVO socialRegVO) throws IllegalStateException, IOException {
		
		//지도 테이블에 저장
		MapDTO mapDTO = new MapDTO();
		
		mapDTO.setLat(socialRegVO.getLat());
		mapDTO.setLng(socialRegVO.getLng());
		mapDTO.setDetailAddress(socialRegVO.getLocation());
		
		int mapNo = mapService.regMap(mapDTO);		
		//소셜링 시퀀스 생성
		int socialNo = seq.nextSequence(seqName);
		log.debug("socialNo " + socialNo);
		//이렇게 해야되나??
		SocialDTO socialDto = new SocialDTO();
		socialDto.setSocialNo(socialNo);
		socialDto.setMemberNo(socialRegVO.getMemberNo());
		socialDto.setTitle(socialRegVO.getTitle());
		socialDto.setSmalltype(socialRegVO.getSmalltype());
		socialDto.setContext(socialRegVO.getContext());
		socialDto.setStartDate(socialRegVO.getStartDate());
		socialDto.setEndDate(socialRegVO.getEndDate());
		socialDto.setMapNo(mapNo);
		socialDto.setMinpeople(socialRegVO.getMinpeople());
		socialDto.setMaxpeople(socialRegVO.getMaxpeople());
		log.debug("SocialDTO     "+socialDto.toString());
		socialDao.reg(socialDto);
		
		//방장 참여자에 추가시키기
		ParticipateVO participateVO = new ParticipateVO();
		participateVO.setMemberNo(socialRegVO.getMemberNo());
		participateVO.setSocialNo(socialNo);
		participantService.regHost(participateVO);
		
		//중간 테이블 DTO에 데이터 저장.
		MiddleImgTableDTO imgMidDTO = new MiddleImgTableDTO();
		imgMidDTO.setConnTableNo(socialNo); // 소셜링 번호
		
		//이미지 저장 & 테이블에 insert.
		List<Integer> imgNoList = imageService.regImage(socialRegVO.getAttach(), folderName);
		for (int imgNo : imgNoList) {
			// 연결 테이블
			imgMidDTO.setImgNo(imgNo);
			// 중간 이미지 테이블에 등록
			middleImageDao.reg(imgMidDTO);
			log.debug("등록 완료  socialImgMidDTO   " + imgMidDTO.toString());
		}
		return socialNo;
		
	}

	@Override
	public List<SocialListVO> getList(PaginationVO paginationVO) {
		return socialDao.getList(paginationVO);
	}
	@Override
	public void modify(SocialRegVO socialRegVO) throws IllegalStateException, IOException {
		//변경된 내용 저장.
		socialDao.modify(socialRegVO);
		
		// 추가한 이미지가 있다면  이미지 저장 + 이미지와 중간 이미지 테이블에 등록.
		if(socialRegVO.getAttach()!=null) {
			//중간 테이블 DTO에 데이터 저장.
			MiddleImgTableDTO imgMidDTO = new MiddleImgTableDTO();
			imgMidDTO.setConnTableNo(socialRegVO.getSocialNo()); // 소셜링 번호

			//이미지 테이블에 등록한 이미지의 번호 가져옴.
			List<Integer> imgNoList = imageService.regImage(socialRegVO.getAttach(), folderName);
			
			for (int imgNo : imgNoList) {
				// 연결 테이블에 이미지 번호 삽입.
				imgMidDTO.setImgNo(imgNo);
				// 중간 이미지 테이블에 등록
				middleImageDao.reg(imgMidDTO);
				log.debug("등록 완료  socialImgMidDTO   " + imgMidDTO.toString());
			}
		}
	}
	@Override
	public SocialDetailVO getDetail(int socialNo) {
		return socialDao.getDetail(socialNo);
	}

	@Override
	public List<SocialDTO> getCount(int memberNo) {
		return socialDao.getCount(memberNo);
	}

	@Override
	public List<SocialListVO> getMemberByList(int memberNo) {
		return socialDao.getMemberByList(memberNo);
	}
	
	@Override
	public void socialJoin(ParticipateVO participateVO) {		
		//소셜번호로 참여자의 숫자와 최대인원을 비교해서 맞으면 참가.
		boolean  result = participantDao.getPartiCnt(participateVO.getSocialNo());
		if(result){
			//참가자 테이블에 집어넣음.
			participantService.reg(participateVO);
			
		}
	}
	@Override
	public void exitSocial(ParticipateVO participateVO) {
		participantService.reject(participateVO);

	}
	@Override
	public List<SocialIndexVO> indexList() {
		return socialDao.getIndexList();
	}

	@Override
	public void delete(int socialNo) {
		socialDao.delete(socialNo);
	}

	@Override
	public List<ParticipateDetailVO> getPaticipantList(int socialNo, int memberNo) {
		return participantService.getPaticipantList(socialNo,memberNo);
	}

	@Override
	public boolean getIsMytown(int socialNo,String goo) {
		return socialDao.getIsMytown(socialNo,goo);
	}

	@Override
	public List<SocialListVO> getMemberByList(int memberNo, int checkNo) {
		log.debug("체크번호 다시확인"+checkNo);
		if(checkNo == 0) {
		return socialDao.getMemberByList(memberNo);
		}
		else if(checkNo == 1) {
			return socialDao.getMemberByList2(memberNo);
		}
		else{
			return socialDao.getMemberByList3(memberNo);
		}
	}
}