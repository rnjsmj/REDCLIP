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
import com.kh.redclip.chatting.model.vo.ChatMessage;
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
		
		//log.info("연결 : {}", getId(session));
		//log.info("세션번호 : {}", session.getId());
		sessions.add(session);
		
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		String roomNo = url.split("/chatting/")[1];
		//log.info("핸들러 연결 : {}", roomNo);
		
		int idx = roomSessions.size();
		if(idx > 0) {
			for(int i=0; i<idx; i++) {
				
				// List를 순회하면서 방번호와 해당 로그인유저가 일치하는 roomSession 정보가 있는지 확인
				String rN = (String) roomSessions.get(i).get("roomNo");
				String uId = (String) roomSessions.get(i).get("userId");
				if(rN.equals(roomNo) && uId.equals(getId(session))) {
					flag = true;
					idx = i;
					//log.info("플래그 true");
					break;
				}
			}
		}
		
		// 방이 존재하는지 확인 -> 존재하면 db에서 userid를 select 하여 두 명의 userid를 각 맵에 put
		// 나중에 들어와도 같은 회원이면 wss만 덮어쓰기 할 수 있음
		
		
		if(flag) { // List에 존재하는 경우 현재 값으로 갱신
			HashMap<String, Object> map = roomSessions.get(idx);
			map.put("roomNo", roomNo);
			map.put("socketSession", session);
			map.put("userId", getId(session));
		} else {  // List에 존재하지 않는 경우 새로운 세션 정보 추가
			//log.info("플래그 false");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("roomNo", roomNo);
			map.put("socketSession", session);
			map.put("userId", getId(session));
			roomSessions.add(map);
		}
		
		

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("메시지 내용 : {}", message.getPayload());
		String fullMessage = message.getPayload();
		
		
		String[] messageInfo = fullMessage.split(",");
		if ( messageInfo != null && messageInfo.length == 3) {
			String roomNo = messageInfo[0];
			String senderId = messageInfo[1].trim();
			String chatMessage = messageInfo[2].substring(1);
			
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
			
			// 서비스 호출하여 DB에 저장
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
						//log.info("리시브 세션 존재 : {} - {}", recieveSession , wss);
						try {
								wss.sendMessage(new TextMessage(chatMessage));
								
								
								
							} catch (IOException e) {
								//log.info("아...왜저래");
								e.printStackTrace();
							}
					} else {
						//log.info("리시브 세션 없음..");
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
		log.info("사용자 접속 종료 : {}", getId(session));
	}
	
	
}
