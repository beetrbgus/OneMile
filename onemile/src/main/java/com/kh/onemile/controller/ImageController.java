package com.kh.onemile.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.repository.reply.ReplyDao;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.reply.ReplyService;
import com.kh.onemile.util.SaveFile;
import com.kh.onemile.vo.reply.ReplyVO;

@RestController
@RequestMapping("/image")
public class ImageController {
	@Autowired
	private SaveFile savefile;
	@Autowired
	private ImageService imageService;
	private final String rootpath="D:/upload";
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> profileUpload(@RequestParam int imageNo, @RequestParam String folder) throws IOException {
		System.out.println("ImageController    imageNo  "+imageNo);
		System.out.println("ImageController    folder  "+folder);
		String path = "";
		switch(folder) {
		
		case "member": path = rootpath+"/member"; break;
		case "miles": path = rootpath+"/miles"; break;
		case "cobuy": path = rootpath+"/cobuy"; break;
		case "commu": path = rootpath+"/commu"; break;
		case "social": path = rootpath+"/social"; break;
		}
		ImageDTO imageDTO = imageService.getImage(imageNo);
				
		byte[] data = savefile.downImg(path, imageNo);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		String encodeName = URLEncoder.encode(imageDTO.getUploadName(), "UTF-8");
		encodeName = encodeName.replace("+", "%20");
		
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+encodeName+"\"")
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.contentLength(imageDTO.getFileSize())
				.body(resource);
	}
}