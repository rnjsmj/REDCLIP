package com.kh.redclip.chatting.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.chatting.model.dao.ChatMapper;
import com.kh.redclip.chatting.model.vo.ChatMessage;
import com.kh.redclip.chatting.model.vo.ChatMessageVO;
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
	public ChatRoom findChatRoom(ChatRoom cr) {
		return chatMapper.findChatRoom(cr);
	}

	@Override
	public int newChatRoom(ChatRoom cr) {
		chatMapper.newChatRoom(cr);
		return cr.getRoomNo();
	}

	@Override
	public int chatBarterUpdate(ChatRoom cr) {
		return chatMapper.chatBarterUpdate(cr);
	}

	@Override
	public ChatMessageVO chatListByRoomNo(int roomNo) {
		return chatMapper.chatListByRoomNo(roomNo);
	}

}
