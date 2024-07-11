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
	private int barterNo;				//번호
	private String barterName;			//제목
	private String barterContent;		//내용
	private String barterNickname;		//유저 닉네임 (member join)
	private String barterWriter;		//유저 아이디
	private Region region;				//시, 구, 동 정보 (region join)
	private String categoryNo;			//카테고리 항목 번호 (category join)
	private String categoryName;		//카테고리 이름 (category join)
	private int hit;					//조회수
	private String barterDate;			//등록일시
	private int wishCount;				//좋아요 수 (wishlist join (count))
	private String barterStatus;		//거래상태
	private int point;					//유저 포인트 (member join)
	//private List<BarterReply> barterReplyList;
	private List<BarterFile> barterFileList;	//첨부 이미지 목록 (barterFile join)
	
}
