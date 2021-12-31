package com.kh.onemile.util;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class SaveFile {	
	
	public void saveImg(String savePath, MultipartFile file , String saveName) throws IllegalStateException, IOException {
		File target = new File(savePath, saveName);
		file.transferTo(target);
	}
	public void deleteImg(String savePath, String saveName){
		
		File target = new File(savePath, saveName);
		if(target.exists()) {
			target.delete();
		}
	}
	public void downImg(String savePath, MultipartFile file , String saveName){
		
	}
}
