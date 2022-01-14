package com.kh.onemile.repository.commu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public boolean hide(int boardNo) {
		int count = sqlSession.update("commu.hide", boardNo);
		return count > 0;
	}

	@Override
	public List<CommuDTO> List() {
		return sqlSession.selectList("commu.list");
	}

	@Override
	public CommuDetailVO detail(int commuNo) {
		return sqlSession.selectOne("commu.detail", commuNo);
	}

	@Override
	public List<CommuDetailVO> menuList(String middleName, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("middleName", middleName);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<CommuDetailVO> list = sqlSession.selectList("commu.menuList", map);
		return list;
	}

	@Override
	public List<CommuDetailVO> adminList(String largeName, int startRow, int endRow, String keyword, String search) {
		Map<String, Object> map = new HashMap<>();
		map.put("largeName", largeName);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("search", search);
		map.put("keyword", keyword);
		List<CommuDetailVO> list = sqlSession.selectList("commu.adminList", map);
		return list;
	}

	@Override
	public java.util.List<CommuDetailVO> boardList(String largeName, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("largeName", largeName);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<CommuDetailVO> list = sqlSession.selectList("commu.boardList", map);
		return list;
	}
}