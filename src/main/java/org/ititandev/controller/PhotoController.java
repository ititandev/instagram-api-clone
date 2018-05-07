package org.ititandev.controller;

import java.util.List;

import org.ititandev.Application;
import org.ititandev.dao.CommentDAO;
import org.ititandev.dao.PhotoDAO;
import org.ititandev.model.Photo;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PhotoController {
	static PhotoDAO photoDAO = Application.context.getBean("PhotoDAO", PhotoDAO.class);
	static CommentDAO commentDAO = Application.context.getBean("CommentDAO", CommentDAO.class);

	// @GetMapping("/newfeed/{start}/{limit}")
	// public List<Photo> getNewfeed(@RequestParam("start") String start,
	// @RequestParam("limit") String limit) {
	// String username =
	// SecurityContextHolder.getContext().getAuthentication().getName();
	// return photoDAO.getPhoto(username, Integer.valueOf(start),
	// Integer.valueOf(limit));
	// }

	@GetMapping("/newfeed/{start}/{limit}")
	public List<Photo> getNewfeed() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Photo> photo = photoDAO.getPhoto(username, 0, 10);
		return photo;
	}
}
