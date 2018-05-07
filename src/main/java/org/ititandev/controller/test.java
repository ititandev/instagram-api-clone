package org.ititandev.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.ititandev.Application;
import org.ititandev.config.Config;
import org.ititandev.dao.AccountDAO;
import org.ititandev.model.Account;
import org.json.JSONException;
import org.json.JSONObject;

@RestController
public class test {
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);

	@GetMapping("/test")
	public List<Account> test() {
		return accountDAO.getAll();
	}

	@GetMapping("/current")
	public String current() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}

	@PostMapping("/request")
	public String request(HttpServletRequest request) throws JSONException, IOException {
		StringBuffer buffer = new StringBuffer();
		String line = null;
		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null)
			buffer.append(line);
		JSONObject jsonObject = new JSONObject(buffer.toString());
		return jsonObject.getString("b");
	}

	@PostMapping("/upload")
	Object uploadFileHandler(@RequestParam("file") MultipartFile file) {
		String filename = "test.jpg";
		try {
			byte[] bytes = file.getBytes();
			File dir = new File(Config.getConfig("photo.dir"));
			if (!dir.exists())
				dir.mkdirs();
			File serverFile = new File(dir.getAbsolutePath() + File.separator + filename);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			System.out.println("[ITitan] Upload PHOTO SUCCESS file: " + serverFile.getAbsolutePath());
			return "{\"result\":\"success\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"result\":\"error\"}";
		}
	}
}
