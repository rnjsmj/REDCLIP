package com.kh.redclip.region.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Town {
	private int townCode;
	private String townName;
	private int cityCode;
}
