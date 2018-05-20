package org.ititandev.model;

public class ProfilePage {
	String name;
	String username;
	String avatar_filename;
	int photo_num;
	int following_num;
	int follower_num;
	boolean following;
	String biography;
	String website;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getPhoto_num() {
		return photo_num;
	}

	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
	}

	public int getFollowing_num() {
		return following_num;
	}

	public void setFollowing_num(int following_num) {
		this.following_num = following_num;
	}

	public int getFollower_num() {
		return follower_num;
	}

	public void setFollower_num(int follower_num) {
		this.follower_num = follower_num;
	}

	public boolean isFollowing() {
		return following;
	}

	public void setFollowing(boolean following) {
		this.following = following;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
	
}
