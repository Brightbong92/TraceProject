package tp.join.service;

import java.util.HashMap;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tp.domain.Email_Auth;
import tp.domain.Member;
import tp.join.mapper.JoinMapper;

@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	private JoinMapper joinMapper;
	
	@Override
	public void insertKakaoMemberS(Member member) {
		joinMapper.insertKakaoMember(member);
	}

	@Override
	public boolean selectCheckEmailS(String mem_email) {
		
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//map.put("mem_email", mem_email);
		//map.put("mem_gubun", 0);//0은 순수회원 //멤버의 구분 0(순수회원) 1(카카오) 2(네이버)
		String email = joinMapper.selectCheckEmail(mem_email);
		//String email = joinMapper.selectCheckEmail(map);
		if(email == null) { 
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean selectCheckNickS(String mem_nick) {
		String nick = joinMapper.selectCheckNick(mem_nick);
		if(nick == null) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	@Transactional
	public void insertTraceMemberS(Member member) {//트랜잭션처리
		joinMapper.insertTraceMember(member); // 회원정보 insert
		int email_uuid = joinAuth(member.getMem_email());//이메일 인증번호 보고 인증번호 리턴
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_email", member.getMem_email());
		map.put("email_uuid", email_uuid);
		joinMapper.insertEmailAuth(map);//이메일 인증번호 insert
	}

	@Override
	public Email_Auth selectEmailAuthS(String mem_email) {
		return joinMapper.selectEmailAuth(mem_email);
	}
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.

	public int joinAuth(String mem_email) {
		mem_email = mem_email.trim();
		
		Random r = new Random();
        int email_uuid = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        String setfrom = "wkdgusqhd080@gmail.com";
        String tomail = mem_email; // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        System.getProperty("line.separator")+  
        "안녕하세요 회원님. 발자취 - '발견하라 자신의 취미'를 찾아주셔서 감사합니다"
        +System.getProperty("line.separator")+
        System.getProperty("line.separator")+
        " 인증번호는 " +email_uuid+ " 입니다. ";

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");
            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        return email_uuid;
	}

	@Override
	@Transactional
	public void deleteEmailAuthUpdateMember(String mem_email) {
		joinMapper.updateMemberState(mem_email);
		joinMapper.deleteEmailAuth(mem_email);
	}

	@Override
	@Transactional
	public void reAuthIssuanceS(String mem_email) {//이메일 인증번호 재발급
		joinMapper.deleteEmailAuth(mem_email);//기존의 인증번호 삭제
		int email_uuid = joinAuth(mem_email);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_email", mem_email);
		map.put("email_uuid", email_uuid);
		joinMapper.insertEmailAuth(map);
	}

}
