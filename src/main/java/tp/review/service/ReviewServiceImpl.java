package tp.review.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import tp.domain.Mentoring;

import tp.domain.Mentoring_Review;
import tp.domain.Mentoring_Review_File;
import tp.domain.Mentoring_Review_Like;
import tp.domain.Mentoring_Review_Reply;
import tp.mentoring.service.MentoringPath;
import tp.review.mapper.ReviewMapper;

import tp.vo.MentoringReviewPagingVo;
import tp.vo.MentoringReviewVo;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewMapper reviewMapper;
	
	@Override
	public MentoringReviewVo getMentoringReviewVo(long mtr_seq, long cp, long ps) {
		List<List<Mentoring_Review_Reply>> mtr_review_reply_list = new ArrayList<List<Mentoring_Review_Reply>>();
		List<List<Mentoring_Review_File>> mtr_review_file_list = new ArrayList<List<Mentoring_Review_File>>();
		
		MentoringReviewPagingVo pagingVo = new MentoringReviewPagingVo(cp,ps,mtr_seq);
		List<Mentoring_Review> mtr_review_list = reviewMapper.selectMentoringReview(pagingVo);
		
		long totalCount = reviewMapper.selectMentoringReviewCount(mtr_seq);
		Mentoring mtr = reviewMapper.selectMentoringSubjectEmail(mtr_seq);
		for(Mentoring_Review list : mtr_review_list) {
			long mtrrv_seq = list.getMtrrv_seq();
			//log.info("#mtrrv_seq: " + mtrrv_seq);
			List<Mentoring_Review_Reply> mtr_review_reply = reviewMapper.selectMentoringReviewReply(mtrrv_seq); 
			mtr_review_reply_list.add(mtr_review_reply);
			List<Mentoring_Review_File> mtr_review_file = reviewMapper.selectMentoringReviewFile(mtrrv_seq);
				if(mtr_review_file.size() != 0) {
					mtr_review_file_list.add(mtr_review_file);
				}
			}
			//log.info("#mtr_review_file_list: " + mtr_review_file_list);
			return new MentoringReviewVo(cp, totalCount, ps, mtr_review_list, mtr_review_file_list, mtr_review_reply_list, 
										 mtr.getMtr_subject(), mtr_seq, mtr.getMem_email());
	}

	@Override
	@Transactional
	public void mentoringReviewReplyRegister(Mentoring_Review_Reply mtr_review_reply) {
		long mtrrvrp_seq = reviewMapper.selectMentoringReviewReplySeq();
		mtr_review_reply.setMtrrvrp_seq(mtrrvrp_seq);
		reviewMapper.insertMentoringReviewReply(mtr_review_reply);
	}
	
	@Override
	public Mentoring getMentoringSubject(long mtr_seq) {
		Mentoring mtr = reviewMapper.selectMentoringSubjectEmail(mtr_seq);
		return mtr;
	}

	@Override
	@Transactional
	public void mentoringReviewRegister(long mtr_seq, String mtrrv_content, ArrayList<MultipartFile> mtrrv_file,
			int star_input, String mem_email
			) {
		long mtrrv_seqNextSeq = reviewMapper.selectMentoringReviewSeq();
		
		Mentoring_Review mtr_review = new Mentoring_Review(mtrrv_seqNextSeq, mtrrv_content, null, 
						star_input, 0, mtr_seq, mem_email);
		reviewMapper.insertMentoringReview(mtr_review);

		
		if(mtrrv_file.size() != 0) {
			for(MultipartFile file : mtrrv_file) {
				String fname = file.getOriginalFilename();
				if(!fname.equals("")) {
					fname = fname.trim();
					saveStore(file, mtrrv_seqNextSeq);
				}
			}
		}
		
		long mtr_review_jumsu_total = reviewMapper.selectMentoringReviewJumsu(mtr_seq);
		long mtr_review_count = reviewMapper.selectMentoringReviewCount(mtr_seq);
		long mtr_jumsu = mtr_review_jumsu_total / mtr_review_count;
		
		Mentoring mtr = new Mentoring();mtr.setMtr_seq(mtr_seq);mtr.setMtr_jumsu(mtr_jumsu);
		reviewMapper.updateMentoringJumsu(mtr);

	}

	private String saveStore(MultipartFile f, long mtrrv_seqNextSeq) {
		//log.info("#service saveStore() f: " + f);
		String ofname = f.getOriginalFilename();
		int idx = ofname.lastIndexOf(".");
		String ofheader = ofname.substring(0, idx); 
		String ext = ofname.substring(idx);
		
		//long fsize = f.getSize();
		long ms = System.currentTimeMillis();	
		String fname = ofheader + "_" + ms + ext;
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String saveFileName = sb.toString();
		//log.info("ofname: " + ofname + ", ext: " + ext + ", fsize: " + fsize);
		//log.info("ofname: " + ofname + ", fname: " + fname);
		//log.info("ofname: " + ofname + ", fname: " + saveFileName);
		
		boolean flag = writeFile(f, saveFileName);
		if(flag) {
			long mtrrvf_seqNextSeq = reviewMapper.selectMentoringFileSeq();
			Mentoring_Review_File mtr_review_file = new Mentoring_Review_File(mtrrvf_seqNextSeq, 
					ofname, saveFileName, mtrrv_seqNextSeq);
			reviewMapper.insertMentoringReviewFile(mtr_review_file);
			log.info("파일출력성공");
		}else {
			log.info("파일출력실패");
		}
		return fname;
	}

	private boolean writeFile(MultipartFile f, String saveFileName) {
		//log.info("#service writeFile() f: " + f + ", saveFileName: " + saveFileName);
		
		File rDir = new File(MentoringReviewPath.FILE_STORE);
		if(!rDir.exists()) {
			rDir.mkdirs();
		}
		
		FileOutputStream fos = null;
		try {
			byte data[] = f.getBytes();
			fos = new FileOutputStream(MentoringReviewPath.FILE_STORE + saveFileName);
			fos.write(data);
			fos.flush();
			return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {
			}
		}
	}

	@Override
	@Transactional
	public boolean mentoringReviewLikePlus(Mentoring_Review_Like mtr_review_like) {
		List<Mentoring_Review_Like> mtr_review_like_list = reviewMapper.selectMentoringReviewLike(mtr_review_like);
		if(mtr_review_like_list.size() == 0) {
			reviewMapper.insertMentoringReviewLike(mtr_review_like);
			reviewMapper.updateMentoringReviewLikeCnt(mtr_review_like.getMtrrv_seq());
			return true;
		}else {
			return false;
		}
	}

}
