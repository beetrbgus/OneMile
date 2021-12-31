package com.kh.onemile.repository.commu;

import java.util.List;

import com.kh.onemile.entity.commu.CommuDTO;
import com.kh.onemile.vo.CommuDetailVO;

public interface CommuDao {
	void write(CommuDTO commuDto);
	boolean hide(String viewYN);
	List<CommuDetailVO> menuList(String middleName);
	List<CommuDTO> List();
	//CommuDTO detail(int commuNo);
	boolean changeCommu(CommuDTO commuDto);
	CommuDetailVO detail(int commuNo);
}
