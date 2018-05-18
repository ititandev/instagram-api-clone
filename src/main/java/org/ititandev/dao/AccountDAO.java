package org.ititandev.dao;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.sql.DataSource;

import org.ititandev.config.Config;
import org.ititandev.model.User;
import org.ititandev.mapper.AccountMapper;
import org.ititandev.mapper.UserMapper;
import org.ititandev.model.Account;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
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
		String sql = "UPDATE account SET username = ?, email = ?, datetime_update = NOW(), name = ? "
				+ "WHERE username = ?";
		return jdbcTemplate.update(sql, account.getUsername(), account.getEmail(), account.getName(), username);
	}

	public int updatePassword(String username, String password) {
		String sql = "UPDATE account SET password = ? WHERE username = ?";
		return jdbcTemplate.update(sql, password, username);
	}

	public boolean checkPrivilege(String username1, String username2) {
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("check_user_to_photo");
		SqlParameterSource in = new MapSqlParameterSource().addValue("username1", username1).addValue("username2",
				username2);
		Map<String, Object> out = jdbcCall.execute(in);
		return Boolean.valueOf(out.get("output").toString());
	}

	public boolean checkBlock(String username1, String username2) {
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("check_block");
		SqlParameterSource in = new MapSqlParameterSource().addValue("username1", username1).addValue("username2",
				username2);
		Map<String, Object> out = jdbcCall.execute(in);
		return Boolean.valueOf(out.get("output").toString());
	}

	public String checkVerify(String username) {
		String sql = "SELECT active FROM account WHERE username = ?";
		return jdbcTemplate.queryForList(sql, username).get(0).get("active").toString();
	}

	public boolean checkLock(String username) {
		String sql = "SELECT `lock` FROM account WHERE username = ?";
		return Boolean.valueOf(jdbcTemplate.queryForList(sql, username).get(0).get("lock").toString());
	}

	public String verify(String username, String hash) {
		String sql = "SELECT COUNT(*) AS count FROM account WHERE username = ? AND verify_code = ?";
		int count = Integer.valueOf(jdbcTemplate.queryForList(sql, username, hash).get(0).get("count").toString());
		if (count == 1) {
			String sql2 = "UPDATE account SET active = 1 WHERE username = ?";
			int row = jdbcTemplate.update(sql2, username);
			if (row == 1)
				return "Verify successfully";
		}
		return "Verify unsuccessfully";
	}

	public String getVerifyLink(String username) {
		String sql = "SELECT verify_code FROM account WHERE username = ?";
		Map<String, Object> result = jdbcTemplate.queryForList(sql, username).get(0);
		return Config.getConfig("hostname") + "/verify/" + username + "/" + result.get("verify_code");
	}

	public String getEmail(String username) {
		String sql = "SELECT email FROM account WHERE username = ?";
		return jdbcTemplate.queryForList(sql, username).get(0).get("email").toString();
	}

	public List<User> searchUser(String keyword, String currentUser) {
		String sql = "SELECT account.username, email, name, "
				+ "get_avatar(account.username) AS avatar_filename, phone_number "
				+ "FROM account LEFT JOIN profile ON account.username = profile.username "
				+ "WHERE (NOT check_block(account.username, ?)) AND (account.username LIKE '%" + keyword + "%' OR "
				+ "email LIKE '%" + keyword + "%' OR " + "phone_number LIKE '%" + keyword + "%' OR name LIKE '%"
				+ keyword + "%') LIMIT 0, 20";
		return jdbcTemplate.query(sql, new Object[] { currentUser }, new UserMapper());
	}

}
