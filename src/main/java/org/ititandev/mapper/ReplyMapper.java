package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.Reply;
import org.springframework.jdbc.core.RowMapper;

public class ReplyMapper implements RowMapper<Reply>{
	public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
		Reply reply = new Reply();
		reply.setReply_id(rs.getString("reply_id"));
		reply.setContent(rs.getString("content"));
		reply.setDatetime(rs.getString("datetime"));
		reply.setUsername(rs.getString("username"));
		return reply;
	}
}
