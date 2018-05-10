package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.Profile;
import org.springframework.jdbc.core.RowMapper;

public class ProfileMapper implements RowMapper<Profile>{
	public Profile mapRow(ResultSet rs, int rowNum) throws SQLException {
		Profile profile = new Profile();
		profile.setBiography(rs.getString("biography"));
		profile.setPhone_number(rs.getString("phone_number"));
		profile.setSex(rs.getString("sex"));
		profile.setWebsite(rs.getString("website"));
		return profile;
	}
}