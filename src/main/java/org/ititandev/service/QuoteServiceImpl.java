package org.ititandev.service;

import java.util.ArrayList;
import java.util.List;

import org.ititandev.model.Quote;
import org.ititandev.repository.QuoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("quoteService")
public class QuoteServiceImpl implements QuoteService {
	
	@Autowired
	private QuoteRepository quoteRepository;
	
	@Override
	public List<Quote> findAllQuotes() {
		List<Quote> quotes = new ArrayList<>(quoteRepository.findAllQuotes());
		return quotes;
	}
	
}
