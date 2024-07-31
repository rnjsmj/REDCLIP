package com.kh.redclip.chatting.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.redclip.chatting.model.service.ChatService;
import com.kh.redclip.chatting.model.vo.ChatMessage;
import com.kh.redclip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class ChatHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatService chatService;
	
	//WebSocketSession 정보를 통해 연결된 클라이언트 확인
	//private Set<Map<Integer, WebSocketSession>> sessions = new CopyOnWriteArraySet();
	private Set<WebSocketSession> sessions = new CopyOnWriteArraySet();
	private List<HashMap<String, Object>> roomSessions = new ArrayList<HashMap<String, Object>>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessions.add(session);
		
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		String roomNo = url.split("/chatting/")[1];
		
		int idx = roomSessions.size();
		if(idx > 0) {
			for(int i=0; i<idx; i++) {
				
				String rN = (String) roomSessions.get(i).get("roomNo");
				String uId = (String) roomSessions.get(i).get("userId");
				if(rN.equals(roomNo) && uId.equals(getId(session))) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) { 
			HashMap<String, Object> map = roomSessions.get(idx);
			map.put("roomNo", roomNo);
			map.put("socketSession", session);
			map.put("userId", getId(session));
		} else {  
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("roomNo", roomNo);
			map.put("socketSession", session);
			map.put("userId", getId(session));
			roomSessions.add(map);
		}
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) {
		String fullMessage = message.getPayload();
		
		//fullMessage : {roomNo}, {userId}, {message}
		String[] messageInfo = fullMessage.split(",");
		if ( messageInfo != null && messageInfo.length == 3) {
			String roomNo = messageInfo[0];
			String senderId = messageInfo[1].trim();
			String chatMessage = messageInfo[2].substring(1);
		
			ChatMessage cm = new ChatMessage();
			cm.setRoomNo(Integer.parseInt(roomNo));
			cm.setSenderId(senderId);
			cm.setChatMessage(chatMessage);
			chatService.insertMessage(cm);
			
			HashMap<String, Object> recieveSession  = new HashMap<String, Object>();
			if(roomSessions.size() > 0) {
				for (int i=0; i<roomSessions.size(); i++) {
					String rN = (String) roomSessions.get(i).get("roomNo");
					String uId = (String) roomSessions.get(i).get("userId");
					if(rN.equals(roomNo) && !(uId.equals(getId(session)))) {
						recieveSession = roomSessions.get(i);
						break;
					}
				}
				
				if(chatMessage.length() > 0) {
					WebSocketSession wss = (WebSocketSession) recieveSession.get("socketSession");
					if (wss != null) {
						try {
							wss.sendMessage(new TextMessage(chatMessage));
						} catch (IOException e) {
							e.printStackTrace();
						}
					} 
				}
			}
		}
	}
	
	

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member) httpSession.get("loginUser");
		
		return loginUser.getUserId();
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
		log.info("사용자 접속 종료 : {}", getId(session));
	}
	
	
}
