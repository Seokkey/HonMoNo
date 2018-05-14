package com.project.useClass;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.BoardDao;
import com.project.service.UsedBoardService;

@Service
public class UploadFile {
	//파일 업로드 메소드	
	//String fullPath="D:/Work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SpringMVC-Board/resources/upload";
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	MultipartHttpServletRequest multi;

	@Autowired
	UsedBoardService ubs;
	
	@Autowired
	private BoardDao bDao;
	
	public int fileUp(MultipartHttpServletRequest multi, String inDate, int b_idx,List<MultipartFile> mf ){
		String pathtest ="E:";
		String root="";
		System.out.println("fileUp");
		Map<Object,Object> map = new HashMap<Object,Object>();
		System.out.println("mf  : "+mf);
		//1.이클립스의 물리적 저장경로 찾기
		int success = -1;
		System.out.println("mf size : "+mf.size());
		if(mf.size() ==1){
			root="/resource/thumbnail/";
			map.put("thum", "Y");
		}else{
			root="/resource/"+inDate+"/";
			map.put("thum","N");
		}		

		String path="E:/realFile"+root;
		System.out.println(path);
		//2.폴더 생성을 꼭 할것...
		File dir=new File(path);
		if(!dir.isDirectory()){ 
			dir.mkdir();  
		}
		/*//3.파일을 가져오기-일태그 이름들 반환
		Iterator<String> files=multi.getFileNames(); //파일업로드 2개이상일때
		System.out.println("files  : "+files);
		*/
		for(int i=0;i<mf.size(); i++){
			System.out.println("몇번타니");
			String oriFileName=mf.get(i).getOriginalFilename();
			//4.시스템파일이름 생성  a.txt  ==>112323242424.txt
			String sysFileName=System.currentTimeMillis()+"."
					+oriFileName.substring(oriFileName.lastIndexOf(".")+1);
		
			String realPath=path.substring(pathtest.length());		
			System.out.println(realPath);
			
			try {
				System.out.println(mf.get(i));	
				mf.get(i).transferTo(new File(path+sysFileName));							
			}catch (IOException e) {
				
			}			
			
			
			map.put("b_idx", b_idx);
			map.put("oriFileName", oriFileName);
			map.put("sysFileName",sysFileName);
			map.put("realPath", realPath);
			System.out.println("dndhkdhdkhdkdhk : "+map);
			System.out.println(bDao);
			success = bDao.fileInsert(map);
		}
		return success;
	}
	//파일 다운로드 메소드
	//파일 삭제 메소드
	
}

