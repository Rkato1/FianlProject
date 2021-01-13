package com.kh.review.model.vo;

import java.io.File;

public class ReviewFileName {
	
	public String rename(String path, String filename) {
		//중복되는 파일명 처리방식 괄호(넘버링)
		//aclass.txt -> aclass(1).txt
		
		//aclass - .txt로 파일명을 구분하여 저장
		//파일명 시작부터 .바로 앞까지 잘라내기
		String fileFrontName = filename.substring(0, filename.lastIndexOf('.'));
		//마지막 .부터 끝까지 잘라내기
		String fileExtention = filename.substring(filename.lastIndexOf('.'));
		
		StringBuilder sb = new StringBuilder();
		int num = 0; //파일명 중복 시 붙일 숫자
		
		while(true) {
			//반복문이 돌 때마다 StringBuilder 초기화
			//(String sb = ""이런 작업과 동일함)
			sb.setLength(0);
			sb.append(fileFrontName);
			//파일명이 겹치치 않으면 넘버를 붙이지 않음
			if(num != 0) {
				sb.append("("+num+")");
			}
			sb.append(fileExtention);
			File checkFile = new File(path+sb.toString());
			//파일이 존재하지 않으면
			if(!checkFile.exists()) {
				break;
			}
			num++;
		}
		return sb.toString();
	}

}
