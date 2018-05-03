package org.ititandev.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ImageController {

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
	
	@RequestMapping(value = "/avatar/{username}", method = RequestMethod.GET)
	byte[] downloadImage(HttpServletResponse response, @PathVariable("username") String username) throws IOException {
		File f = new File("image.jpg");
		// System.out.println(f.exists());
		// ClassPathResource imageFile = new ClassPathResource(f.getCanonicalPath());
		// response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		// response.setHeader("Content-Disposition", "attachment; filename=\"a.jpg\"");
		// StreamUtils.copy(imageFile.getInputStream(), response.getOutputStream());

		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		response.setHeader("Content-Disposition", "attachment; filename=\"a.jpg\"");
		InputStream is = new FileInputStream(f.getCanonicalPath());
		BufferedImage img = ImageIO.read(is);
		ByteArrayOutputStream byteStream = new ByteArrayOutputStream();
		ImageIO.write(img, "jpg", byteStream);
		return byteStream.toByteArray();
	}
	// @RestController
	// @RequestMapping("/image")
	// class ImageController {
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