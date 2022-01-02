package com.kh.onemile.service.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onemile.entity.image.middle.MemberProfileMidDTO;
import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.entity.member.certi.CertiDTO;
import com.kh.onemile.entity.member.membership.AdDTO;
import com.kh.onemile.repository.certi.CertiDao;
import com.kh.onemile.repository.image.middle.MemberImageDao;
import com.kh.onemile.repository.member.MemberDao;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.repository.member.membership.IsMembershipDao;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.util.SetDefaut;
import com.kh.onemile.vo.MemberJoinVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	private final String folderName="/member";
	private final String SEQID = "member_seq";
	private final String SEQNAME = "member_no";//혹시 몰라서 보류 나중에 지우기
	
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CertiDao certiDao;
	@Autowired
	private IsMembershipDao msDao;
	@Autowired
	private Sequence seq;
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private ImageService imageService; //이미지 서비스
	@Autowired
	private MemberImageDao middleService; // 이미지 중간 테이블 서비스
	
	@Autowired
	private SetDefaut setDefault;
	
	// 회원가입
	@Override
	public int join(MemberJoinVO memberJoinVO) throws IllegalStateException, IOException {
		setDefault.setMemberCoronaDefault(memberJoinVO.getCorona());
		// 비밀번호 암호화
		String origin = memberJoinVO.getPw();
		String encrypt = encoder.encode(origin);
		memberJoinVO.setPw(encrypt);
		
		//다음 회원번호 가져오기.
		int memNo = seq.nextSequence(SEQID);
		memberJoinVO.setMemberNo(memNo);
		log.debug("가입한 회원번호   "+ memNo);
		memberDao.join(memberJoinVO);//회원테이블에 등록
		if(memberJoinVO.getAttach() != null) {  //사진이 있으면
			List<Integer> imgNoList = imageService.regImage(memberJoinVO.getAttach(), folderName);
		
		//연결 테이블
		MemberProfileMidDTO memberProfileMidDTO = new MemberProfileMidDTO();
		
		memberProfileMidDTO.setImgNoList(imgNoList);
		memberProfileMidDTO.setMemberNo(memNo);
		
		// 중간 이미지 테이블에 등록
		middleService.reg(memberProfileMidDTO);
		log.debug("등록 완료  memberJoinVO   "+memberProfileMidDTO.toString());
		}
		return memNo;
	}

	//로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		MemberDTO loginMember = memberDao.login(memberDTO);
		//암호화 비교
		if(encoder.matches(memberDTO.getPw(), loginMember.getPw())) {
			return loginMember;
		}
		else {
			return null;
		}
	}
	//회원탈퇴
	@Override
	public boolean quit(String email, String pw) {
		MemberDTO loginMember = memberDao.get(email);
		boolean match = encoder.matches(pw, loginMember.getPw());
		if(match) {	
			return memberDao.quit(email);
		}else {
			return false;
		}
	}
	//아이디찾기
	@Override
	public MemberDTO findId(MemberDTO memberDTO) {
		return memberDao.findId(memberDTO);
	}
	//이메일 체크
	@Override
	public boolean emailCheck(CertiDTO certiDTO) {
		return certiDao.check(certiDTO);
	}

	//비밀번호 변경
	@Override
	public boolean changePw(String email, String nowPw, String changePw) {
		MemberDTO loginMember = memberDao.get(email);//단일조회
		boolean match = encoder.matches(nowPw, loginMember.getPw());
		if(match) {
			String encrypt = encoder.encode(changePw);
			Map<String, Object> param = new HashMap<>();
			param.put("changePw",encrypt);
			param.put("email",email);
			return memberDao.changePw(param);
		}else {
			return false;
		}
	}
	
	@Override
	public String getNick(int memberNo) {
		return memberDao.getNick(memberNo);
	}

	@Override
	public AdDTO membership(int memberNo) {
		return msDao.membership(memberNo);
	}
}