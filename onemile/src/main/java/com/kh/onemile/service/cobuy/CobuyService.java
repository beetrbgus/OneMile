package com.kh.onemile.service.cobuy;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.cobuy.CobuyDTO;

public interface CobuyService {
	public int reg(CobuyDTO cobuyDTO) throws IllegalStateException, IOException;
	public List<CobuyDTO> getList();
	public CobuyDTO getDetail(int cobuyNo);
	public void modify(CobuyDTO cobuyDTO);
	public void delete();
}
