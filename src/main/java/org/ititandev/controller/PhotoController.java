package org.ititandev.controller;

import java.util.List;

import org.ititandev.Application;
import org.ititandev.dao.AccountDAO;
import org.ititandev.dao.CommentDAO;
import org.ititandev.dao.PhotoDAO;
import org.ititandev.dao.ReplyDAO;
import org.ititandev.model.Comment;
import org.ititandev.model.Photo;
import org.ititandev.model.Reply;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PhotoController {
	static PhotoDAO photoDAO = Application.context.getBean("PhotoDAO", PhotoDAO.class);
	static CommentDAO commentDAO = Application.context.getBean("CommentDAO", CommentDAO.class);
	static ReplyDAO replyDAO = Application.context.getBean("ReplyDAO", ReplyDAO.class);
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);

	@GetMapping("/newfeed/{start}/{limit}")
	public List<Photo> getNewfeed(@PathVariable("start") int start, @PathVariable("limit") int limit) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Photo> photo = photoDAO.getNewfeed(username, start, limit);
		for (Photo p : photo) {
			List<Comment> comment = commentDAO.getComment(p.getPhoto_id(), 0, 5);
			p.setComment(comment);
		}
		return photo;
	}

	@GetMapping("/newfeed/all")
	public List<Photo> getAll() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Photo> photo = photoDAO.getNewfeed(username, 0, 1000);
		for (Photo p : photo) {
			List<Comment> comment = commentDAO.getComment(p.getPhoto_id(), 0, 1000);
			p.setComment(comment);
			for (Comment c : comment) {
				c.setReply(replyDAO.getReply(c.getComment_id(), 0, 1000));
			}
		}
		return photo;
	}

	@GetMapping("/comment/{photo_id}/{start}/{limit}")
	public List<Comment> getComment(@PathVariable("photo_id") int photo_id, @PathVariable("start") int start,
			@PathVariable("limit") int limit) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if (accountDAO.checkPrivilege(username, photoDAO.getUsernameWithPhoto_id(photo_id))) {
			List<Comment> comment = commentDAO.getComment(photo_id, start, limit);
			for (Comment c : comment) {
				List<Reply> reply = replyDAO.getReply(c.getComment_id(), 0, 5);
				c.setReply(reply);
			}
			return comment;
		} else
			return null;
	}

	@GetMapping("/reply/{comment_id}/{start}/{limit}")
	public List<Reply> getReply(@PathVariable("comment_id") int comment_id, @PathVariable("start") int start,
			@PathVariable("limit") int limit) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if (accountDAO.checkPrivilege(username, photoDAO.getUsernameWithComment_id(comment_id)))
			return replyDAO.getReply(comment_id, start, limit);
		else
			return null;
	}

	@GetMapping("/like/{photo_id}")
	public List<String> getLikeUsername(@PathVariable("photo_id") int photo_id) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if (accountDAO.checkPrivilege(username, photoDAO.getUsernameWithPhoto_id(photo_id)))
			return photoDAO.getLikeUsername(photo_id);
		else
			return null;
	}

	// @PutMapping("/photo/{photo_id}")
	@PostMapping("/test/{param}")
	public String test(@PathVariable("param") String param) {
		return null;
	}
}
