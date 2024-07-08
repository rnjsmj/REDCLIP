package com.kh.redclip.barter.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Barter {
	private int barterNo;
	private String barterName;
	private String barterContent;
	private String barterWriter;
	private String villageCode;
	private String category;
	private int hit;
	private String barterDate;
	private String barterStatus;
	
}
