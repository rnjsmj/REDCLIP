package com.kh.redclip.chatting.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.chatting.model.vo.ChatMessage;
import com.kh.redclip.chatting.model.vo.ChatRoom;
import com.kh.redclip.chatting.model.vo.ChatRoomVO;

@Mapper
public interface ChatMapper {

	// 채팅 전송
	int insertMessage(ChatMessage chatMessage);

	// 채팅 목록
	List<ChatRoomVO> findAll(String userId);
	
	// 채팅방 생성
	int openChatRoom(ChatRoom chatRoom);
}
