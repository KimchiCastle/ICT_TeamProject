package util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class MyFileUpload {
	
	public static String myFileUpload(String abs_path, MultipartFile file) {
		
		
		//파일이 비어있다면
		if(file.isEmpty()) {
			
			return "no_file";
		}
		
		System.out.println("파일업로드 if문통과했음 ");
		
		//실제 파일 이름 받아오기
		String image_str = file.getOriginalFilename();
		
		File f = new File(abs_path, image_str);
		
		//동일파일명이 존재하면 이름바꾸기(시간_원본파일명)
		if(f.exists()) {
			
			long time = System.currentTimeMillis();
			
			image_str = String.format("%d_%s",time, image_str);
			
			f = new File(abs_path, image_str);
		}
		
		try {
			file.transferTo(f);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return image_str;
	}
	
}
