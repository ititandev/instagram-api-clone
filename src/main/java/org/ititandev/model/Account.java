package org.ititandev.model;

public class Account {

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	private String id;
	private String username;
	private String password;
	private boolean active;

	public Account() {
	}

	public Account(String username, String password) {
		this.username = username;
		this.password = password;
		this.active = true;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return active;
	}

	public void setEnabled(boolean enabled) {
		this.active = enabled;
	}

}
