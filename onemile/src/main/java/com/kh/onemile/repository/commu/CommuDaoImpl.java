package com.kh.onemile.repository.commu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.commu.CommuDTO;
import com.kh.onemile.vo.CommuDetailVO;
@Repository
public class CommuDaoImpl implements CommuDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(CommuDTO commuDto) {
		sqlSession.insert("commu.write", commuDto);
	}

	@Override
	public boolean changeCommu(CommuDTO commuDto) {
		int count = sqlSession.update("commu.change", commuDto);
		return count > 0;
	}

	@Override
	public boolean hide(String viewYN) {
		int count = sqlSession.update("commu.hide", viewYN);
		return count > 0;
	}

	@Override
	public List<CommuDetailVO> menuList(String middleName) {
		return sqlSession.selectList("commu.menuList", middleName);
	}

	@Override
	public List<CommuDTO> List() {
		return sqlSession.selectList("commu.list");
	}

	@Override
	public CommuDetailVO detail(int commuNo) {
		return sqlSession.selectOne("commu.detail", commuNo);
	}
}