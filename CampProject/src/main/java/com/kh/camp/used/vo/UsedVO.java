package com.kh.camp.used.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class UsedVO {
	private int usedNo;
	private String usedTitle;
	private String usedPrice;
	private String category;
	private String usedWriter;
	private String usedContent;
	private String usedDate;
	private String usedArea;
	private String usedState;
	private String usedChange;
	private ArrayList<UsedFileVO> file;
}
