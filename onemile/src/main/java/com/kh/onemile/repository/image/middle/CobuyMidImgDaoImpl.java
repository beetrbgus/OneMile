package com.kh.onemile.repository.image.middle;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.entity.image.middle.CobuyImgMidDTO;

@Repository
public class CobuyMidImgDaoImpl implements CobuyMidImgDao {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void reg(CobuyImgMidDTO cobuyImgMidDTO) {
		for(int imgIdx : cobuyImgMidDTO.getImgNoList()) {
			cobuyImgMidDTO.setImageNo(imgIdx); //이미지 번호를 한개씩 풀어주는거

			sqlSession.insert("cbi.reg", cobuyImgMidDTO);
		}
	}
	@Override
	public List<CobuyDTO> cobuyDao() {
		// TODO Auto-generated method stub
		return null;
	}
}
