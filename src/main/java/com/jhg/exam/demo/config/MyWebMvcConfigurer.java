package com.jhg.exam.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jhg.exam.demo.interceptor.BeforeActionInterceptor;
import com.jhg.exam.demo.interceptor.NeedLoginInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {
	// BeforeActionInterceptor 불러오기
	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;

	// NeedLoginInterceptor 불러오기
	@Autowired
	NeedLoginInterceptor needLoginInterceptor;

	// 이 함수는 인터셉터를 적용하는 역할을 합니다.
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(beforeActionInterceptor).addPathPatterns("/**").excludePathPatterns("/error")
				.excludePathPatterns("/resource/**");
		
		registry.addInterceptor(needLoginInterceptor)
				.addPathPatterns("/usr/article/doAdd")
				//이건 왜 있음?
				.addPathPatterns("/usr/article/doWrite")
				.addPathPatterns("/usr/article/modify")
				.addPathPatterns("/usr/article/doModify")
				.addPathPatterns("/usr/article/doDelete");
	}
}
