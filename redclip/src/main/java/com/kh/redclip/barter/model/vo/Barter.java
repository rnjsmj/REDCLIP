package com.kh.redclip.barter.model.vo;

import java.util.List;

import com.kh.redclip.region.model.vo.Region;

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
	private String categoryNo;
	private int hit;
	private String barterDate;
	private String barterStatus;
	
}
