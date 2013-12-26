package com.feng.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;

public class FileUpLoad {

	public static String uploadFile(HttpServletRequest request,MultipartFile  file2){
		
		String fileName = null;
		
		//�ϴ�·��
		File file = new File("d:/upload");
		//��ʱ�ļ���·��
		File tempFile = new File("d:/uploadtemp");
		
		if(!file.exists()) {
			file.mkdir();
		}
		
		if(!tempFile.exists()) {
			tempFile.mkdir();
		}
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//���û�������С
			factory.setSizeThreshold(1024*10);
			//������ʱ�ļ���
			factory.setRepository(tempFile);
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(1024*1024*10);
			
			try {
				
						//����MD5��ֵ�ж��ļ�ϵͳ���Ƿ���ڱ��ϴ����ļ�
						String path = haveFile(file2.getInputStream());
						if(path != null) {
							fileName = path;
						} else {
							BufferedInputStream bis = new BufferedInputStream(file2.getInputStream());
							
							fileName = getFileNewName(file2.getOriginalFilename());
							BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(file,fileName)));
							
							byte[] buffer = new byte[1024];
							int len = -1;
							while((len = bis.read(buffer)) != -1) {
								bos.write(buffer, 0, len);
							}
							
							bos.flush();
							bos.close();
							bis.close();
						}
					
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			throw new RuntimeException("JSP���ô���");
		}
		
		
		return fileName;
	}
	
	/**
	 * �������ϴ����ļ�
	 * @param name
	 * @return
	 */
	private static String getFileNewName(String name) {
		String extName = name.substring(name.lastIndexOf("."));
		UUID uuid = UUID.randomUUID();
		String newName = uuid.toString() + extName;
		return newName;
	}
	
	/**
	 * ����MD5ֵ�ж��ϴ����ļ��Ƿ�����ڴ�����
	 * @param inputStream
	 * @return
	 */
	private static String haveFile(InputStream inputStream) {
		
		String path = null;
		try {
			String md5 = DigestUtils.md5Hex(inputStream);
			
			File file = new File("D:/upload");
			File[] files = file.listFiles();
			for(File subFile : files) {
				InputStream ins = new FileInputStream(subFile);
				String subFileMd5 = DigestUtils.md5Hex(ins);
				if(md5.equals(subFileMd5)) {
					path = subFile.getName();
				}
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return path;
		
	}
}
