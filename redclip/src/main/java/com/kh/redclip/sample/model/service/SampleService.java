package com.kh.redclip.sample.model.service;

import java.util.List;


import com.kh.redclip.sample.model.vo.Sample;

public interface SampleService {
	
	List<Sample> findAll();
	
	
	Sample findById(int sampleNo);
}
