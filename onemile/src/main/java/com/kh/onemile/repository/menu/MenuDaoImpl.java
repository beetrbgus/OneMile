package com.kh.onemile.repository.menu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.menu.MenuDTO;

@Repository
public class MenuDaoImpl implements MenuDao{
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<MenuDTO> getmenuList() {
		return sqlSession.selectList("menu.getLarge");
	}
	
}
