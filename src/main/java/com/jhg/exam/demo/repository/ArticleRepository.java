package com.jhg.exam.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jhg.exam.demo.vo.Article;

@Mapper
public interface ArticleRepository {
	public void writeArticle(@Param("memberId") int memberId, @Param("boardId")  int boardId, @Param("title") String title, @Param("body") String body);
	
	@Select("""
			<script>
				SELECT A.*,
				M.nickname AS extra_writerName
				FROM article AS A
				LEFT JOIN `member` AS M
				ON A.memberId = M.id
				<if test="boardId != 0">
					WHERE A.boardId = #{boardId}
				</if>
				ORDER BY A.id DESC
				<if test="limitTake != -1">
					LIMIT #{limitStart}, #{limitTake}
				</if>
			</script>
			""")
	public List<Article> getForPrintArticles(@Param("boardId") int boardId, int limitStart, int limitTake);

	
	@Select("""
			SELECT A.*,
			M.nickname AS extra_writerName
			FROM article AS A
			LEFT JOIN `member` AS M
			ON A.memberId = M.id
			WHERE A.id = #{id}
			""")
	public Article getForPrintArticle(@Param("id") int id);
	
	public void deleteArticle(@Param("id") int id);

	public void modifyArticle(@Param("id")int id, @Param("title") String title, @Param("body") String body);

	public int getLastInsertId();

	@Select("""
			<script>
				SELECT COUNT(*) AS cnt
				FROM article AS A
				<if test="board != 0">
					WHERE A.boardId = #{boardId}
				</if>
			</script>
			""")
	public int getArticlesCount(int boardId);
}