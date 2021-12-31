package com.kh.onemile.repository.image.middle;

import java.util.List;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.entity.image.middle.CobuyImgMidDTO;

public interface CobuyMidImgDao {

	void reg(CobuyImgMidDTO cobuyImgMidDTO);
	List<CobuyDTO> cobuyDao();

}
