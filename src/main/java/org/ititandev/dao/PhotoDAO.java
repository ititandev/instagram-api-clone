package org.ititandev.dao;

import java.util.List;

import javax.sql.DataSource;

import org.ititandev.mapper.PhotoMapper;
import org.ititandev.model.Photo;
import org.springframework.jdbc.core.JdbcTemplate;

public class PhotoDAO {
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Photo> getPhoto(String username, int start, int limit) {
		String sql = "SELECT photo_id, caption, filename, datetime_upload, datetime_update, location, username FROM photo "
				+ "INNER JOIN location ON photo.location_id = location.location_id "
				+ "WHERE username IN (SELECT username2 FROM follow WHERE username1 = ?) "
				+ "ORDER BY datetime_upload DESC LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] {username, start, limit}, new PhotoMapper());
	}
	
}
