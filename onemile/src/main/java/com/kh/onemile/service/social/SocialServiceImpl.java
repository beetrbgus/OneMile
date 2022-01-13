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
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.map.MapService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.SocialVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;

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
	
	@Override
	public void reg(SocialRegVO socialRegVO) throws IllegalStateException, IOException {
		
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
		
	}

	//소셜링 디테일
	@Override
	public SocialVO detail(int socialNo) {
		SocialDTO socialDto = new SocialDTO();
		socialDto = socialDao.detail(socialNo);
		
		SocialVO socialVo = new SocialVO();
		
		socialVo.setSocialNo(socialNo);
		
		int memberNo = socialDto.getMemberNo();
//		MemberDTO memberDto = new MemberDTO();
//		memberDto = memberDao.getNick(memberNo);
//		commuVo.setNick(memberDto.getNick());
			
		int mapNo = socialDto.getMapNo();
		
//		MapDTO mapDTO = new MapDTO();
//		mapDTO = mapDao.get(mapNo);
//		
//		socialVo.setLat(mapDTO.getLat());
//		socialVo.setLon(mapDTO.getLng());
//		socialVo.setDetailaddress(mapDTO.getDetailAddress());
//		socialVo.setStartDate(socialDto.getStartDate());
//		
//		socialVo.setAdNo(socialDto.getAdNo());
//		socialVo.setContext(socialDto.getContext());
//		socialVo.setEndDate(socialDto.getEndDate());
//		socialVo.setMemberNo(memberNo);
//		socialVo.setName(socialDto.getTitle());
//		socialVo.setSmalltype(socialDto.getSmallType());
//		socialVo.setType(socialDto.getType());
		return socialVo;
	}

	@Override
	public List<SocialListVO> list() {
		List<SocialListVO> list = socialDao.list();
		return list;
	}

	@Override
	public void changeSocial(SocialVO socialVo) {
		
	}

	@Override
	public List<SocialListVO> getList(PaginationVO paginationVO) {
		return socialDao.getList(paginationVO);
	}

	@Override
	public SocialDetailVO getDetail(int socialNo) {
		
		return socialDao.getDetail(socialNo);
	}
}
