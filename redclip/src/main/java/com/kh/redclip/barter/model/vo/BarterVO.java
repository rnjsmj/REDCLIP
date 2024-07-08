package com.kh.redclip.barter.model.vo;

import java.util.List;

import com.kh.redclip.region.model.vo.Region;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Getter
@ToString
public class BarterVO {
	private int barterNo;
	private String barterName;
	private String barterContent;
	private String barterNickname;
	private String barterWriter;
	private Region region;
	private String categoryNo;
	private String categoryName;
	private int hit;
	private String barterDate;
	private int wishCount;
	private String barterStatus;
	private int point;
	private List<BarterReply> barterReplyList;
	
}
