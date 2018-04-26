package org.ititandev.service;

import java.util.List;

import org.ititandev.model.Quote;

public interface QuoteService {

	List<Quote> findAllQuotes();

}