package com.kh.onemile.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.util.SaveFile;
import com.kh.onemile.vo.ImageDownloadVO;

@RestController
@RequestMapping("/image")
public class ImageController {
	@Autowired
	private SaveFile savefile;
	@Autowired
	private ImageService imageService;

	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> profileUpload(@RequestParam int imageNo, @RequestParam String folder)
			throws IOException {
		// 이미지 다운로드 서비스
		ImageDownloadVO imageDownloadVO = imageService.download(imageNo, folder);

		ByteArrayResource resource = new ByteArrayResource(imageDownloadVO.getData());
		ImageDTO imageDTO = imageDownloadVO.getImageDTO();

		String encodeName = URLEncoder.encode(imageDTO.getUploadName(), "UTF-8");
		encodeName = encodeName.replace("+", "%20");

		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodeName + "\"")
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.contentLength(imageDTO.getFileSize())
				.body(resource);
	}

	// 파일 업로드
	@PostMapping("/upload")
	public int data9(@RequestParam MultipartFile attach, @RequestParam String folder)
			throws IllegalStateException, IOException {
		if (attach.isEmpty()) {
			throw new FileNotFoundException("업로드된 파일이 존재하지 않습니다");
		}
		int imageNo = imageService.regImage(attach, folder);

		return imageNo;
	}
}