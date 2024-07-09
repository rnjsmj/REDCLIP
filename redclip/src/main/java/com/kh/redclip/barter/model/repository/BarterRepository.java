package com.kh.redclip.barter.model.repository;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.redclip.barter.model.vo.Barter;

public class BarterRepository {

	public static int insert(SqlSessionTemplate sqlSession, Barter barter) {
		return sqlSession.insert("BarterMapper.insert", barter);
	}

}
