package org.ititandev.dao;

import javax.sql.DataSource;

import org.ititandev.mapper.ProfileMapper;
import org.ititandev.mapper.SettingMapper;
import org.ititandev.model.Profile;
import org.ititandev.model.Setting;
import org.springframework.jdbc.core.JdbcTemplate;

public class ProfileDAO {
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public Setting getSetting(String username) {
		String sql = "SELECT language, private_acc FROM setting WHERE username = ?";
		return jdbcTemplate.query(sql, new Object[] { username }, new SettingMapper()).get(0);
	}

	public int updateSetting(String username, String language, boolean private_acc) {
		String sql = "UPDATE setting SET (language, private_acc) VALUES (?, ?) WHERE username = ?";
		return jdbcTemplate.update(sql, language, private_acc, username);
	}
	
	public Profile getProfile(String username) {
		String sql = "SELECT biography, phone_number, sex, website FROM profile WHERE username = ?";
		return jdbcTemplate.query(sql, new Object[] {username}, new ProfileMapper()).get(0);
	}
	
	public int updateProfile(String username, String biography, String phone_number, String sex, String website) {
		String sql = "UPDATE profile SET (biography, phone_number, sex, website) VALUES (?, ?, ?, ?) WHERE username = ?";
		return jdbcTemplate.update(sql, biography, phone_number, sex, website, username);
	}
}
