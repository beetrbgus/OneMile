package com.kh.onemile.repository.image.middle;

import com.kh.onemile.entity.image.middle.MemberImageDTO;

public interface MemberImageDao {
	void regMi(MemberImageDTO memberImageDTO);
	MemberImageDTO get(int meiNo);
	boolean deleteImage(int meiNo);
}