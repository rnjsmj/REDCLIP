package com.kh.redclip.barter.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Wishlist {
	private int wishNo;
	private int barterNo;
	private String wishUser;
	private String wishDate;
}
