package org.ititandev.dao;

import java.util.List;

import javax.sql.DataSource;

import org.ititandev.mapper.ReplyMapper;
import org.ititandev.model.Reply;
import org.springframework.jdbc.core.JdbcTemplate;

public class ReplyDAO {
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Reply> getReply(int comment_id, int start, int limit) {
		String sql = "SELECT * FROM "
				+ "(SELECT reply_id, datetime, content, username, get_avatar(username) AS filename_avatar "
				+ "FROM reply WHERE comment_id = ? "
				+ "ORDER BY datetime DESC LIMIT ?, ?) AS temp "
				+ "ORDER BY temp.datetime";
		return jdbcTemplate.query(sql, new Object[] {comment_id, start, limit}, new ReplyMapper());
	}
}
