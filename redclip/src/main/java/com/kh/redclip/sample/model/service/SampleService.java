package com.kh.redclip.sample.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.sample.model.vo.Sample;

@Service
public interface SampleService {
	
	List<Sample> findAll();
	
	
	Sample findById(int sampleNo);
}
