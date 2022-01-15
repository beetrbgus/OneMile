package com.kh.onemile.repository.image.middle;

import java.util.List;

import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;

public interface MiddleImageDAO {
	public void reg(MiddleImgTableDTO middleImgTableDTO);
	public void delete(int no);
	public List<Integer> find(int connTableNo);
}
