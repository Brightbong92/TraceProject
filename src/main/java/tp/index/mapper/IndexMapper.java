package tp.index.mapper;

import java.util.List;

import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Review_File;
import tp.vo.ReviewFilesList;

public interface IndexMapper {
	List<Mentoring> bestMentoringTop();
	List<Mentoring> latestArticle();
	Member bestMentoringMentor();
	List<ReviewFilesList> reviewFiles();
	List<Mentoring> cheapArticle();
}
