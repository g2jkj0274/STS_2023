package com.jhg.exam.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhg.exam.demo.service.ArticleService;
import com.jhg.exam.demo.vo.Article;

@Controller
public class UsrArticleController {
	// Autowried : 알아서 new 해주는 기능
	@Autowired
	// 인스턴스 변수 시작
	private ArticleService articleService;
	// 인스턴스 변수 끝

	// 액션 메서드 시작
	@RequestMapping("/usr/article/doAdd")
	@ResponseBody
	public Article doAdd(String title, String body) {
		int id = articleService.writeArticle(title, body);
	
		Article article = articleService.getArticle(id);

		return article;
	}

	// doAdd한 aritlce 리스트
	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public List<Article> getArticles() {
		return articleService.getArticles();
	}

	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public Object getArticle(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return id + "번 게시물이 존재하지 않습니다.";
		}
		return article;
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return id + "번 게시물이 존재하지 않습니다.";
		}
		articleService.deleteArticle(id);
		return id + "번 삭제되었습니다.";
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return id + "번 게시물이 존재하지 않습니다.";
		}
		articleService.modifyArticle(id, title, body);
		return id + "번 게시물이 수정되었습니다.";
	}
	// 액션 메서드 끝
}
