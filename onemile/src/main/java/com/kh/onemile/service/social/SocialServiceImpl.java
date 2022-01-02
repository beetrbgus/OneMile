package com.kh.onemile.service.social;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.map.MapDTO;
import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.repository.map.MapDao;
import com.kh.onemile.repository.member.MemberDao;
import com.kh.onemile.repository.social.SocialDao;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.SocialVO;

@Service
public class SocialServiceImpl implements SocialService{
	final String SEQID = "social_seq";

	@Autowired
	private SocialDao socialDao;
	
	@Autowired
	private MapDao mapDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private Sequence seq;
	
	//소셜링 만들기
	@Override
	public void regSocial(SocialVO socialVo) {
		
		//시퀀스 생성
		int socialNo = seq.nextSequence(SEQID);
		
		SocialDTO socialDto = new SocialDTO();
		socialDto.setSocialNo(socialNo);
		socialDto.setMemberNo(socialVo.getMemberNo());
		socialDto.setTitle(socialVo.getName());
		socialDto.setType(socialVo.getType());
		socialDto.setContext(socialVo.getContext());
		socialDto.setStartDate(socialVo.getStratDate());
		socialDto.setEndDate(socialVo.getEndDate());
		
		double lat = socialVo.getLat();
		double lon = socialVo.getLon();
		
		MapDTO mapDto = new MapDTO();
			
		int mapNo = seq.nextSequence("map_seq");
			
		mapDto.setLat(lat);
		mapDto.setLng(lon);
		mapDto.setMapNo(mapNo);
		mapDto.setDetailaddress(socialVo.getDetailaddress());
			
		mapDao.regMap(mapDto);
		socialDto.setMapNo(mapNo);
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
		
		MapDTO mapDto = new MapDTO();
		mapDto = mapDao.get(mapNo);
		
		socialVo.setLat(mapDto.getLat());
		socialVo.setLon(mapDto.getLng());
		socialVo.setDetailaddress(mapDto.getDetailaddress());
		socialVo.setStratDate(socialDto.getStartDate());
		
		socialVo.setAdNo(socialDto.getAdNo());
		socialVo.setContext(socialDto.getContext());
		socialVo.setEndDate(socialDto.getEndDate());
		socialVo.setMemberNo(memberNo);
		socialVo.setName(socialDto.getTitle());
		socialVo.setSmalltype(socialDto.getSmallType());
		socialVo.setType(socialDto.getType());
		return socialVo;
	}

	@Override
	public List<SocialDTO> list() {
		List<SocialDTO> list = socialDao.list();
		return list;
	}

	@Override
	public void changeSocial(SocialVO socialVo) {
		// TODO Auto-generated method stub
		
	}
}
