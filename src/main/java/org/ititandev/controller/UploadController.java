package org.ititandev.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import org.ititandev.Application;
import org.ititandev.dao.PhotoDAO;
import org.ititandev.model.Photo;
import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class UploadController {

	@Autowired
	private PhotoDAO photoDAO;

	@Value("${photo.dir}")
	private String photoDir;

	@Value("${avatar.dir}")
	private String avatarDir;

	@Value("${story.dir}")
	private String storyDir;

	@PostMapping("/photo")
	String photo(@RequestParam("file") MultipartFile file, @RequestParam("caption") String caption,
			@RequestParam("location") String location) throws Exception {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Photo photo = new Photo();
		photo.setUsername(username);
		photo.setCaption(caption);
		photo.setLocation(location);

		int photo_id = photoDAO.insertPhoto(photo);
		String filename = String.valueOf(photo_id + 100) + ".jpg";
		try {
			byte[] bytes = file.getBytes();
			File dir = new File(photoDir);
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
	String avatar(@RequestParam("file") MultipartFile file) throws Exception {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		String filename = "test.jpg";
		try {
			byte[] bytes = file.getBytes();
			File dir = new File(avatarDir);
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
	String story(@RequestParam("file") MultipartFile file) throws Exception {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		String filename = "test.jpg";
		try {
			byte[] bytes = file.getBytes();
			File dir = new File(storyDir);
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

	@PostMapping("/kiet")
	String kiet(@RequestParam("file") MultipartFile file) {
//		return "done";
		String filename = "file";
		try {
			byte[] bytes = file.getBytes();
			File dir = new File(storyDir);
			if (!dir.exists())
				dir.mkdirs();
			File serverFile = new File("D:" + File.separator + filename);
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

	@PostMapping("/toan")
	String toan(@RequestParam("username") String username, @RequestParam("password") String password) {
		if (photoDAO.insertToan(username, password) == 1)
			return "{\"result\":\"success\"}";
		else
			return "{\"result\":\"error\"}";
	}
	
	@GetMapping("/toan/view")
	List<Map<String, Object>> toanview() {
		return photoDAO.getToan();
	}
	
	
	// String camera_model = json.getString("camera_model");
	// String fstop = json.getString("fstop");
	// String exposure_time = json.getString("exposure_time");
	// String ISO = json.getString("ISO");
	// String focal_length = json.getString("focal_length");
	// String flash_mode = json.getString("flash_mode");
}
