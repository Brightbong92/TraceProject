package tp.mentoring.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.extern.log4j.Log4j;
import tp.vo.MentoringPagingVo;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MentoringTests {
	@Autowired
	private MentoringMapper mentoringMapper;
	@Test
	public void testList() {
		log.info("#mentoringMapper: " + mentoringMapper.getClass().getName());
		MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, 1, 5);
		log.info("#mentoringMapperTests testList(): " + mentoringMapper.selectMentoringListExercise(mentoringPagingVo));
	}
	/*
	@Test
	public void testInsert() {
		Address address = new Address(-1, "오늘은", "금요일", null);
		addressMapper.insert(address);
		log.info("#AddressTests insert(): 수행완료");
	}
	@Test
	public void testDelete() {
		addressMapper.delete(4);
		log.info("#AddressTests delete(): 수행완료");
	}
	*/
}
