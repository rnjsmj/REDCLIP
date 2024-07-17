package com.kh.redclip.chatting.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChatRoom {
	private int roomNo;
	private int barterNo;
	private String barterWriter;
	private String replyWriter;
}
