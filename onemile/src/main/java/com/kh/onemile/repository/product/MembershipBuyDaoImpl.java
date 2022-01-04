package com.kh.onemile.repository.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.util.Sequence;

@Repository
public class MembershipBuyDaoImpl implements MembershipBuyDao{
	final String SEQID = "msb_seq";
	@Autowired
	private Sequence seq;
	@Autowired
	private SqlSession sqlSession;
	
	//정기결제 내역 DB에 저장
	@Override
	public void insert(MembershipBuyDTO membershipBuyDTO) {
	int msbNo = seq.nextSequence(SEQID);
	membershipBuyDTO.setMsbNo(msbNo);
	
	sqlSession.insert("membership.join",membershipBuyDTO);
	}
	
	//날짜 비교하기
	@Override
	public List<MembershipBuyDTO> dayCheck() {
		return sqlSession.selectList("membership.dayCheck");
		
	}
	//정기결제 전체목록
	@Override
	public List<MembershipBuyDTO> list() {
		return sqlSession.selectList("membership.dayCheck");
	}

	@Override
	public void regularPayDelete(String sid) {
		sqlSession.delete("membership.regularPayDelete", sid);
		
	}
}