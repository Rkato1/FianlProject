package com.kh.camp.used.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class UsedVO {
	private int usedNo;
	private String usedTitle;
	private int usedPrice;
	private String category;
	private String usedWriter;
	private String usedContent;
	private String usedDate;
	private ArrayList<UsedFileVO> file;
}
