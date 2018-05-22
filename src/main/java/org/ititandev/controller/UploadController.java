package org.ititandev.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.ititandev.Application;
import org.ititandev.config.Config;
import org.ititandev.dao.PhotoDAO;
import org.ititandev.model.Photo;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class UploadController {
	static PhotoDAO photoDAO = Application.context.getBean("PhotoDAO", PhotoDAO.class);

	@PostMapping("/photo")
	String photo(@RequestParam("file") MultipartFile file, @RequestParam("caption") String caption,
			@RequestParam("location") String location) throws JSONException {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Photo photo = new Photo();
		photo.setUsername(username);
		photo.setCaption(caption);
		photo.setLocation(location);
		

		int photo_id = photoDAO.insertPhoto(photo);
		String filename = String.valueOf(photo_id + 100) + ".jpg";
		try {
			byte[] bytes = file.getBytes();
			File dir = new File(Config.getConfig("photo.dir"));
			if (!dir.exists())
				dir.mkdirs();
			File serverFile = new File(dir.getAbsolutePath() + File.separator + filename);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			photoDAO.setPhotoFilename(filename, photo_id);
			System.out.println("[ITitan] Upload PHOTO SUCCESS file: " + serverFile.getAbsolutePath());
			return "{\"result\":\"success\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"result\":\"error\"}";
		}
	}

	@PostMapping("/avatar")
	String avatar(@RequestParam("file") MultipartFile file) throws JSONException {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		String filename = "test.jpg";
		try {
			byte[] bytes = file.getBytes();
			File dir = new File(Config.getConfig("avatar.dir"));
			if (!dir.exists())
				dir.mkdirs();
			File serverFile = new File(dir.getAbsolutePath() + File.separator + filename);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			System.out.println("[ITitan] Upload AVATAR SUCCESS file: " + serverFile.getAbsolutePath());
			return "{\"result\":\"success\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"result\":\"error\"}";
		}
	}

	@PostMapping("/story")
	String story(@RequestParam("file") MultipartFile file) throws JSONException {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		String filename = "test.jpg";
		try {
			byte[] bytes = file.getBytes();
			File dir = new File(Config.getConfig("story.dir"));
			if (!dir.exists())
				dir.mkdirs();
			File serverFile = new File(dir.getAbsolutePath() + File.separator + filename);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			System.out.println("[ITitan] Upload STORY SUCCESS file: " + serverFile.getAbsolutePath());
			return "{\"result\":\"success\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"result\":\"error\"}";
		}
	}

	// String camera_model = json.getString("camera_model");
	// String fstop = json.getString("fstop");
	// String exposure_time = json.getString("exposure_time");
	// String ISO = json.getString("ISO");
	// String focal_length = json.getString("focal_length");
	// String flash_mode = json.getString("flash_mode");
}
