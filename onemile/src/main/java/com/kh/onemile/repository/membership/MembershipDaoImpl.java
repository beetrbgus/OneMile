package com.kh.onemile.repository.membership;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.entity.product.MembershipDTO;
import com.kh.onemile.vo.membership.MembershipListVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MembershipDaoImpl implements MembershipDao{
	@Autowired
	private SqlSession sqlSession;
	
	//멤버십 상품 리스트(혜택포함)
	@Override
	public List<MembershipListVO> list() {
		return sqlSession.selectList("membership.membershipList");
	}
	
	//결제 상품 정보 확인
	@Override
	public MembershipDTO search(int mspNo) {
		return sqlSession.selectOne("membership.get", mspNo);
	}
	
	//내가 가입한 멤버십
	@Override
	public List<MembershipBuyDTO> joinMembership(int memberNo) {
		return sqlSession.selectList("membership.joinMembership", memberNo);
		
	}

	@Override
	public void join(int memNo) {
		log.debug("memNo :   "+memNo);
		sqlSession.insert("membership.join2",memNo);
		
	}
}