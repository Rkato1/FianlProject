package com.kh.camp.used.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class UsedCommentData {
	private UsedVO used;
	private int cnt;
	private ArrayList<UsedCommentVO> clist;
}
