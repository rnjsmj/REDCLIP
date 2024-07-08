package com.kh.redclip.barter.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class BarterReply {
	private int replyNo;
	private int barterNo;
	private String replyContent;
	private String replyWriter;
	private String replyDate;
	private String replyNickname;
}
