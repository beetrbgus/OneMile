package com.kh.onemile.service.cobuy;

import java.io.IOException;
import java.util.List;
import com.kh.onemile.entity.cobuy.CobuyModDTO;
import com.kh.onemile.entity.menu.MiddleNameDTO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;

public interface CobuyService {
	public int reg(CobuyRegVO cobuyRegDTO) throws IllegalStateException, IOException;
	public List<CobuyListVO> getList();
	public CobuyDetailVO getDetail(int cobuyNo);
	public void modify(CobuyModDTO cobuyModDTO);
	public void delete(int cobuyNo);
	public List<MiddleNameDTO> getMiddleName();
}
