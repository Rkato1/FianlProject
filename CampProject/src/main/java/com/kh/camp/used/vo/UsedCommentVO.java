package com.kh.camp.used.vo;

import lombok.Data;

@Data
public class UsedCommentVO {
	private int commentNo;
	private String commentLevel;
	private String commentWriter;
	private String commentContent;
	private int usedNo;
	private String commentRef;
	private String commentDate;
}
