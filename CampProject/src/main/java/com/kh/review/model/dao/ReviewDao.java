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
import com.kh.review.model.vo.ReviewFileVO;
import com.kh.review.model.vo.ReviewVO;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ReviewCampVO> selectList(HashMap<String, Integer> map) {
		List<ReviewCampVO> list = sqlSession.selectList("review.selectListAll",map);
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

	public int deleteReview(int reviewNo) {
		return sqlSession.delete("review.deleteReview", reviewNo);
	}
	
	public int insertReview(ReviewVO r) {
		return sqlSession.insert("review.insertReview", r);
	}

	public int selectReviewNo() {
		return sqlSession.selectOne("review.selectReviewNo");
	}

	public int insertReviewFile(ReviewFileVO rfv) {
		return sqlSession.insert("review.insertReviewFile", rfv);
	}

	public int selectCampNo(int reserveNo) {
		return sqlSession.selectOne("review.selectCampNo", reserveNo);
	}

	public ArrayList<ReviewFileVO> selectFileList(int reviewNo) {
		List<ReviewFileVO> list = sqlSession.selectList("review.selectFileList", reviewNo);
		return (ArrayList<ReviewFileVO>)list;
	}

	public int updateReview(ReviewVO r) {
		return sqlSession.update("review.updateReview", r);
	}

	public int deleteReviewFilepath(ArrayList<String> delFilepathList) {
		return sqlSession.delete("review.deleteReviewFilepath", delFilepathList);
	}

	public ArrayList<String> selectReviewFilepath(int reviewNo) {
		List<String> list = sqlSession.selectList("review.selectReviewFilepath", reviewNo);
		return (ArrayList<String>)list;
	}

}
