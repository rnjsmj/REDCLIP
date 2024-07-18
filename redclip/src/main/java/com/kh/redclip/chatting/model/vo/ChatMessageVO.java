package com.kh.redclip.chatting.model.vo;



import com.kh.redclip.member.model.vo.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChatMessageVO {
	private int chatNo;
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
	private ChatMessage chatMessageList;
	//추후에 지역정보를 포함한 MemberVO 생성되면 barter, reply로 분리하여
	//Member 객체 -> association으로 받을 예정
}
