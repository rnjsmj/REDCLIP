package com.kh.redclip.sample.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.sample.model.vo.Sample;

@Mapper
public interface SampleMapper {
	
	List<Sample> findAll();
	
	Sample findById(int sampleNo);
	
	
	asdasdasdasda
}
