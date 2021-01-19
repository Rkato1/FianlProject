package com.kh.camp.used.vo;

import lombok.Data;

@Data
public class UsedMessageVO {
	private int umNo;
	private String umSender;
	private String umReceiver;
	private String message;
	private String checkMessage;
	private String umDate;
	
	//getter 추가
		public String getMessageBr() {
			return message.replace("\r\n", "<br>");
		}
}
