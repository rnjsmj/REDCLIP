package com.kh.redclip.chatting.handler;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.redclip.chatting.model.service.ChatService;
import com.kh.redclip.chatting.model.vo.ChatMessage;


import lombok.extern.slf4j.Slf4j;


@Slf4j
public class ChatHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatService chatService;
	
	//WebSocketSession 정보를 통해 연결된 클라이언트 확인
	private Set<WebSocketSession> sessions = new CopyOnWriteArraySet();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("연결 : {}", session.getId());
		sessions.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("메시지 내용 : {}", message.getPayload());
		
		ObjectMapper objectMapper = new ObjectMapper();
		ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
	
		if(chatService.insertMessage(chatMessage) > 0) {
			for ( WebSocketSession s : sessions) {
				int chatRoomNo = (Integer) s.getAttributes().get("roomNo");
				
				if( chatRoomNo == chatMessage.getRoomNo()) {
					s.sendMessage(new TextMessage( new Gson().toJson(chatMessage)));;
				}
			}
		}
	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
		log.info("사용자 접속 종료");
	}
	
	
}
