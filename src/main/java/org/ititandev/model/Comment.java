package org.ititandev.model;

import java.util.List;

public class Comment {
	int comment_id;
	String content;
	String datetime;
	String username;
	String filename_avatar;
	int reply_num;

	public String getFilename_avatar() {
		return filename_avatar;
	}

	public void setFilename_avatar(String filename_avatar) {
		this.filename_avatar = filename_avatar;
	}

	List<Reply> reply;

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
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

	public List<Reply> getReply() {
		return reply;
	}

	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
}
