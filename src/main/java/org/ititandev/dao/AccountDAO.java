package org.ititandev.dao;

import java.util.List;
import java.util.Random;

import javax.sql.DataSource;

import org.ititandev.mapper.AccountMapper;
import org.ititandev.model.Account;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

public class AccountDAO {
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Account> getAll() {
		String query = "SELECT * from account";
		List<Account> empList = jdbcTemplate.query(query, new AccountMapper());
		return empList;
	}

	public int insert(String username, String password, String email, String name) {
		String sql = "INSERT INTO account VALUES (?, ?, ?, 0, 0, NOW(), NOW(), ?, ?)";
		Random rand = new Random();
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();
		String verify_code = encoder.encodePassword(String.valueOf(rand.nextInt(1000000)), "hash");
		return jdbcTemplate.update(sql, username, password, email, name, verify_code);
	}

	public Account getAccount(String username) {
		String sql = "SELECT * FROM account WHERE username = ?";
		return jdbcTemplate.query(sql, new Object[] { username }, new AccountMapper()).get(0);
	}
	
	public int updateInfo(String username, Account account) {
		String sql = "UPDATE account SET username = ?, email = ?, datetime_update = NOW(), name = ? " + 
						"WHERE username = ?";
		return jdbcTemplate.update(sql, account.getUsername(), account.getEmail(), account.getName(), username);
	}
	public int updatePassword(String username, String password)
	{
		String sql = "UPDATE account SET password = ? WHERE username = ?";
		return jdbcTemplate.update(sql, password, username);
	}
	// SimpleJdbcCall jdbcCall = new
	// SimpleJdbcCall(dataSource).withProcedureName("getRecord");
	//
	// SqlParameterSource in = new MapSqlParameterSource().addValue("in_id", id);
	// Map<String, Object> out = jdbcCall.execute(in);
}
