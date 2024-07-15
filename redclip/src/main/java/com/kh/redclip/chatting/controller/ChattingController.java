package com.kh.redclip.chatting.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.redclip.chatting.model.service.ChatService;
import com.kh.redclip.chatting.model.vo.ChatRoom;
import com.kh.redclip.chatting.model.vo.ChatRoomVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chatting")
@RequiredArgsConstructor
@SessionAttributes({"loginUser", "roomNo"})
public class ChattingController {
	
	private final ChatService chatService;
	
	//화면 테스트용 컨트롤러
	@GetMapping("/view")
	public String view() {
		return "chatting/view";
	}
	
	//채팅방 목록 조회
	@GetMapping("/list") 
	public String chattingList(Model model, String userId) {
		
		List<ChatRoomVO> chatRoomList = chatService.findAll(userId);
		model.addAttribute(chatRoomList);
		return "chatting/view";
	}
	
	//채팅방 만들기
	@PostMapping("/openChatRoom")
	public String openChatRoom(ChatRoom chatRoom) {
		int roomNo = chatService.openChatRoom(chatRoom);
		if(roomNo > 0) {
			return "redirect:/redclip/chatting/" + roomNo;
		} else {
			return "redirect:/redclip/barters/" + chatRoom.getBarterNo();
		}
	}
	
}
