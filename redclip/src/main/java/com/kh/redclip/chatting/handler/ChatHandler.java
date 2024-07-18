package com.kh.redclip.chatting.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	private List<HashMap<String, Object>> roomSessions = new ArrayList<HashMap<String, Object>>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("연결 : {}", getId(session));
		sessions.add(session);
		
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		String roomNo = url.split("/chatting/")[1];
		
		int idx = roomSessions.size();
		if(idx > 0) {
			for(int i=0; i<idx; i++) {
				String rN = (String) roomSessions.get(i).get("roomNo");
				if(rN.equals(roomNo)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) {
			HashMap<String, Object> map = roomSessions.get(idx);
			map.put("roomNo", roomNo);
			map.put(session.getId(), session);
		} else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("roomNo", roomNo);
			map.put(session.getId(), session);
			roomSessions.add(map);
		}
		
		
//		연결 -> 채팅방 존재 여부 확인해서 세션에 
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("메시지 내용 : {}", message.getPayload());
		String fullMessage = message.getPayload();
		
		
		String[] messageInfo = fullMessage.split(",");
		if ( messageInfo != null && messageInfo.length == 3) {
			String roomNo = messageInfo[0];
			String senderId = messageInfo[1];
			String chatMessage = messageInfo[2];
			
			/*
			 * ChatMessage chatMessageData = new ChatMessage();
			 * chatMessageData.setRoomNo(roomNo); chatMessageData.setSenderId(senderId);
			 * chatMessageData.setChatMessage(chatMessage);
			 * 
			 * chatService.insertMessage(chatMessageData);
			 */
			
//			WebSocketSession rSession = roomSessions.get(roomNo);
//			if ( rSession != null && rSession) {
//					rSession.sendMessage(new TextMessage(chatMessage));
//				}
//				
//			}
			
			HashMap<String, Object> temp  = new HashMap<String, Object>();
			if(roomSessions.size() > 0) {
				for (int i=0; i<roomSessions.size(); i++) {
					String recentRoom = (String) roomSessions.get(i).get("roomNo");
					if(recentRoom.equals(roomNo)) {
						temp = roomSessions.get(i);
						break;
					}
				}
				
				if(chatMessage.length() > 0) {
					for (String k : temp.keySet()) {
						if(k.equals("roomNo")) {
							continue;
						}
						
						WebSocketSession wss = (WebSocketSession) temp.get(k);
						if(wss != null) {
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
