package org.ititandev.controller;

import java.util.List;

import org.ititandev.Application;
import org.ititandev.dao.CommentDAO;
import org.ititandev.dao.PhotoDAO;
import org.ititandev.dao.ReplyDAO;
import org.ititandev.model.Comment;
import org.ititandev.model.Photo;
import org.ititandev.model.Reply;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PhotoController {
	static PhotoDAO photoDAO = Application.context.getBean("PhotoDAO", PhotoDAO.class);
	static CommentDAO commentDAO = Application.context.getBean("CommentDAO", CommentDAO.class);
	static ReplyDAO replyDAO = Application.context.getBean("ReplyDAO", ReplyDAO.class);

	@GetMapping("/newfeed/{start}/{limit}")
	public List<Photo> getNewfeed(@PathVariable("start") int start, @PathVariable("limit") int limit) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Photo> photo = photoDAO.getPhoto(username, start, limit);
		for (Photo p : photo) {
			List<Comment> comment = commentDAO.getComment(p.getPhoto_id(), 0, 5);
			p.setComment(comment);
		}
		return photo;
	}

	@GetMapping("/comment/{photo_id}/{start}/{limit}")
	public List<Comment> getComment(@PathVariable("photo_id") int photo_id, @PathVariable("start") int start,
			@PathVariable("limit") int limit) {
		List<Comment> comment = commentDAO.getComment(photo_id, start, limit);
		for (Comment c : comment) {
			List<Reply> reply = replyDAO.getReply(c.getComment_id(), 0, 5);
			c.setReply(reply);
		}
		return comment;
	}

	@GetMapping("/reply/{comment_id}/{start}/{limit}")
	public List<Reply> getReply(@PathVariable("comment_id") int comment_id, @PathVariable("start") int start,
			@PathVariable("limit") int limit) {
			return replyDAO.getReply(comment_id, start, limit);
	}
	
	@GetMapping("/newfeed/all")
	public List<Photo> getAll() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Photo> photo = photoDAO.getPhoto(username, 0, 1000);
		for (Photo p : photo) {
			List<Comment> comment = commentDAO.getComment(p.getPhoto_id(), 0, 1000);
			p.setComment(comment);
			for (Comment c : comment) {
				c.setReply(replyDAO.getReply(c.getComment_id(), 0, 1000));
			}
		}
		return photo;
	}
}
