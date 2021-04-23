package com.kjh.jblog.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	private static String SAVE_PATH="C:\\Users\\wlgud30\\git\\jblog\\Jblog\\src\\main\\webapp\\assets\\img";
	private static Logger logger = LoggerFactory.getLogger(FileUploadService.class);
	
	
	public String store(MultipartFile multipartFile) {
		String saveFilename ="";
		try {
			String originalFileName = multipartFile.getOriginalFilename();
			Long size = multipartFile.getSize();
			logger.debug("multipartFile 원본파일명 : "+originalFileName);
			logger.debug("multipartFile 원본파일 크기 : "+size);
			
			if(size == 0) {
				return "";
			}
			
			//확장자 분리
			String extName = originalFileName.substring(originalFileName.lastIndexOf('.'));
			logger.debug(extName);
			//저장될 실제 파일명
			saveFilename = getSaveFilename(extName);
			logger.debug(saveFilename);
			//멀티파트 파일을 SAVE_PATH
			writeFile(multipartFile,saveFilename);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
	
	private String getSaveFilename(String ext) {	//확장자를 인자값으로
		//실제 저장될 파일명 규칙 -> 시간정보를 가지고 파일 이름 변경
		Calendar cal = Calendar.getInstance();
		
		return String.valueOf(cal.getTimeInMillis()/1000)+ext;
	}
	
	private void writeFile(MultipartFile mFile,String saveFilename) throws IOException {
		//mFile -> saveFilename으로 저장
		byte[] fileData = mFile.getBytes();		//실제 이진 파일 정보 배열
		
		FileOutputStream fos = new FileOutputStream(SAVE_PATH+"/"+saveFilename);
		
		fos.write(fileData);
		fos.flush();
		fos.close();
	}
}
