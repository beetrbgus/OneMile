package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.middle.MemberImageDTO;
@Repository
public class MemberImageDaoImpl implements MemberImageDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regMi(MemberImageDTO memberImageDTO) {
		sqlSession.insert("mei.regImage", memberImageDTO);
	}
	
	@Override
	public MemberImageDTO get(int meiNo) {
		return sqlSession.selectOne("mei.get", meiNo);
	}

	@Override
	public boolean deleteImage(int meiNo) {
		int count = sqlSession.delete("mei.deleteImage", meiNo);
		return count > 0;
	}

}
