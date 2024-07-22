package com.kh.redclip.chatting.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.chatting.model.vo.ChatMessage;
import com.kh.redclip.chatting.model.vo.ChatMessageVO;
import com.kh.redclip.chatting.model.vo.ChatRoom;
import com.kh.redclip.chatting.model.vo.ChatRoomVO;

@Mapper
public interface ChatMapper {

	

	// 채팅 목록
	List<ChatRoomVO> findAll(String userId);
	
	
	// 채팅방 존재 유무
	ChatRoom findChatRoom(ChatRoom cr);

	// 채팅방 생성 -> 생성된 시퀀스 번호 반환
	int newChatRoom(ChatRoom cr);

	// 글 작성자, 답글 작성자, 글번호를 이용하여 글번호 갱신
	int chatBarterUpdate(ChatRoom cr);
		
	// 채팅 전송
	int insertMessage(ChatMessage chatMessage);
	
	ChatMessageVO chatListByRoomNo(int roomNo);
}
