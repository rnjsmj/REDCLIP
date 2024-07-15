package com.kh.redclip.chatting.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.chatting.model.dao.ChatMapper;
import com.kh.redclip.chatting.model.vo.ChatMessage;
import com.kh.redclip.chatting.model.vo.ChatRoom;
import com.kh.redclip.chatting.model.vo.ChatRoomVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
	
	private final ChatMapper chatMapper;

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		
		return chatMapper.insertMessage(chatMessage);
	}

	@Override
	public List<ChatRoomVO> findAll(String userId) {
		return chatMapper.findAll(userId);
	}

	@Override
	public int openChatRoom(ChatRoom chatRoom) {
		chatMapper.openChatRoom(chatRoom);
		
		return chatRoom.getRoomNo(); 
	}

}
