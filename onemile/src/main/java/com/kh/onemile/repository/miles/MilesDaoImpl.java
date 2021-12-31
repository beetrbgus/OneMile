package com.kh.onemile.repository.miles;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.miles.MilesDTO;

@Repository
public class MilesDaoImpl implements MilesDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//마일즈 생성
	@Override
	public void create(MilesDTO milesDTO) {
		sqlSession.insert("miles.create",milesDTO);
	}
}