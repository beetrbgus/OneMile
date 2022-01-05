package com.kh.onemile.repository.map;

import com.kh.onemile.entity.map.MapDTO;

public interface MapDao {
	void regMap(MapDTO mapDto);
	int getSeq();
	MapDTO get(int mapNo);
	void modify(MapDTO mapDTO);
}
