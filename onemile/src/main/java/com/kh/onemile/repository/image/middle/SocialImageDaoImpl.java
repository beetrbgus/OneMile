package com.kh.onemile.repository.image.middle;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;

@Qualifier("smiDAO")
@Repository
public class SocialImageDaoImpl implements MiddleImageDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reg(MiddleImgTableDTO middleImgTableDTO) {
		sqlSession.insert("smi.reg",middleImgTableDTO);
	}
	@Override
	public void delete(int socialNo) {
		sqlSession.delete("smi.delete",socialNo);
	}
	@Override
	public List<Integer> find(int connTableNo) {
		// TODO Auto-generated method stub
		return null;
	}
}