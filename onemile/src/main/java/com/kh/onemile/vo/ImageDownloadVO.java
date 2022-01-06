package com.kh.onemile.vo;

import com.kh.onemile.entity.image.ImageDTO;

import lombok.Data;

@Data
public class ImageDownloadVO {
	private byte[] data;
	private ImageDTO imageDTO;
}
