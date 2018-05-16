package org.ititandev.controller;

import org.ititandev.Application;
import org.ititandev.dao.AccountDAO;
import org.ititandev.dao.PhotoDAO;
import org.ititandev.model.UserPage;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserPageController {
	static PhotoDAO photoDAO = Application.context.getBean("PhotoDAO", PhotoDAO.class);
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);

	@GetMapping("/profile/{username}/{start}/{limit}")
	public UserPage getUserPage(@PathVariable("username") String username, @PathVariable("start") int start,
			@PathVariable("limit") int limit) {
		String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		if (accountDAO.checkBlock(username, currentUser))
			return null;
		else {
			UserPage userPage = photoDAO.getUserPage(username);
			userPage.setPhoto(photoDAO.getPhoto(username, start, limit));
			return userPage;
		}
	}
}
