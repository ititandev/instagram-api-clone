package org.ititandev.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.ititandev.model.Story;
import org.springframework.jdbc.core.RowMapper;

public class StoryMapper implements RowMapper<Story>{
	public Story mapRow(ResultSet rs, int rowNum) throws SQLException {
		Story story = new Story();
		story.setStory_id(rs.getString("story_id"));
		story.setUsername(rs.getString("username"));
		story.setAvatar_filename(rs.getString("avatar_filename"));
		story.setDatetime(rs.getString("datetime"));
		story.setFilename(rs.getString("filename"));
		story.setName(rs.getString("name"));
		return story;
	}
}