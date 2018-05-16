package org.ititandev.security;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ititandev.Application;
import org.ititandev.dao.AccountDAO;
import org.ititandev.model.Account;
import org.ititandev.service.TokenAuthenticationService;
import org.ititandev.service.TokenAuthenticationServiceImpl;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JWTLoginFilter extends AbstractAuthenticationProcessingFilter {

	private TokenAuthenticationService tokenAuthenticationService = new TokenAuthenticationServiceImpl();
	static AccountDAO accountDAO = Application.context.getBean("AccountDAO", AccountDAO.class);

	public JWTLoginFilter(String url, AuthenticationManager authManager) {
		super(new AntPathRequestMatcher(url));
		setAuthenticationManager(authManager);
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res)
			throws AuthenticationException, IOException, ServletException {

		Account account = new ObjectMapper().readValue(req.getInputStream(), Account.class);

		return getAuthenticationManager().authenticate(new UsernamePasswordAuthenticationToken(account.getUsername(),
				account.getPassword(), Collections.emptyList()));
	}

	@Override
	protected void successfulAuthentication(HttpServletRequest req, HttpServletResponse res, FilterChain chain,
			Authentication auth) throws IOException, ServletException {
		tokenAuthenticationService.addAuthentication(res, auth);
		res.getOutputStream().print(accountDAO.checkVerify(auth.getName()));
	}

}
