package com.kh.onemile.repository.membership;

import java.util.List;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.entity.product.MembershipDTO;
import com.kh.onemile.vo.membership.MembershipListVO;

public interface MembershipDao {
	//멤버십 상품 리스트(혜택포함)
	List<MembershipListVO> list();
	
	//결제 상품 확인
	MembershipDTO search(int mspNo);
	
	//내가 가입한 멤버십
	List<MembershipBuyDTO> joinMembership(int memberNo);
	
	//기본 멤버십 가입시키기
	void join(int memNo);
}