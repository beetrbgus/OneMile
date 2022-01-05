package com.kh.onemile.service.map;

import com.kh.onemile.entity.map.MapDTO;

public interface MapService {
	
	public int regMap(MapDTO mapDTO);
	public void modify(MapDTO mapDTO);
}
