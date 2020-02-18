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
import tp.domain.Message_Store;
import tp.socket.service.SocketService;


@Log4j
public class EchoHandler extends TextWebSocketHandler{
	 List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();//접속 유저 담기
	 Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	 
	 @Autowired
	 SocketService service;
	 
	 @Override
	 public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		 //log.info("#afterConnectionEstablished: " + session);
		 sessions.add(session);
		 String senderEmail = getEmail(session);
		 //log.info("#senderEmail: " + senderEmail);
		 userSessionsMap.put(senderEmail, session);
		 
	 }
	 
	 @Override
	 protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		 //log.info("#handleTextMessage: " + session + " #TextMessage: " + message);
		 String msg = message.getPayload();
		 if(StringUtils.isNotEmpty(msg)) {
			 String[] strs = msg.split(",");
			 if(strs != null && strs.length == 3) {
				 String protocol = strs[0];//프로토콜 ex)qa,qarp,rv,rvrp
				 String mtr_seqStr = strs[1];
				 String ms_receiverEmail = strs[2];//받는사람 email DB저장
				 long mtr_seq = Long.parseLong(mtr_seqStr);
				 //String ms_receiverEmail = service.getReceiverEmail(mtr_seq);//받는사람 email DB저장
				 String ms_callerEmail = getEmail(session);//보내는사람 email DB저장
				 String ms_receiverNick = service.getselectMemberNick(ms_receiverEmail);//받는사람 nick
				 String ms_callerNick = service.getselectMemberNick(ms_callerEmail);//보내는사람 nick

				 WebSocketSession userSession = userSessionsMap.get(ms_receiverEmail);

				 if(protocol.equals("qa")) {
					 long ms_seq = selectMessageStoreNextSeq();
					 String ms_content = "<a class='dropdown-item' href='../qa/qaList.do?mtr_seq="+mtr_seq+"&cp=1' ms_seq="+ms_seq+" onclick='msCheck(this);'>"+ms_callerNick+"님으로부터 질문이 작성됐습니다.</a>";
					 insertMessageStore(new Message_Store(ms_seq, ms_callerEmail, ms_receiverEmail, ms_content, null, 0));
				 }else if(protocol.equals("qarp")) {
					 long ms_seq = selectMessageStoreNextSeq();
					 String ms_content = "<a class='dropdown-item' href='../qa/qaList.do?mtr_seq="+mtr_seq+"&cp=1' ms_seq="+ms_seq+" onclick='msCheck(this);'>"+ms_callerNick+"님으로부터 질문답변이 작성됐습니다.</a>";
					 insertMessageStore(new Message_Store(ms_seq, ms_callerEmail, ms_receiverEmail, ms_content, null, 0));
				 }else if(protocol.equals("rv")) {
					 long ms_seq = selectMessageStoreNextSeq();
					 String ms_content = "<a class='dropdown-item' href='../review/reviewList.do?mtr_seq="+mtr_seq+"&cp=1' ms_seq="+ms_seq+" onclick='msCheck(this);'>"+ms_callerNick+"님으로부터 리뷰가 작성됐습니다.</a>";
					 insertMessageStore(new Message_Store(ms_seq, ms_callerEmail, ms_receiverEmail, ms_content, null, 0));
				 }else if(protocol.equals("rvrp")) {
					 long ms_seq = selectMessageStoreNextSeq();
					 String ms_content = "<a class='dropdown-item' href='../review/reviewList.do?mtr_seq="+mtr_seq+"&cp=1' ms_seq="+ms_seq+" onclick='msCheck(this);'>"+ms_callerNick+"님으로부터 리뷰답글이 작성됐습니다.</a>";
					 insertMessageStore(new Message_Store(ms_seq, ms_callerEmail, ms_receiverEmail, ms_content, null, 0));
				 }
				 
				 	if(protocol.equals("qa") && userSession != null) {//온라인 일 시 
						 Mentoring mentoring = getMentoringInfo(mtr_seq);
						 String mtr_subject = mentoring.getMtr_subject();
						 TextMessage tmpMsg = new TextMessage(ms_callerNick+"님이 " + "<a href='../qa/qaList.do?mtr_seq="+mtr_seq+"&cp=1'>"+mtr_subject +"</a> 글에 질문을 작성하였습니다."); 
						 userSession.sendMessage(tmpMsg);
				 	}else if(protocol.equals("qarp") && userSession != null) {
				 		 Mentoring mentoring = getMentoringInfo(mtr_seq);
						 String mtr_subject = mentoring.getMtr_subject();
						 TextMessage tmpMsg = new TextMessage(ms_callerNick+"님이 " + "<a href='../qa/qaList.do?mtr_seq="+mtr_seq+"&cp=1'>"+mtr_subject +"</a> 글에 질문답변을 작성하였습니다."); 
						 userSession.sendMessage(tmpMsg);
				 	}else if(protocol.equals("rv") && userSession != null) {
						 Mentoring mentoring = getMentoringInfo(mtr_seq);
						 String mtr_subject = mentoring.getMtr_subject();
						 TextMessage tmpMsg = new TextMessage(ms_callerNick+"님이 " + "<a href='../review/reviewList.do?mtr_seq="+mtr_seq+"&cp=1'>"+mtr_subject +"</a> 글에 리뷰를 작성하였습니다."); 
						 userSession.sendMessage(tmpMsg);
				 	}else if(protocol.equals("rvrp") && userSession != null) {
						 Mentoring mentoring = getMentoringInfo(mtr_seq);
						 String mtr_subject = mentoring.getMtr_subject();
						 TextMessage tmpMsg = new TextMessage(ms_callerNick+"님이 " + "<a href='../review/reviewList.do?mtr_seq="+mtr_seq+"&cp=1'>"+mtr_subject +"</a> 글에 리뷰답글을 작성하였습니다."); 
						 userSession.sendMessage(tmpMsg);
				 	}
			 }
		 }
	 }
	 
	 
	 private long selectMessageStoreNextSeq() {
		 long seq = service.selectMessageStoreNextSeq();
		 return seq;
	 }
	 
	 private void insertMessageStore(Message_Store msg_store) {
		 service.insertMessageStoreS(msg_store);//DB저장 MS_CONTENT
	 }
	 private Mentoring getMentoringInfo(long mtr_seq) {
		 Mentoring mentoring = service.getMentoringInfo(mtr_seq);
		 return mentoring;
	 }
	 
	 @Override
	 public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		 //log.info("#afterConnectionClosed: " + session + "#status : " + status);
		 //log.info("#session.getId: " + session.getId());
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
