package org.ititandev.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.ititandev.config.Config;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/download")
public class DownloadController {

	// @GetMapping(value = "/avatar/{username}")
	// //, produces = MediaType.IMAGE_JPEG_VALUE)
	// public String get(@PathVariable("username") String username) throws
	// IOException {
	// InputStream in = getClass().getResourceAsStream("D:\\image.jpg");
	//
	// HttpHeaders headers = new HttpHeaders();
	// headers.setContentType(MediaType.IMAGE_JPEG);
	//
	// return username;
	// }
	@GetMapping("/photo/{photo_id}")
	byte[] getPhoto(HttpServletResponse response, @PathVariable("photo_id") String photo_id) throws IOException {
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + photo_id + ".jpg\"");
		InputStream inputStream = new FileInputStream(Config.getConfig("photo.dir") + File.separator + photo_id);
		BufferedImage img = ImageIO.read(inputStream);
		ByteArrayOutputStream byteStream = new ByteArrayOutputStream();
		ImageIO.write(img, "jpg", byteStream);
		return byteStream.toByteArray();
	}

	@GetMapping("/avatar/{username}")
	byte[] getAvatar(HttpServletResponse response, @PathVariable("username") String username) throws IOException {
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + username + ".jpg\"");
		InputStream inputStream = new FileInputStream(Config.getConfig("avatar.dir") + File.separator + username);
		BufferedImage img = ImageIO.read(inputStream);
		ByteArrayOutputStream byteStream = new ByteArrayOutputStream();
		ImageIO.write(img, "jpg", byteStream);
		return byteStream.toByteArray();
	}

	@GetMapping("/story/{story_id}")
	byte[] getStory(HttpServletResponse response, @PathVariable("story_id") String story_id) throws IOException {
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + story_id + ".jpg\"");
		InputStream inputStream = new FileInputStream(Config.getConfig("story.dir") + File.separator + story_id);
		BufferedImage img = ImageIO.read(inputStream);
		ByteArrayOutputStream byteStream = new ByteArrayOutputStream();
		ImageIO.write(img, "jpg", byteStream);
		return byteStream.toByteArray();
	}
	// @RestController
	// @RequestMapping("/image")
	// class DownloadController {
	//
	// @RequestMapping(value = "/download", method = RequestMethod.GET)
	// void downloadImage(HttpServletResponse response){
	//
	// ClassPathResource imageFile = new ClassPathResource("holmes.jpg")
	// response.setContentType(MediaType.IMAGE_JPEG_VALUE)
	// response.setHeader("Content-Disposition", "attachment;
	// filename=\"sherlock_holmes.jpg\"")
	// StreamUtils.copy(imageFile.getInputStream(), response.getOutputStream())
	// }
	//
	// @RequestMapping(value = "/show", method = RequestMethod.GET)
	// void showImage(HttpServletResponse response){
	//
	// ClassPathResource imageFile = new ClassPathResource("holmes.jpg")
	// response.setContentType(MediaType.IMAGE_JPEG_VALUE)
	// response.setHeader("Content-Disposition", "inline;
	// filename=\"sherlock_holmes.jpg\"")
	// StreamUtils.copy(imageFile.getInputStream(), response.getOutputStream())
	// }
	// }
}