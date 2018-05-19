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
public class ProfileController {
	static PhotoDAO photoDAO = Application.context.getBean("PhotoDAO", PhotoDAO.class);
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);

	@GetMapping("/profile/{username}")
	public UserPage getUserPage(@PathVariable("username") String username) {
		String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		if (accountDAO.checkBlock(username, currentUser))
			return null;
		else {
			UserPage userPage = photoDAO.getProfile(username);
			return userPage;
		}
	}

	@GetMapping("/photo/{username}/{start}/{limit}")
	public Object getPhoto(@PathVariable("username") String username, @PathVariable("start") int start,
			@PathVariable("limit") int limit) {
		String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		if (accountDAO.checkPrivilege(username, currentUser))
			return "private_acc";
		else {
			return photoDAO.getPhoto(username, start, limit);
		}
	}
}
