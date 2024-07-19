package com.kh.redclip.chatting.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChatMessage {
	private int chatNo;
	private int roomNo;
	private String senderId;
	private String chatMessage;
	private String chatDate;
	private char chatRead;
}
