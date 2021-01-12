package com.kh.camp.used.vo;

import java.io.File;

public class FileNameOver {
	public String rename(String path,String filename) {
		// aclass.txt -> aclass(1).txt
		// aclass / .txt로 파일명을 구분하여 저장
		// 파일명 시작부터 마지막 .바로앞까지
		String fileFrontName = filename.substring(0,filename.lastIndexOf('.')); //0index부터.바로앞까지 자르기
		// 마지막 .부터 끝까지
		String fileExtention = filename.substring(filename.lastIndexOf('.'));
		StringBuilder sb = new StringBuilder();
		int num = 0; //파일명 중복시 붙일 숫자
		while(true) {
			sb.setLength(0); //StringBuilder초기화 -> String sb="";
			sb.append(fileFrontName);
			if(num!=0) {
				sb.append("("+num+")");
			}sb.append(fileExtention);
			File checkFile = new File(path+sb.toString());
			if(!checkFile.exists()) {
				break;
			}
			num++;
		}
		return sb.toString();
	}
}
