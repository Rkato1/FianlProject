package com.kh.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.model.vo.CampVO;
import com.kh.reserve.model.vo.ReserveCampVO;
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

	public CampVO selectOneCamp(int campNo) {
		return sqlSession.selectOne("review.selectOneCamp", campNo);
	}
	
	public ReviewVO selectOneReview(int reviewNo) {
		return sqlSession.selectOne("review.selectOneReview", reviewNo);
	}

	public int selectCommentCnt(int reviewNo) {
		return sqlSession.selectOne("review.selectCntComment", reviewNo);
	}
	
	public ArrayList<ReviewCommentVO> selectReviewComment(int reviewNo) {
		List<ReviewCommentVO> comList= sqlSession.selectList("review.selectListComment", reviewNo);
		return (ArrayList<ReviewCommentVO>) comList;
	}

	public int insertReviewComment(ReviewCommentVO rc) {
		return sqlSession.insert("review.insertReviewComment", rc);
	}

	public int searchCampNo(int reviewNo) {
		return sqlSession.selectOne("review.searchCampNo", reviewNo);
	}

	public int updateReviewComment(ReviewCommentVO rc) {
		return sqlSession.update("review.updateReviewComment", rc);
	}

	public int deleteReviewComment(int reviewCommentNo) {
		return sqlSession.delete("review.deleteReviewComment", reviewCommentNo);
	}

	public ArrayList<ReserveCampVO> selectListReserve(int memberNo) {
		List<ReserveCampVO> list = sqlSession.selectList("review.selectListReserve", memberNo);
		return (ArrayList<ReserveCampVO>)list;
	}

	public ArrayList<ReviewCampVO> searchKeyword(HashMap<String, Object> map) {
		List<ReviewCampVO> list = sqlSession.selectList("review.searchKeyword",map);
		return (ArrayList<ReviewCampVO>)list;
	}

	public int totalCountKeyword(String keyword) {
		return sqlSession.selectOne("review.totalCountKeyword", keyword);
	}

}
