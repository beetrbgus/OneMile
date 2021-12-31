package com.kh.onemile.service.commu;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.commu.CommuDTO;
import com.kh.onemile.entity.image.middle.CommuImgMidDTO;
import com.kh.onemile.entity.map.MapDTO;
import com.kh.onemile.repository.commu.CommuDao;
import com.kh.onemile.repository.image.middle.CommuImageDao;
import com.kh.onemile.repository.map.MapDao;
import com.kh.onemile.repository.member.MemberDao;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuVO;

@Service
public class CommuServiceImpl implements CommuService{
	
	private final String folderName = "/commu";
	@Autowired
	private CommuDao commuDao;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private CommuImageDao middleService;
	
	@Autowired
	private MapDao mapDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private Sequence seq;

	//글쓰기
	@Override
	public int write(CommuVO commuVo) throws IllegalStateException, IOException {
		
		//시퀀스 생성
		int commuNo = seq.nextSequence("commu_seq");
		
		//게시글 Dto 설정
		CommuDTO commuDto = new CommuDTO();
		
		commuDto.setCommuNo(commuVo.getCommuNo());
		commuDto.setMemberNo(commuVo.getMemberNo());
		commuDto.setMiddleName(commuVo.getMiddleName());
		commuDto.setTitle(commuVo.getTitle());
		commuDto.setContent(commuVo.getContent());
		
		double lat = commuVo.getLat();
		double lon = commuVo.getLon();
		
		boolean map = lat != 0 && lon != 0; //map 좌표가 0이 아니면
		
		if (map) { //지도가 있으면
			MapDTO mapDto = new MapDTO();
			
			int mapNo = mapDao.getSeq();
			
			mapDto.setLat(lat);
			mapDto.setLon(lon);
			mapDto.setMapNo(mapNo);
			mapDto.setDetailaddress(commuVo.getDetailaddress());
			
			mapDao.regMap(mapDto);
			commuDto.setMapNo(mapNo);
		}
		
		if(commuVo.getAttach()!=null) {
			List<Integer> imgNoList = imageService.regImage(commuVo.getAttach(), folderName);
			
			CommuImgMidDTO commuImgMidDto = new CommuImgMidDTO();
			
			commuImgMidDto.setImgNoList(imgNoList);
			commuImgMidDto.setCommuNo(commuNo);
			
			middleService.reg(commuImgMidDto);
		}
		commuDao.write(commuDto);
		
		return commuNo;
	}
	
	//수정하기
	@Override
	public void change(CommuVO commuVo) throws IllegalStateException, IOException {
		
		//게시글 Dto 설정
		CommuDTO commuDto = new CommuDTO();
		commuDto.setCommuNo(commuVo.getCommuNo());
		commuDto.setMemberNo(commuVo.getMemberNo());
		commuDto.setMiddleName(commuVo.getMiddleName());
		commuDto.setTitle(commuVo.getTitle());
		commuDto.setContent(commuVo.getTitle());
		
		double lat = commuVo.getLat();
		double lon = commuVo.getLon();
			
		boolean map = lat != 0 && lon != 0; //map 좌표가 0이 아니면
			
		if (map) { //지도가 있으면
			MapDTO mapDto = new MapDTO();
			
			int mapNo = mapDao.getSeq();
			
			mapDto.setLat(lat);
			mapDto.setLon(lon);
			mapDto.setMapNo(mapNo);
			mapDto.setDetailaddress(commuVo.getDetailaddress());
			
			mapDao.regMap(mapDto);
			//commuDto.setMapNo(mapNo);
		}
			commuDao.write(commuDto);
	}

	//숨김처리
	@Override
	public void hide(String viewYN) {
		// TODO Auto-generated method stub
	}

	//카테고리별 리스트
	@Override
	public List<CommuDetailVO> menuList(String middleName) {
		List<CommuDetailVO> list = commuDao.menuList(middleName);
		return list;
	}
	
	//상세조회
	@Override
	public CommuDetailVO detail(int commuNo) throws IOException {
		CommuDetailVO commuVo = commuDao.detail(commuNo);
		return commuVo;
	}
}
