package com.kh.onemile.service.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;
import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.entity.member.certi.CertiDTO;
import com.kh.onemile.entity.member.membership.AdDTO;
import com.kh.onemile.repository.certi.CertiDao;
import com.kh.onemile.repository.image.middle.MiddleImageDAO;
import com.kh.onemile.repository.member.MemberDao;
import com.kh.onemile.repository.member.membership.IsMembershipDao;
import com.kh.onemile.service.admin.AdminService;
import com.kh.onemile.service.category.CategoryService;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.membership.MembershipService;
import com.kh.onemile.util.DateToString;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.MemberJoinVO;
import com.kh.onemile.vo.MemberVO;
import com.kh.onemile.vo.member.LoginVO;
import com.kh.onemile.vo.social.category.CategoryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	private final String folderName = "/member";
	private final String SEQID = "member_seq";

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
	private AdminService adminService;
	@Autowired @Qualifier("meiDAO")
	private MiddleImageDAO middleImageDao; // 회원 이미지 중간 테이블
	@Autowired
	private ImageService imageService;
	@Autowired
	private MembershipService membershipService;
	
	
	// 회원가입
	@Transactional
	@Override
	public void join(MemberJoinVO memberJoinVO) throws IllegalStateException, IOException {

		// 비밀번호 암호화
		String origin = memberJoinVO.getPw();
		String encrypt = encoder.encode(origin);
		memberJoinVO.setPw(encrypt);

		// 다음 회원번호 가져오기.
		int memNo = seq.nextSequence(SEQID);
		memberJoinVO.setMemberNo(memNo);

		// 회원 테이블에 등록
		memberDao.join(memberJoinVO);
		// 회원 이미지테이블에 등록
		log.debug("memberJoinVO    "+memberJoinVO.toString());
		List<Integer> imgNoList = imageService.regImage(memberJoinVO.getAttach(), folderName);
		// 회원 프로필 테이블에 등록.
		MiddleImgTableDTO imgMidDTO = new MiddleImgTableDTO();
		imgMidDTO.setConnTableNo(memNo); // 회원 번호
		log.debug("imgNoList   "+imgNoList.toString() );
		for (int imgNo : imgNoList) {
			imgMidDTO.setImgNo(imgNo);
			// 중간 이미지 테이블에 등록
			log.debug("멤버 서비스   imgMidDTO     "+imgMidDTO.toString());
			middleImageDao.reg(imgMidDTO);
			log.debug("등록 완료  cobuyImgMidDTO   " + imgMidDTO.toString());

		}
		// 승인 테이블 등록
		adminService.regApproveMember(memNo);
		//기본 멤버십
		membershipService.join(memNo);
		
		// 관심 카테고리 테이블 전송
//		ICService.insert(memberJoinVO, memNo);
		
	}

	// 로그인
	@Override
	public MemberDTO login(LoginVO loginVO) {
		
		log.debug("11비밀번호~~~~~~~~"+loginVO.getPw());
		
		MemberDTO loginMember = memberDao.login(loginVO);
		
		// 암호화 비교
		if (loginMember != null && encoder.matches(loginVO.getPw(), loginMember.getPw())) {
			return loginMember;
		} else {
			return null;
		}
	}
	// 회원탈퇴
	@Override
	public boolean quit(String email, String pw) {
		MemberDTO loginMember = memberDao.get(email);
		boolean match = encoder.matches(pw, loginMember.getPw());
		if (match) {
			return memberDao.quit(email);
		} else {
			return false;
		}
	}

	// 아이디찾기
	@Override
	public MemberDTO findId(MemberDTO memberDTO) {
		return memberDao.findId(memberDTO);
	}

	// 이메일 체크
	@Override
	public boolean emailCheck(CertiDTO certiDTO) {
		return certiDao.check(certiDTO);
	}

	// 비밀번호 변경
	@Override
	public boolean changePw(String email, String nowPw, String changePw) {
		MemberDTO loginMember = memberDao.get(email);// 단일조회
		boolean match = encoder.matches(nowPw, loginMember.getPw());
		if (match) {
			String encrypt = encoder.encode(changePw);
			Map<String, Object> param = new HashMap<>();
			param.put("changePw", encrypt);
			param.put("email", email);
			return memberDao.changePw(param);
		} else {
			return false;
		}
	}

	// 커뮤 글 작성자, 소모임 모임장, 마일즈 모임장 표기를 위해 닉네임 가져오기
	@Override
	public String getNick(int memberNo) {
		return memberDao.getNick(memberNo);
	}

	// 멤버십 혜택
	@Override
	public AdDTO membership(int memberNo) {
		return msDao.membership(memberNo);
	}

	// 회원정보 불러오기
	@Override
	public MemberDTO profile(int memberNo) {
		return memberDao.profile(memberNo);

	}

	// 회원정보 수정
	@Override
	public boolean changeInformation(MemberDTO memberDTO) {
		return memberDao.changeInformation(memberDTO);
	}
	
	//소모임 대분류
	@Override
	public List<CategoryVO> getfavorite() {
		// IC 서비스 만들기.
//		categoryService.list();
		return null; 
	}

	//회원정보 불러오기(사진 포함)
	public MemberVO imageProfile(int memberNo) {
	    MemberVO memberVO = memberDao.imageProfile(memberNo);
	    return memberVO;
	}
	
	//이메일로 가져오기
	@Override
	public boolean getEmail(String email) {
		MemberDTO memberDTO = memberDao.get(email);
		if(memberDTO != null) {
			return true;
		}
		return false;
	}
	
	//닉네임 변경
	@Override
	public int getNickModi(int memberNo) {
		return memberDao.getNickModi(memberNo);
	}

	@Override
	public boolean emailChangePw(String email, String changePw) {
		
		String encrypt = encoder.encode(changePw);
		Map<String, Object> param = new HashMap<>();
		param.put("changePw", encrypt);
		param.put("email", email);
		return memberDao.emailChangePw(param);
		}
	}
