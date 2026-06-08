package org.ititandev.security;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collections;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.ititandev.dao.AccountDAO;
import org.ititandev.model.Account;
import org.ititandev.service.MailService;
import org.ititandev.service.TokenAuthenticationService;
import org.ititandev.service.TokenAuthenticationServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JWTLoginFilter extends AbstractAuthenticationProcessingFilter {

	private TokenAuthenticationService tokenAuthenticationService = new TokenAuthenticationServiceImpl();

	private AccountDAO accountDAO;
	private MailService mailService;

	private String mailVerifyPath1;
	private String mailVerifyPath2;

	@Value("${hostname}")
	private String hostname;


	public JWTLoginFilter(String url, AuthenticationManager authManager, AccountDAO accountDAO, MailService mailService, String mailVerifyPath1, String mailVerifyPath2) {
		super(new AntPathRequestMatcher(url));
		setAuthenticationManager(authManager);
		this.accountDAO = accountDAO;
		this.mailVerifyPath1 = mailVerifyPath1;
		this.mailVerifyPath2 = mailVerifyPath2;
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
		String username = auth.getName();
		String check = accountDAO.checkVerify(username);
		if (check.equals("false")) {
			String body1 = new String(Files.readAllBytes(Paths.get(mailVerifyPath1)), StandardCharsets.UTF_8);
			String body2 = new String(Files.readAllBytes(Paths.get(mailVerifyPath2)), StandardCharsets.UTF_8);
			String verify = accountDAO.getVerifyLink(username, hostname);
			String email = accountDAO.getEmail(username);
			mailService.sendMail(email, "Instagram: Verify account", body1 + verify + body2);
		}
		res.getOutputStream().print(check);
	}

}
