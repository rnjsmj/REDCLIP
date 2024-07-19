package com.kh.redclip.chatting.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.redclip.chatting.model.service.ChatService;
import com.kh.redclip.chatting.model.vo.ChatRoom;
import com.kh.redclip.chatting.model.vo.ChatRoomVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chatting")
@RequiredArgsConstructor
@Slf4j
public class ChattingController {
	
	private final ChatService chatService;
	
	//화면 테스트용 컨트롤러
	@GetMapping("/view")
	public String view() {
		return "chatting/view";
	}
	
	//채팅방 목록 조회
	@GetMapping("/list") 
	@ResponseBody
	public ResponseEntity<List<ChatRoomVO>> chattingList(Model model, String userId) {
		
		List<ChatRoomVO> chatRoomList = chatService.findAll(userId);
		model.addAttribute(chatRoomList);
		log.info("목록: {}", chatRoomList);
		return ResponseEntity.status(HttpStatus.OK).body(chatRoomList);
	}
	
	//채팅방 찾기 (존재 유무에 따라 생성 / 게시글 제목 갱신)
	@GetMapping("/find")
	@ResponseBody
	public int findChatRoom(ChatRoom cr, HttpSession session) {
		ChatRoom chatRoom = chatService.findChatRoom(cr);
		log.info("find 결과 : {}", chatRoom);
		int roomNo = 0;
		if(chatRoom == null) {
			// 채팅방이 존재하지 않음
			// 방이 생성된 경우 생성된 방의 값을 return
			roomNo = chatService.newChatRoom(cr);
			
		} else {
			// 채팅방 존재
			// 해당 채팅방의 ChatRoom(cr) 객체로 넘겨받은 게시글번호를 수정
			cr.setRoomNo(chatRoom.getRoomNo());
			roomNo = (chatService.chatBarterUpdate(cr) > 0) ? chatRoom.getRoomNo() : 0;
		}
		
		session.setAttribute("RoomNo", roomNo);
		log.info("세션에 저장된 값 : {}", session.getAttribute("RoomNo") );
		log.info("roomNo : {}", roomNo);
		return roomNo;
		
	}
	
}
