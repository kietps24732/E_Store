package com.fpoly.Utils;

import java.io.File;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MultipleUpload {

	public File handleUploadFile( MultipartFile[] uploadFile) {
		String folderPath = "F:\\JAVA_5_SpringBoot\\E_Store-main\\E_Store-main\\src\\main\\webapp\\img";
		File myUploadFile = new File(folderPath);
		
		// Kiểm tra xem File đã tồn tại hay chưa
		if(!myUploadFile.exists()) {
			myUploadFile.mkdirs();
		}
		// Lưu File vào thư mục đã chọn
		File saveFile = null;
		try {
		//	String uuid = UUID.randomUUID().toString();
//			String fileName = uuid + "_" + uploadFile.getOriginalFilename();
//			 saveFile = new File(myUploadFile, fileName);
//			uploadFile.transferTo(saveFile);
//			
			
			for (int i = 0; i < uploadFile.length; i++) {
			//	String uuid = UUID.randomUUID().toString();
				String fileName =  uploadFile[i].getOriginalFilename();			
				saveFile = new File(myUploadFile, fileName);
				uploadFile[i].transferTo(saveFile);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return saveFile;
	}
}
