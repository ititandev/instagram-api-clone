package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.Account;
import org.springframework.jdbc.core.RowMapper;

public class AccountMapper implements RowMapper<Account>{
	public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
		Account account = new Account();
		account.setUsername(rs.getString("username"));
		account.setPassword(rs.getString("password"));
		account.setActive(rs.getBoolean("active"));
		return account;
	}
}
