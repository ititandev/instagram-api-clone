package org.ititandev.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.ititandev.Application;
import org.ititandev.config.Config;
import org.ititandev.dao.AccountDAO;
import org.ititandev.dao.PhotoDAO;
import org.ititandev.model.Account;

@RestController
public class test {
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);
	static PhotoDAO photoDAO = Application.context.getBean("PhotoDAO", PhotoDAO.class);
	
	@GetMapping("/userlist")
	public List<Account> test() {
		return accountDAO.getAll();
	}

	@GetMapping("/current")
	public String current() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}

	@PostMapping("/test/{username1}/{username2}")
	public Map<String, Object> request(@PathVariable("username1") String username1, @PathVariable("username2") String username2) {
		return photoDAO.test(username1, username2);
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
