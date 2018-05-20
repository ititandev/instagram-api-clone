package org.ititandev.model;

import java.util.List;

public class Photo {
	int photo_id;
	String caption;
	String filename;
	String datetime_upload;
	String datetime_update;
	String location;
	String username;
	String name;
	String avatar_filename;
	int like_num;
	int comment_num;
	List<Comment> comment;

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	public int getPhoto_id() {
		return photo_id;
	}

	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getDatetime_upload() {
		return datetime_upload;
	}

	public void setDatetime_upload(String datetime_upload) {
		this.datetime_upload = datetime_upload;
	}

	public String getDatetime_update() {
		return datetime_update;
	}

	public void setDatetime_update(String datetime_update) {
		this.datetime_update = datetime_update;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAvatar_filename() {
		return avatar_filename;
	}

	public void setAvatar_filename(String avatar_filename) {
		this.avatar_filename = avatar_filename;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

}
