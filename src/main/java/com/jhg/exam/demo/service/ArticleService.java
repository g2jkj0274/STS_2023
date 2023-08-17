package com.jhg.exam.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jhg.exam.demo.repository.ArticleRepository;
import com.jhg.exam.demo.util.Ut;
import com.jhg.exam.demo.vo.Article;
import com.jhg.exam.demo.vo.ResultData;

@Service
public class ArticleService {
	ArticleRepository articleRepository;

	// Autowried써도 되고 아래 생성자처럼 해도 된다.
	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	public ResultData<Integer> writeArticle(int memberId, String title, String body) {
		articleRepository.writeArticle(memberId, title, body);
		int id = articleRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 게시물이 생성되었습니다.", id), id);
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

	public Article getArticle(int id) {
		return articleRepository.getArticle(id);
	}

	public void deleteArticle(int id) {
		articleRepository.deleteArticle(id);
	}

	public void modifyArticle(int id, String title, String body) {
		articleRepository.modifyArticle(id, title, body);
	}
}
