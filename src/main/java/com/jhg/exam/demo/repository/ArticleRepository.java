package com.jhg.exam.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jhg.exam.demo.vo.Article;

@Mapper
public interface ArticleRepository {
	// 현재 xml파일로 SQL 옮김
	// INSERT INTO aritcle SET regDate = NOW(), updateDate = NOW(), title = ?, `body`= ?;
	public void writeArticle(@Param("memberId") int memberId, @Param("title") String title, @Param("body") String body);
	
	@Select("""
			SELECT A.*,
			M.nickname AS extra_writerName
			FROM article AS A
			LEFT JOIN `member` AS M
			ON A.memberId = M.id
			ORDER BY
			A.id DESC
			""")
	public List<Article> getForPrintArticles();

	@Select("""
			SELECT A.*,
			M.nickname AS extra_writerName
			FROM article AS A
			LEFT JOIN `member` AS M
			ON A.memberId = M.id
			WHERE A.id = #{id}
			""")
	public Article getForPrintArticle(@Param("id") int id);

	// DELETE * FROM article WHERE id = ?
	public void deleteArticle(@Param("id") int id);

	// UPDATE article SET title = ?, `body` = ?, updateDate = NOW() WHERE id = ?;
	public void modifyArticle(@Param("id") int id, @Param("title") String title, @Param("body") String body);

	public int getLastInsertId();
}