package com.kh.redclip.region.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Region {
	private int cityCode;
	private String cityName;
	private int townCode;
	private String townName;
	private int villageCode;
	private String villageName;
}
