package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.User;
import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<User>{
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User account = new User();
		account.setUsername(rs.getString("username"));
		account.setName(rs.getString("name"));
		account.setEmail(rs.getString("email"));
		account.setPhone_number(rs.getString("phone_number"));
		account.setAvatar_filename(rs.getString("avatar_filename"));
		return account;
	}
}