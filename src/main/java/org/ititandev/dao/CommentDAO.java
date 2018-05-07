package org.ititandev.dao;

import javax.sql.DataSource;

import org.ititandev.mapper.CommentMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class CommentDAO {
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void getComment(String photo_id) {
		String sql = "SELECT comment_id, content, datetime, username FROM comment WHERE photo_id = ?";
		jdbcTemplate.query(sql, new Object[] {photo_id}, new CommentMapper());
	}
}
