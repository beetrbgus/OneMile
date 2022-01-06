package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;

@Qualifier("cbiDAO")
@Repository
public class CobuyMidImgDaoImpl implements MiddleImageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reg(MiddleImgTableDTO middleImgTableDTO) {
		sqlSession.insert("cbi.reg", middleImgTableDTO);
	}

	@Override
	public void delete(int cobuyNo) {
		sqlSession.delete("cbi.delete", cobuyNo);
	}
	
}
