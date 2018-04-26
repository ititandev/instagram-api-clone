package org.ititandev.controller;

import java.util.List;

import org.ititandev.model.Quote;
import org.ititandev.service.QuoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/quotes")
public class QuoteController {
	
	@Autowired
	private QuoteService quoteService;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<Quote> getQuotes() {
		return quoteService.findAllQuotes();
	}
}
