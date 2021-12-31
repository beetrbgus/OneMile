package com.kh.onemile.repository.cobuy;

import java.util.List;

import com.kh.onemile.entity.cobuy.CobuyDTO;

public interface CobuyDao {
	public void reg(CobuyDTO cobuyDTO);
	public List<CobuyDTO> cobuyList();
}
