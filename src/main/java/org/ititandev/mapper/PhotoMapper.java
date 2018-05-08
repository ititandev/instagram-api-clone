package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.Photo;
import org.springframework.jdbc.core.RowMapper;

public class PhotoMapper implements RowMapper<Photo>{
	public Photo mapRow(ResultSet rs, int rowNum) throws SQLException {
		Photo photo = new Photo();
		photo.setPhoto_id(rs.getInt("photo_id"));
		photo.setCaption(rs.getString("caption"));
		photo.setFilename(rs.getString("filename"));
		photo.setDatetime_upload(rs.getString("datetime_upload"));
		photo.setDatetime_update(rs.getString("datetime_update"));
		photo.setLocation(rs.getString("location"));
		photo.setUsername(rs.getString("username"));
		photo.setAvatar_filename(rs.getString("filename_avatar"));
		photo.setLike_num(rs.getInt("like_num"));
		return photo;
	}
}