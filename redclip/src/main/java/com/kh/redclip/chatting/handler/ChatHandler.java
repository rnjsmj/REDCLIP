package com.kh.redclip.chatting.handler;

import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.redclip.chatting.model.service.ChatService;
import com.kh.redclip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class ChatHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatService chatService;
	
	//WebSocketSession 정보를 통해 연결된 클라이언트 확인
	//private Set<Map<Integer, WebSocketSession>> sessions = new CopyOnWriteArraySet();
	private Set<WebSocketSession> sessions = new CopyOnWriteArraySet();
	private Set<Map<Integer, String>> roomSessions = new CopyOnWriteArraySet();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("연결 : {}", getId(session));
		sessions.add(session);
		
		
//		연결 -> 채팅방 존재 여부 확인해서 세션에 
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("메시지 내용 : {}", message.getPayload());
		/*
		 * int roomNo = (int) session.getAttributes().get("roomNo"); if (roomNo != 0) {
		 * 
		 * }
		 */
		
		
		
		String senderId = getId(session);
		for (WebSocketSession sess:sessions) {
			if(session != sess) {
				sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
			}
			
		}
		
		
		
		
		
		/*
		 * ObjectMapper objectMapper = new ObjectMapper(); ChatMessage chatMessage =
		 * objectMapper.readValue(message.getPayload(), ChatMessage.class);
		 * 
		 * if(chatService.insertMessage(chatMessage) > 0) { for ( WebSocketSession s :
		 * sessions) { int chatRoomNo = (Integer) s.getAttributes().get("roomNo");
		 * 
		 * if( chatRoomNo == chatMessage.getRoomNo()) { s.sendMessage(new TextMessage(
		 * new Gson().toJson(chatMessage)));; } } }
		 */
	
	}
	
	

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member) httpSession.get("loginUser");
		if (null == loginUser) {
			return session.getId();
		}
		return loginUser.getUserId();
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
		log.info("사용자 접속 종료");
	}
	
	
}
