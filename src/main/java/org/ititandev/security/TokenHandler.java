package org.ititandev.security;

import java.util.Date;
import java.util.UUID;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class TokenHandler {
	
	final long EXPIRATIONTIME = 15*60*1000; 		// 15 minutes
	final String SECRET = "ThisIsASecret";			// private key, better read it from an external file
	
	final public String TOKEN_PREFIX = "Bearer";			// the prefix of the token in the http header
	final public String HEADER_STRING = "Authorization";	// the http header containing the prexif + the token
	

	public String build(String username) {
		
		Date now = new Date();
		
		String JWT = Jwts.builder()
						 .setId(UUID.randomUUID().toString())
				 		 .setSubject(username)
				 		 .setIssuedAt(now)
				 		 .setExpiration(new Date(System.currentTimeMillis() + EXPIRATIONTIME))
				 		 //.compressWith(CompressionCodecs.DEFLATE) // uncomment to enable token compression
				 		 .signWith(SignatureAlgorithm.HS512, SECRET)
				 		 .compact();
		
		return JWT;
		
	}
	
	/**
	 * Parse a token and extract the subject (username).
	 * 
	 * @param token		A token to parse.
	 * 
	 * @return			The subject (username) of the token.
	 */
	public String parse(String token) {
		
		String username = Jwts.parser()
				  		  	  .setSigningKey(SECRET)
				  		  	  .parseClaimsJws(token.replace(TOKEN_PREFIX, ""))
				  		  	  .getBody()
				  		  	  .getSubject();
		
		return username;
		
	}

}
