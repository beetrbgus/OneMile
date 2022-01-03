package com.kh.onemile.repository.member.membership;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.member.membership.AdDTO;
@Repository
public class IsMembershipDaoImpl implements IsMembershipDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public AdDTO membership(int memberNo) {
		return sqlSession.selectOne("membership.membershipForMember", memberNo);
	}
}
