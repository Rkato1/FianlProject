package com.kh.notice.model.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
/*
@Getter 이 두개를 합친게 @Data
@Setter
*/
//알아서 getter,setter,생성자 만들어줌
@Data
public class Notice {
	int noticeNo;
	String noticeTitle;
	String noticeWriter;
	String noticeContent;
	String noticeDate;
	ArrayList<FileVO> fileList;
	
	//getter 추가
	public String getnoticeContentBr() {
		return noticeContent.replace("\r\n", "<br>");
	}
}
