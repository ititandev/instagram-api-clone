package org.ititandev.model;

import java.util.Date;

public class Account {

	private String username;
	private String password;
	private String email;
	private boolean active;
	private boolean lock;
	private Date datetime_update;
	private Date datetime_create;
	private String name;

	public Account() {
	}

	public Account(String username, String password) {
		this.username = username;
		this.password = password;
		this.active = true;
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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isLock() {
		return lock;
	}

	public void setLock(boolean lock) {
		this.lock = lock;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDatetime_create() {
		return datetime_create;
	}

	public void setDatetime_create(Date datetime_create) {
		this.datetime_create = datetime_create;
	}

	public Date getDatetime_update() {
		return datetime_update;
	}

	public void setDatetime_update(Date datetime_update) {
		this.datetime_update = datetime_update;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
