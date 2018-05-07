package org.ititandev.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ititandev.Application;
import org.ititandev.dao.AccountDAO;
import org.ititandev.model.Account;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AccountController {
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);

	@PostMapping("/signup")
	public String signUp(HttpServletRequest request, HttpServletResponse response, @RequestBody String body) throws IOException, JSONException {
		JSONObject json = new JSONObject(body);
		// BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		int result = accountDAO.insert(json.getString("username"), json.getString("password"), json.getString("email"),
				json.getString("name"));
		// int result = accountDAO.insert(json.getString("username"),
		// bcrypt.encode(json.getString("password")), json.getString("email"),
		// json.getString("name"));
		response.setContentType("application/json");
		if (result == 1)
			return "{\"result\":\"success\"}";
		else
			return "{\"result\":\"error\"}";
	}

	@GetMapping("/account")
	public Account account() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		return accountDAO.getAccount(username);
	}

	@PutMapping("/account/updateInfo")
	public String updateInfo(HttpServletRequest request, @RequestBody String body) throws IOException, JSONException {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		JSONObject json = new JSONObject(body);
		Account account = new Account();
		account.setUsername(json.getString("username"));
		account.setEmail(json.getString("email"));
		account.setName(json.getString("name"));

		if (accountDAO.updateInfo(username, account) == 1)
			return "{\"result\":\"success\"}";
		else
			return "{\"result\":\"error\"}";
	}

	@PutMapping("/account/updatePassword")
	public String updatePassword(HttpServletRequest request) throws JSONException, IOException {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		StringBuffer buffer = new StringBuffer();
		String line = null;
		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null)
			buffer.append(line);
		JSONObject json = new JSONObject(buffer.toString());
		if (accountDAO.updatePassword(username, json.getString("password")) == 1)
			return "{\"result\":\"success\"}";
		else
			return "{\"result\":\"error\"}";
	}
}
