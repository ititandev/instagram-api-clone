package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.Comment;
import org.springframework.jdbc.core.RowMapper;

public class CommentMapper implements RowMapper<Comment>{
	public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Comment comment = new Comment();
		comment.setComment_id(rs.getInt("comment_id"));
		comment.setContent(rs.getString("content"));
		comment.setDatetime(rs.getString("datetime"));
		comment.setUsername(rs.getString("username"));
		return comment;
	}
}