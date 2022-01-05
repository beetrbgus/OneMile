package com.kh.onemile.repository.map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.map.MapDTO;
@Repository
public class MapDaoImpl implements MapDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regMap(MapDTO mapDto) {
		sqlSession.insert("map.regMap", mapDto);
	}

	@Override
	public int getSeq() {
		int seq = sqlSession.selectOne("map.sequence");
		return seq;
	}

	@Override
	public MapDTO get(int mapNo) {
		return sqlSession.selectOne("map.getMap", mapNo);
	}

	@Override
	public void modify(MapDTO mapDTO) {
		sqlSession.update("map.modify", mapDTO);
	}
}
