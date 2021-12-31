package com.kh.onemile.service.miles;

import java.io.IOException;

import com.kh.onemile.vo.MilesVO;

public interface MilesService {
	//마일즈 생성
	public void create(MilesVO milesVo) throws IllegalStateException, IOException;
	
}