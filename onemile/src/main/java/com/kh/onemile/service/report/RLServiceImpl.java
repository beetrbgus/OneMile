package com.kh.onemile.service.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onemile.repository.report.RLDao;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.report.ReportRegVO;
import com.kh.onemile.vo.report.middle.MiddleRLVO;

@Transactional
@Service
public class RLServiceImpl implements RLService {
	@Autowired
	private RLDao rlDao;
	@Autowired
	private MiddleRLService middleRLService;
	@Autowired
	private Sequence seq;

	// 신고 서비스 - 메인 -> 중간테이블에 의뢰
	// 중간 테이블 서비스를 만들었음.
	// 저기서 DAO 넘김. 다오로 넘길 때 분류 (회원, 게시글, 소셜 )
	// 다오를 맞게 찾아가게 함.
	@Override
	public void reg(ReportRegVO reportVO) {
		int rlNo = seq.getSequence("rl_seq");
		// 신고 테이블에 저장.
		rlDao.reg(reportVO);

		// 중간 테이블에 저장.
		MiddleRLVO middleRLVO = new MiddleRLVO();
		middleRLVO.setConnTableNo(reportVO.getConnTableNo());
		middleRLVO.setRlNo(rlNo);
		middleRLVO.setType(reportVO.getType());
		middleRLService.reg(middleRLVO);
	}

	@Override
	public void delete(int rlNo, String type) {
		rlDao.delete(rlNo);

		// 중간 테이블에 저장.
		MiddleRLVO middleRLVO = new MiddleRLVO();
		middleRLVO.setConnTableNo(reportVO.getConnTableNo());
		middleRLVO.setRlNo(rlNo);
		middleRLVO.setType(reportVO.getType());
		middleRLService.delete(rlNo,type);
	}

	@Override
	public void adminDelete(int rlNo,String type) {
		rlDao.adminDelete(rlNo);

		// 중간 테이블에 저장.
		MiddleRLVO middleRLVO = new MiddleRLVO();
		middleRLVO.setRlNo(rlNo);
		middleRLVO.setType(type);
		middleRLService.delete(rlNo,type);
	}

}
