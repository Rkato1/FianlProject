package com.kh.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.model.vo.CampVO;
import com.kh.review.model.vo.ReviewCampVO;
import com.kh.review.model.vo.ReviewCommentVO;
import com.kh.review.model.vo.ReviewVO;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ReviewCampVO> selectList(HashMap<String, Integer> map) {
		List<ReviewCampVO> list = sqlSession.selectList("review.selectList",map);
		return (ArrayList<ReviewCampVO>)list;
	}
	
	public int totalCount() {
		return sqlSession.selectOne("review.totalCount");
	}

	public ReviewVO selectOneReview(int reviewNo) {
		return sqlSession.selectOne("review.selectOneReview", reviewNo);
	}

	public CampVO selectOneCamp(int campNo) {
		return sqlSession.selectOne("review.selectOneCamp", campNo);
	}

	public ReviewVO reviewView(int reviewNo) {
		return sqlSession.selectOne("review.selectOneReview", reviewNo);
	}

	public int selectCommentCnt(int reviewNo) {
		return sqlSession.selectOne("review.selectCntComment", reviewNo);
	}
	
	public ArrayList<ReviewCommentVO> selectReviewComment(int reviewNo) {
		List<ReviewCommentVO> comList= sqlSession.selectList("review.selectListComment", reviewNo);
		return (ArrayList<ReviewCommentVO>) comList;
	}


}
