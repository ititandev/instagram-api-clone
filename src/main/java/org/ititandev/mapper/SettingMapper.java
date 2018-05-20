package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.Setting;
import org.springframework.jdbc.core.RowMapper;

public class SettingMapper implements RowMapper<Setting>{
	public Setting mapRow(ResultSet rs, int rowNum) throws SQLException {
		Setting setting = new Setting();
		setting.setLanguage(rs.getString("language"));
		setting.setPrivate_acc(rs.getBoolean("private_acc"));
		return setting;
	}
}