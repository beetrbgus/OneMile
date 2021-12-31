package com.kh.onemile.repository.cobuy;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.cobuy.CobuyDTO;

@Repository
public class CobuyDaoImpl implements CobuyDao{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void reg(CobuyDTO cobuyDTO) {
		sqlSession.insert("cobuy.reg",cobuyDTO);
	}
	@Override
	public List<CobuyDTO> cobuyList() {
		return sqlSession.selectList("cobuy.getCobuy");
	}

}
