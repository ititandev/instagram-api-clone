package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.Setting;
import org.ititandev.model.UserPage;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;

public class UserPageMapper implements RowMapper<UserPage>{

	public UserPage mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserPage userPage = new UserPage();
		userPage.setUsername(rs.getString("username"));
		userPage.setName(rs.getString("name"));
		userPage.setAvatar_filename(rs.getString("avatar_filename"));
		userPage.setPhoto_num(rs.getInt("photo_num"));
		userPage.setFollowing_num(rs.getInt("following_num"));
		userPage.setFollower_num(rs.getInt("follower_num"));
		return userPage;
	}

}
