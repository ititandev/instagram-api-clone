package org.ititandev.repository;

import java.util.Collection;

import org.ititandev.model.Quote;

public interface QuoteRepository {

	Collection<Quote> findAllQuotes();

}