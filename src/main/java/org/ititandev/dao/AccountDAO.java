package org.ititandev.dao;

import java.util.List;
import javax.sql.DataSource;

import org.ititandev.mapper.AccountMapper;
import org.ititandev.model.Account;
import org.springframework.jdbc.core.JdbcTemplate;

public class AccountDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Account> getAll() {
		String query = "select username, password, active from account";
		List<Account> empList = jdbcTemplate.query(query, new AccountMapper());
		return empList;
	}

	// SimpleJdbcCall jdbcCall = new
	// SimpleJdbcCall(dataSource).withProcedureName("getRecord");
	//
	// SqlParameterSource in = new MapSqlParameterSource().addValue("in_id", id);
	// Map<String, Object> out = jdbcCall.execute(in);
}
