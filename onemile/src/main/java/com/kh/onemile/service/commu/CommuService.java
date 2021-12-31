package com.kh.onemile.service.commu;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuVO;

public interface CommuService {
	public void write(CommuVO commuVo) throws IllegalStateException, IOException;
	public void change(CommuVO commuVo) throws IllegalStateException, IOException;
	public void hide(String viewYN);
	public List<CommuDetailVO> menuList(String middleName);
	public CommuDetailVO detail(int commuNo) throws IOException;
}
