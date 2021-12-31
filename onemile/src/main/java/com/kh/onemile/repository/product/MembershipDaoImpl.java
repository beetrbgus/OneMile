package com.kh.onemile.repository.product;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.product.MembershipDTO;

@Repository
public class MembershipDaoImpl implements MembershipDao{
	@Autowired
	private SqlSession sqlSession;
	
	//멤버십 상품 리스트
	@Override
	public List<MembershipDTO> list() {
		return sqlSession.selectList("membership.membershipList");
	}
	//결제 상품 정보 확인
	@Override
	public List<MembershipDTO> search(int mspNo) {
		return sqlSession.selectList("membership.get", mspNo);
	}
}