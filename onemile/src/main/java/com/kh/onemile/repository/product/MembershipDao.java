package com.kh.onemile.repository.product;

import java.util.List;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.entity.product.MembershipDTO;

public interface MembershipDao {
	//멤버십 상품 리스트
	List<MembershipDTO> list();
	//결제 상품 확인
	List<MembershipDTO> search(int mspNo);
	
	//내가 가입한 멤버십
	List<MembershipBuyDTO> joinMembership(int memberNo);
}