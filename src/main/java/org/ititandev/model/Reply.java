package org.ititandev.model;

public class Reply {

	String reply_id;
	String content;
	String datetime;
	String username;
	String filename_avatar;

	public String getReply_id() {
		return reply_id;
	}

	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFilename_avatar() {
		return filename_avatar;
	}

	public void setFilename_avatar(String filename_avatar) {
		this.filename_avatar = filename_avatar;
	}
}
