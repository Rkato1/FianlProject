package com.kh.admin.model.vo;

import java.util.ArrayList;

import com.kh.review.model.vo.ReviewCommentVO;

import lombok.Data;

@Data
public class ReviewCommentVOPageData {
	ArrayList<ReviewCommentVO> list;
	String pageNavi;
	public ReviewCommentVOPageData(ArrayList<ReviewCommentVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
