package org.ititandev.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

import org.ititandev.mapper.PhotoMapper;
import org.ititandev.mapper.UserPageMapper;
import org.ititandev.model.Photo;
import org.ititandev.model.UserPage;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

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
				+ "get_avatar(username) AS avatar_filename, get_like_num(photo_id) AS like_num, "
				+ "get_comment_num(photo_id) AS comment_num FROM photo "
				+ "LEFT JOIN location ON photo.location_id = location.location_id "
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

	public List<String> getLikeUsername(int photo_id) {
		String sql = "SELECT username FROM `like` WHERE photo_id = ?";
		return jdbcTemplate.queryForList(sql, new Object[] { photo_id }, String.class);
	}

	public String getUsernameWithPhoto_id(int photo_id) {
		String sql = "SELECT username FROM photo WHERE photo_id = ?";
		return jdbcTemplate.queryForList(sql, photo_id).get(0).get("username").toString();
	}

	public String getUsernameWithComment_id(int comment_id) {
		String sql = "SELECT photo.username FROM photo " + "JOIN comment ON photo.photo_id = comment.photo_id "
				+ "WHERE comment.comment_id = ?";
		return jdbcTemplate.queryForList(sql, comment_id).get(0).get("username").toString();
	}

	public String getUsernameWithPhotoFilename(String filename) {
		String sql = "SELECT username FROM photo WHERE filename = ?";
		return jdbcTemplate.queryForList(sql, filename).get(0).get("username").toString();
	}

	public String getUsernameWithAvatarFilename(String filename) {
		String sql = "SELECT username FROM avatar WHERE filename = ?";
		return jdbcTemplate.queryForList(sql, filename).get(0).get("username").toString();
	}

	public String getUsernameWithStoryFilename(String filename) {
		String sql = "SELECT username FROM story WHERE filename = ?";
		return jdbcTemplate.queryForList(sql, filename).get(0).get("username").toString();
	}

	public UserPage getProfile(String username) {
		String sql = "SELECT name, ? AS username, get_avatar(?) AS avatar_filename, get_photo_num(?) AS photo_num,"
				+ "get_following_num(?) AS following_num, get_follower_num(?) AS follower_num FROM account WHERE username = ?";
		List<UserPage> result = jdbcTemplate.query(sql, new Object[] { username, username, username, username, username, username },
				new UserPageMapper());
		if (result.size() == 1)
			return result.get(0);
		else
			return null;
	}

	public List<Photo> getPhoto(String username, int start, int limit) {
		String sql = "SELECT photo_id, caption, filename, datetime_upload, datetime_update, location, username, "
				+ "get_avatar(username) AS avatar_filename, get_like_num(photo_id) AS like_num FROM photo "
				+ "LEFT JOIN location ON photo.location_id = location.location_id "
				+ "WHERE username = ? ORDER BY datetime_upload DESC LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] { username, start, limit }, new PhotoMapper());
	}

	public int insertPhoto(Photo photo) {
		String sql = "INSERT INTO photo (caption, filename, location_id, username) "
				+ "VALUES (?, ?, get_location_id(?),MAX(photo_id) + 1)";
		KeyHolder keyHolder = new GeneratedKeyHolder();

		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql, new String[] { "photo_id" });
				ps.setString(1, photo.getCaption());
				ps.setString(2, photo.getFilename());
				ps.setString(3, photo.getLocation());
				ps.setString(4, photo.getUsername());
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}

}
