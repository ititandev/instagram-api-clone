package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.ProfilePage;
import org.springframework.jdbc.core.RowMapper;

public class UserPageMapper implements RowMapper<ProfilePage>{

	public ProfilePage mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProfilePage userPage = new ProfilePage();
		userPage.setUsername(rs.getString("username"));
		userPage.setName(rs.getString("name"));
		userPage.setAvatar_filename(rs.getString("avatar_filename"));
		userPage.setPhoto_num(rs.getInt("photo_num"));
		userPage.setFollowing_num(rs.getInt("following_num"));
		userPage.setFollower_num(rs.getInt("follower_num"));
		userPage.setFollowing(rs.getBoolean("following"));
		userPage.setBiography(rs.getString("biography"));
		userPage.setWebsite(rs.getString("website"));
		return userPage;
	}

}
