package tp.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import tp.domain.Mentoring;
import tp.domain.Mentoring_Review;
import tp.domain.Mentoring_Review_File;
import tp.domain.Mentoring_Review_Like;
import tp.domain.Mentoring_Review_Reply;
import tp.vo.MentoringReviewPagingVo;

public interface ReviewMapper {
	
	long selectMentoringReviewCount(long mtr_seq); //멘토링리뷰 select or 멘토링리뷰 insert 할때
	
	List<Mentoring_Review> selectMentoringReview(MentoringReviewPagingVo mtr_rv_pagingVo);
	List<Mentoring_Review_Reply> selectMentoringReviewReply(long mtrrv_seq);
	Mentoring selectMentoringSubjectEmail(long mtr_seq);
	List<Mentoring_Review_File> selectMentoringReviewFile(long mtrrv_seq);
	
	
	//멘토링리뷰 댓글쓰기
	
	@Select(value={"SELECT MENTORING_REVIEW_REPLY_SEQ.nextval FROM DUAL"})
	long selectMentoringReviewReplySeq();
	
	@Insert(value={"INSERT INTO MENTORING_REVIEW_REPLY VALUES(#{mtrrvrp_seq}, #{mtrrvrp_content}, SYSDATE, #{mem_email}, #{mtrrv_seq})"})
	void insertMentoringReviewReply(Mentoring_Review_Reply mtr_review_reply);
	
	
	//멘토링리뷰 글쓰기
	
	@Select(value={"SELECT MENTORING_REVIEW_SEQ.nextval FROM DUAL"})
	long selectMentoringReviewSeq();
	
	@Insert(value={"insert into MENTORING_REVIEW values(#{mtrrv_seq}, #{mtrrv_content}, SYSDATE, #{mtrrv_jumsu}, #{mtrrv_likecnt}, #{mtr_seq}, #{mem_email})"})
	void insertMentoringReview(Mentoring_Review mtr_review);
	
	@Select(value={"SELECT MENTORING_REVIEW_FILE_SEQ.nextval FROM DUAL"})
	long selectMentoringFileSeq();
	
	@Insert(value={"INSERT INTO MENTORING_REVIEW_FILE values(#{mtrrvf_seq}, #{mtrrvf_ofname}, #{mtrrvf_fname}, #{mtrrv_seq})"})
	void insertMentoringReviewFile(Mentoring_Review_File mtr_review_file);
	
	@Select(value= {"SELECT sum(MTRRV_JUMSU) FROM MENTORING_REVIEW WHERE MTR_SEQ = #{mtr_seq}"})
	long selectMentoringReviewJumsu(long mtr_seq);
	
	@Update(value={"UPDATE MENTORING SET MTR_JUMSU = #{mtr_jumsu} WHERE MTR_SEQ = #{mtr_seq}"})
	void updateMentoringJumsu(Mentoring mentoring);
	
	
	//좋아요
	
	@Select(value= {"SELECT * FROM MENTORING_REVIEW_LIKE WHERE MEM_EMAIL = #{mem_email} AND MTRRV_SEQ = #{mtrrv_seq}"})
	List<Mentoring_Review_Like> selectMentoringReviewLike(Mentoring_Review_Like mtr_review_like);
	
	@Insert(value= {"INSERT INTO MENTORING_REVIEW_LIKE VALUES(#{mem_email}, #{mtrrv_seq})"})
	void insertMentoringReviewLike(Mentoring_Review_Like mtr_review_like);
	
	@Update(value = {"UPDATE MENTORING_REVIEW SET MTRRV_LIKECNT = MTRRV_LIKECNT+1 WHERE MTRRV_SEQ = #{mtrrv_seq}"})
	void updateMentoringReviewLikeCnt(long mtrrv_seq);
	
}
