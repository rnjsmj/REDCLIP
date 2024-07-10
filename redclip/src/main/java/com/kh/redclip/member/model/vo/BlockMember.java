package com.kh.redclip.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class BlockMember {

	private String blockNo;		//차단 번호
	private String blockedId;	//차단당한 사람
	private String blockId;		//차단한 사람
	private Date blockDate;		//차단 일자
}
