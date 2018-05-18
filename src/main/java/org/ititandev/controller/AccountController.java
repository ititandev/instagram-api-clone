package org.ititandev.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ititandev.Application;
import org.ititandev.config.Config;
import org.ititandev.dao.AccountDAO;
import org.ititandev.model.Account;
import org.ititandev.model.User;
import org.ititandev.security.TokenHandler;
import org.ititandev.service.MailService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AccountController {
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);

	@GetMapping("/")
	public String root() {
		return "Welcome to Instagram API Clone\nIt's for android app to use.";
	}

	@PostMapping("/signup")
	public Object signUp(HttpServletRequest request, HttpServletResponse response, @RequestBody String body)
			throws IOException, JSONException {
		JSONObject json = new JSONObject(body);
		response.setContentType("application/json");
		int result = 0;
		try {
			// BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
			result = accountDAO.insert(json.getString("username"), json.getString("password"), json.getString("email"),
					json.getString("name"));
			// int result = accountDAO.insert(json.getString("username"),
			// bcrypt.encode(json.getString("password")), json.getString("email"),
			// json.getString("name"));
		} catch (DuplicateKeyException e) {
			return "Username existed";
		}
		if (result == 1) {
			String body1 = new String(Files.readAllBytes(Paths.get(Config.getConfig("mail.verify.path1"))),
					StandardCharsets.UTF_8);
			String body2 = new String(Files.readAllBytes(Paths.get(Config.getConfig("mail.verify.path2"))),
					StandardCharsets.UTF_8);
			String verify = accountDAO.getVerifyLink(json.getString("username"));
			String email = accountDAO.getEmail(json.getString("username"));
			MailService.sendMail(email, "Instagram: Verify account", body1 + verify + body2);
			return "true";
		}

		else
			return "Register failed";
	}

	@GetMapping("/verify/resend/{username}")
	public String resend(@PathVariable("username") String username) throws IOException {
		String body1 = new String(Files.readAllBytes(Paths.get(Config.getConfig("mail.verify.path1"))),
				StandardCharsets.UTF_8);
		String body2 = new String(Files.readAllBytes(Paths.get(Config.getConfig("mail.verify.path2"))),
				StandardCharsets.UTF_8);
		String verify = accountDAO.getVerifyLink(username);
		String email = accountDAO.getEmail(username);
		MailService.sendMail(email, "Instagram: Verify account", body1 + verify + body2);
		return "done";
	}

	@GetMapping("/verify/{username}/{hash}")
	public String verify(@PathVariable("username") String username, @PathVariable("hash") String hash) {
		return accountDAO.verify(username, hash);
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

	@PostMapping("/refresh")
	public String refreshToken(HttpServletResponse response, Authentication authentication) throws IOException {
		String username = authentication.getName();
		if (accountDAO.checkLock(username)) {
			response.setStatus(401);
			return "{\r\n" + "    \"timestamp\": 1526663411911,\r\n" + "    \"status\": 401,\r\n"
					+ "    \"error\": \"Unauthorized\",\r\n"
					+ "    \"message\": \"Authentication Failed: User is disabled\",\r\n"
					+ "    \"path\": \"/login\"\r\n" + "}";
		}
		TokenHandler tokenHandler = new TokenHandler();
		String JWT = tokenHandler.build(username);
		response.addHeader(tokenHandler.HEADER_STRING, tokenHandler.TOKEN_PREFIX + " " + JWT);
		String check = accountDAO.checkVerify(username);
		if (check.equals("false")) {
			String body1 = new String(Files.readAllBytes(Paths.get(Config.getConfig("mail.verify.path1"))),
					StandardCharsets.UTF_8);
			String body2 = new String(Files.readAllBytes(Paths.get(Config.getConfig("mail.verify.path2"))),
					StandardCharsets.UTF_8);
			String verify = accountDAO.getVerifyLink(username);
			String email = accountDAO.getEmail(username);
			MailService.sendMail(email, "Instagram: Verify account", body1 + verify + body2);
		}
		return check;
	}

	@GetMapping("/search/user/{keyword}")
	public List<User> searchUser(@PathVariable("keyword") String keyword) {
		String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		return accountDAO.searchUser(keyword, currentUser);
	}
}
