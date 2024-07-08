package com.kh.redclip.barter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.redclip.barter.model.service.BarterService;
import com.kh.redclip.barter.model.vo.Barter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BarterController {
	private final BarterService barterService;
	
	@GetMapping("/barters")
    public ResponseEntity<List<Barter>> getAllBarters() {
        List<Barter> barters = barterService.getAllBarters();
        return ResponseEntity.ok(barters);
    }
	
	
}
