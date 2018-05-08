package org.ititandev.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.ititandev.mapper.PhotoMapper;
import org.ititandev.model.Photo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

public class PhotoDAO {
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Photo> getNewfeed(String username, int start, int limit) {
		String sql = "SELECT photo_id, caption, filename, datetime_upload, datetime_update, location, username, "
				+ "get_avatar(username) AS filename_avatar, get_like_num(photo_id) AS like_num FROM photo "
				+ "INNER JOIN location ON photo.location_id = location.location_id "
				+ "WHERE username IN (SELECT username2 FROM follow WHERE username1 = ?) "
				+ "ORDER BY datetime_upload DESC LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] { username, start, limit }, new PhotoMapper());
	}

	public String getFilenamePhoto(int photo_id) {
		String sql = "SELECT filename FROM photo WHERE photo_id = ?";
		return jdbcTemplate.queryForList(sql, photo_id).get(0).get("filename").toString();
	}

	public String getFilenameAvatar(int avatar_id) {
		String sql = "SELECT filename FROM avatar WHERE avatar_id = ? ORDER BY datetime DESC LIMIT 0, 1";
		return jdbcTemplate.queryForList(sql, avatar_id).get(0).get("filename").toString();
	}

	public String getFilenameStory(int story_id) {
		String sql = "SELECT filename FROM story WHERE story_id = ?";
		return jdbcTemplate.queryForList(sql, story_id).get(0).get("filename").toString();
	}

	public Map<String, Object> test(String username1, String username2) {
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("check_follow");

		SqlParameterSource in = new MapSqlParameterSource().addValue("username1", username1).addValue("username2",
				username2);
		Map<String, Object> out = jdbcCall.execute(in);

		return out;
	}

	public List<String> getLikeUsername(int photo_id) {
		String sql = "SELECT username FROM `like` WHERE photo_id = ?";
		return jdbcTemplate.queryForList(sql, new Object[] { photo_id }, String.class);
	}

	public boolean checkUserToPhoto_id(String username, int photo_id) {
		String sql = "SELECT username FROM photo WHERE photo_id = ?";
		String userHasPhoto = jdbcTemplate.queryForList(sql, photo_id).get(0).get("username").toString();
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("check_user_to_photo");
		SqlParameterSource in = new MapSqlParameterSource().addValue("username1", username).addValue("username2",
				userHasPhoto);
		Map<String, Object> out = jdbcCall.execute(in);
		return Boolean.valueOf(out.get("output").toString());
	}
}
