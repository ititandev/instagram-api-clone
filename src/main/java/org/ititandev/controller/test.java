package org.ititandev.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ititandev.Application;
import org.ititandev.dao.AccountDAO;
import org.ititandev.model.Account;


@RestController
public class test {
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);
	
	@GetMapping("/test")
	public List<Account> test() {
		
		return accountDAO.getAll();
	}
}
