package com.kh.onemile.repository.certi;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.member.certi.CertiDTO;

@Repository
public class CertiDaoImpl implements CertiDao {

	@Autowired
	private SqlSession sqlSession;

	//DB 저장
	@Override
	public void insert(CertiDTO certiDTO) {
		sqlSession.insert("certi.insert", certiDTO);
	}
	//DB 체크
	@Override
	public boolean check(CertiDTO certiDTO) {
		CertiDTO findDto = sqlSession.selectOne("certi.check", certiDTO);
		if (findDto != null) {//인증 성공 시
			sqlSession.delete("certi.delete", certiDTO.getEmail());
			return true;
		} else {
			return false;
		}
	}
	//DB 청소(스케줄러 매일 오전 9시마다)
	@Override
	public void clean() {
		sqlSession.delete("certi.clean");
	}
}