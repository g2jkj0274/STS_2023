package com.jhg.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
	private int count;

	public UsrHomeController() {
		count = 0;
	}

	// 접속이 들어오면 아래 함수를 실행
	@RequestMapping("/usr/home/getCount")
	// 밑에 함수가 리턴한 값을 보내준다, 나중에 jsp에 연결해줄꺼면 쓰면 안된다.
	@ResponseBody
	public int getCount() {
		return count++;
	}

	@RequestMapping("/usr/home/doSetCount")
	@ResponseBody
	public String doSetCount(int count) {
		this.count = count;
		return "count의 값이 " + this.count + "으로 초기화 되었습니다.";
	}
}
