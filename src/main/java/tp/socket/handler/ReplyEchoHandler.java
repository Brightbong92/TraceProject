package tp.socket.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;


@Log4j
public class ReplyEchoHandler extends TextWebSocketHandler{
	 List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();//접속 유저 담기

	 @Override
	 public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		 log.info("#afterConnectionEstablished: " + session);
		 sessions.add(session);//접속된 세션들 모두 담는다.
	 }
	 @Override
	 protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		 log.info("#handleTextMessage: " + session + " #TextMessage: " + message);
		 //String senderId = session.getId();
		 //log.info("#senderId: " + senderId);
		 
		 for (WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
			}
		 
	 }
	 
	 @Override
	 public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		 log.info("#afterConnectionClosed: " + session + "#status : " + status);
	 }
}
