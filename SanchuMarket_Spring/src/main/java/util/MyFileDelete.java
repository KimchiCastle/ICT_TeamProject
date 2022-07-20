package util;

import java.io.File;

public class MyFileDelete {
	
	public static void myFileDelete(String abs_path, String FileName){
		
		File file = new File(abs_path, FileName);
		file.delete();
		
	}
	
	
}
