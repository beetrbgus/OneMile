package com.kh.onemile.service.membership;

import com.kh.onemile.vo.kakaopay.ConfirmVO;

public interface MembershipService {

	public ConfirmVO getConfirm(int productNo , int quantity);

	public void join(int memNo);

	
}
