package org.ititandev.security.service;

import static java.util.Collections.emptyList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ititandev.security.TokenHandler;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;

@Service
public class TokenAuthenticationServiceImpl implements TokenAuthenticationService {
	
	private TokenHandler tokenHandler = new TokenHandler();

	@Override
	public void addAuthentication(HttpServletResponse res, Authentication authentication) {
		
		String user = authentication.getName();
		
		String JWT = tokenHandler.build(user);
		
		res.addHeader(tokenHandler.HEADER_STRING, tokenHandler.TOKEN_PREFIX + " " + JWT);
	}
	
	@Override
	public Authentication getAuthentication(HttpServletRequest request) {
		
		String token = request.getHeader(tokenHandler.HEADER_STRING);
		
		if (token != null && token.startsWith(tokenHandler.TOKEN_PREFIX)) {
			// Parse the token.
			String user = null;
			
			try {
				user = tokenHandler.parse(token);
			} catch (ExpiredJwtException e) {
				e.printStackTrace();
			} catch (UnsupportedJwtException e) {
				e.printStackTrace();
			} catch (MalformedJwtException e) {
				e.printStackTrace();
			} catch (SignatureException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			}
			
			if (user != null) {
				return new UsernamePasswordAuthenticationToken(user, null, emptyList());
			} else {
				return null;
			}

		}
		
		return null;
		
	}
	
}
