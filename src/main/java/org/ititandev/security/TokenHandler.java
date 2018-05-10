package org.ititandev.security;

import java.util.Date;
import java.util.UUID;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class TokenHandler {
	
	final long EXPIRATIONTIME = 7*24*60*60*1000; 		
	final String SECRET = "make by ititandev";			// private key, better read it from an external file
	
	final public String TOKEN_PREFIX = "Ins";			// the prefix of the token in the http header
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
	
	public String parse(String token) {
		
		String username = Jwts.parser()
				  		  	  .setSigningKey(SECRET)
				  		  	  .parseClaimsJws(token.replace(TOKEN_PREFIX, ""))
				  		  	  .getBody()
				  		  	  .getSubject();
		
		return username;
		
	}

}
