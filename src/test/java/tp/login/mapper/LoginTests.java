package tp.login.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.vo.MentoringPagingVo;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LoginTests {
	@Autowired
	private LoginMapper loginMapper;
	@Test
	public void testList() {
		//log.info("#mentoringMapper: " + loginMapper.getClass().getName());
		String mem_email = "a@naver.com";
		//log.info("#LoginTests testList(): " + loginMapper.getMembers(mem_email));
		Member m = loginMapper.getMembers(mem_email);
		String mem_pwd = "1234";
		String pwdDb = m.getMem_pwd();
		if(pwdDb != null) pwdDb = pwdDb.trim();
		boolean hashPwd = BCrypt.checkpw(mem_pwd, m.getMem_pwd());
		if(hashPwd == false) {
			log.info("비번불일치"); //비밀번호 불일치
		}else {
			log.info("로그인성공");//로그인 성공
		}	
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
