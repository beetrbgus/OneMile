package com.kh.onemile.repository.image.middle;

import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;

public interface MiddleImageDAO {
	public void reg(MiddleImgTableDTO middleImgTableDTO);
	public void delete(int no);
}
