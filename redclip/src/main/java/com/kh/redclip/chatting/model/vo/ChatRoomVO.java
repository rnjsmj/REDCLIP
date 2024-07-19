package com.kh.redclip.chatting.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChatRoomVO {
	private int roomNo;
	private int barterNo;
	private String barterName;
	private String barterProfil;
	private String replyProfil;
	private String barterWriter;
	private String barterNickname;
	private String replyWriter;
	private String replyNickname;
	private String barterVillageName;
	private String replyVillageName;
	private String chatDate;
	private String chatMessage;
	private String senderId;
	private char chatRead;
}
