package com.kh.redclip.chatting.model.service;

import java.util.List;



import com.kh.redclip.chatting.model.vo.ChatMessage;
import com.kh.redclip.chatting.model.vo.ChatRoom;
import com.kh.redclip.chatting.model.vo.ChatRoomVO;

public interface ChatService {

	// 채팅 전송
	int insertMessage(ChatMessage chatMessage);

	// 채팅 목록
	List<ChatRoomVO> findAll(String userId);
	
	// 채팅방 생성
	int openChatRoom(ChatRoom chatRoom);

}
