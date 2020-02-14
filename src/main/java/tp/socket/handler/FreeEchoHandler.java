package tp.socket.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;
import tp.domain.Member;


@Log4j
public class FreeEchoHandler extends TextWebSocketHandler{
	 List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();//접속 유저 담기
	 Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	 
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
