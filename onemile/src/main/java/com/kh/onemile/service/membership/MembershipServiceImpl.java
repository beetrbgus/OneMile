package com.kh.onemile.service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.product.MembershipDTO;
import com.kh.onemile.repository.membership.MembershipDao;
import com.kh.onemile.vo.kakaopay.ConfirmVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class MembershipServiceImpl implements MembershipService{
	@Autowired
	private MembershipDao membershipDao;
	@Override
	public ConfirmVO getConfirm(int productNo,int quantity) {
		
		log.debug("````````상품번호 : productNo        "+productNo);
		MembershipDTO membershipDTO =membershipDao.search(productNo);
		log.debug("`````````````서치"+membershipDTO.toString());
		
		ConfirmVO confirmVO= new ConfirmVO();
		confirmVO.setTotalAmount(membershipDTO.getMspPrice());
//		confirmVO.setPrice(membershipDTO.getMspPrice());
		confirmVO.setProductNo(membershipDTO.getMspNo());
		confirmVO.setQuantity(1);
		confirmVO.setType("TCSUBSCRIP");
		confirmVO.setProductName(membershipDTO.getMspProduct());
		log.debug("````````confirmVO : confirmVO        "+confirmVO);
		return confirmVO;
	}
}
