package org.ititandev.dao;

import java.util.List;

import javax.sql.DataSource;

import org.ititandev.mapper.CommentMapper;
import org.ititandev.model.Comment;
import org.springframework.jdbc.core.JdbcTemplate;

public class CommentDAO {
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Comment> getComment(int photo_id, int start, int limit) {
		String sql = "SELECT * FROM "
				+ "(SELECT comment_id, content, datetime, username FROM comment WHERE photo_id = ? "
				+ "ORDER BY datetime DESC LIMIT ?, ?) AS temp ORDER BY temp.datetime";
		return jdbcTemplate.query(sql, new Object[] {photo_id, start, limit}, new CommentMapper());
	}
}
