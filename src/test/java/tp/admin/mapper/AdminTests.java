package tp.admin.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.vo.MemberPagingVo;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminTests {
	@Autowired
	private AdminMapper adminMapper;
	/*@Test
	public void testList() {
		String mem_email = "a@naver.com";
		int i  = adminMapper.memberCount();
		log.info("#i : " + i);
	}*/
	/*
	@Test
	public void testList() {
		MemberPagingVo memberPagingVo = new MemberPagingVo(1, 3);
	
		List<Member> list = adminMapper.memberList(memberPagingVo);
		log.info("#list: " + list);
	}*/
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
