package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;

@Qualifier("cmiDAO")
@Repository
public class CommuImageDaoImpl implements MiddleImageDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reg(MiddleImgTableDTO middleImgTableDTO) {
		sqlSession.insert("cmi.regCmi", middleImgTableDTO);
	}

	@Override
	public void delete(int commuNo) {
		sqlSession.delete("cmi.delete",commuNo);
	}
	
}

