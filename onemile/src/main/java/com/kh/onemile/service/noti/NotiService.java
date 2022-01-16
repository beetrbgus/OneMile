package com.kh.onemile.service.noti;

import java.util.List;

import com.kh.onemile.entity.noti.NotiDTO;

public interface NotiService {
	public void reg();
	public void delete();
	public List<NotiDTO> getList();
	public NotiDTO getDetail();
}
