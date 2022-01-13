package com.kh.onemile.service.kakaopay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.repository.cobuy.CobuyBuyDao;
import com.kh.onemile.repository.membership.MembershipBuyDao;
import com.kh.onemile.vo.buy.CoBuyBuyVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BuyTableServiceImpl implements BuyTableService {
	@Autowired
	private MembershipBuyDao membershipBuyDao;
	@Autowired
	private CobuyBuyDao cobuyBuyDao;
	@Override
	public void reg(KakaoPayApproveResponseVO responseVO) {
		
		String cid = responseVO.getCid();
		if (cid.equals("TCSUBSCRIP")) {
			// 결제가 완료된 시점 responseVO를 사용하여 membershipBuyDTO 테이블에 insert를 수행
			MembershipBuyDTO membershipBuyDTO = new MembershipBuyDTO();
			membershipBuyDTO.setSid(responseVO.getSid());// 정기결제 고유번호(SID)
			membershipBuyDTO.setPartnerUserId(responseVO.getPartner_user_id());
			membershipBuyDTO.setTotalAmount(responseVO.getAmount().getTotal());
			membershipBuyDTO.setMspNo(responseVO.getProductNo());
			System.out.println("프로덕트no"+responseVO.getProductNo());
			membershipBuyDTO.setMemberNo(responseVO.getMemberNo());
			log.debug("상품명"+responseVO.getItem_name());
			membershipBuyDTO.setItemName(responseVO.getItem_name());
			membershipBuyDao.insert(membershipBuyDTO);
		} else {
			CoBuyBuyVO coBuyBuyVO = new CoBuyBuyVO();
			coBuyBuyVO.setMemberNo(responseVO.getMemberNo());
			coBuyBuyVO.setProductNo(responseVO.getProductNo());
			coBuyBuyVO.setTid(responseVO.getTid());
			coBuyBuyVO.setItemName(responseVO.getItem_name());
			coBuyBuyVO.setTotalAmount(responseVO.getAmount().getTotal());
			coBuyBuyVO.setQuantity(responseVO.getQuantity());
			log.debug("공동구매 갯수"+responseVO.getQuantity());										
			coBuyBuyVO.setStatus("결제완료");
			cobuyBuyDao.reg(coBuyBuyVO);
			cobuyBuyDao.reduceStock(responseVO.getProductNo(), responseVO.getQuantity());
		}
	}

}
