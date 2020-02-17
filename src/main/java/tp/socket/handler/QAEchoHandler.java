package tp.socket.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.socket.service.SocketService;


@Log4j
public class QAEchoHandler extends TextWebSocketHandler{
	 List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();//접속 유저 담기
	 Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	 
	 @Autowired SocketService service;
	 
	 
	 @Override
	 public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		 log.info("#afterConnectionEstablished: " + session);
		 sessions.add(session);
		 String senderEmail = getEmail(session);
		 log.info("#senderEmail: " + senderEmail);
		 userSessionsMap.put(senderEmail, session);
	 }
	 @Override
	 protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		 log.info("#handleTextMessage: " + session + " #TextMessage: " + message);
		 
		 /*
		 for(WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
		 }
		 */
		 String msg = message.getPayload();
		 if(StringUtils.isNotEmpty(msg)) {
			 String[] strs = msg.split(",");
			 
			 //if(strs != null && strs.length == 5) {
			 if(strs != null && strs.length == 4) {
				 String cmd = strs[0];
				 String caller = strs[1];//작성자
				 String receiver = strs[2];//받는사람
				 String mtr_seq = strs[3];//멘토링시퀀스
				 //String qa_msg = strs[4];//적은메세지
				 
				 WebSocketSession mentorSession = userSessionsMap.get(receiver);
				 if(cmd.equals("qa") && mentorSession != null) {
					 long mtr_Seq = Long.parseLong(mtr_seq);
					 Mentoring mentoring = service.getMentoringInfo(mtr_Seq);
					 String mtr_subject = mentoring.getMtr_subject();
					 
					 TextMessage tmpMsg = new TextMessage(caller+"님이 " + "<a href='../qa/qaList.do?mtr_seq="+mtr_Seq+"&cp=1'>"+mtr_subject +"</a> 글에 질문을 작성하였습니다."); 
					 mentorSession.sendMessage(tmpMsg);
				 }
				 
			 }
			 
		 }
		 
	 }
	 
	 @Override
	 public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		 log.info("#afterConnectionClosed: " + session + "#status : " + status);
		 log.info("#session.getId: " + session.getId());
		 userSessionsMap.remove(session.getId());
		 sessions.remove(session);
	 }
	 
	 private String getEmail(WebSocketSession session) {
		 Map<String, Object> httpSession = session.getAttributes();
		 Member loginUser = (Member)httpSession.get("loginUser");
		 if(loginUser == null) {
			 return session.getId();
		 }else {
			 return loginUser.getMem_email();
		 }
	 }
}
