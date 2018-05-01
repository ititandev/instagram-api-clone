package org.ititandev.security;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ititandev.model.Account;
import org.ititandev.security.service.TokenAuthenticationService;
import org.ititandev.security.service.TokenAuthenticationServiceImpl;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JWTSignUpFilter extends AbstractAuthenticationProcessingFilter {
	
	private TokenAuthenticationService tokenAuthenticationService = new TokenAuthenticationServiceImpl();

	public JWTSignUpFilter(String url, AuthenticationManager authManager) {
		super(new AntPathRequestMatcher(url));
		setAuthenticationManager(authManager);
	}
	
	@Override
	public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res) throws AuthenticationException, IOException, ServletException {
		
		// Retrieve username and password from the http request and save them in an Account object.
		Account account = new ObjectMapper().readValue(req.getInputStream(), Account.class);
		
		// Verify if the correctness of login details.
		// If correct, the successfulAuthentication() method is executed.
		return getAuthenticationManager().authenticate(
				new UsernamePasswordAuthenticationToken(
						account.getUsername(),
						account.getPassword(),
						Collections.emptyList()
						)
				);
	}

	@Override
	protected void successfulAuthentication(HttpServletRequest req, HttpServletResponse res, FilterChain chain, Authentication auth) throws IOException, ServletException {
		
		// Pass authenticated user data to the tokenAuthenticationService in order to add a JWT to the http response.
		tokenAuthenticationService.addAuthentication(res, auth);
	}

}
