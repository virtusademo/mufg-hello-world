package com.mufg.mufghelloworld.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class MUFGHelloWorldController {
	
	
	@GetMapping("/helloworld")
	public String helloWorld(){
		return "Welcome to MUFG Demo. Testing internal docker registry";
	}

}
