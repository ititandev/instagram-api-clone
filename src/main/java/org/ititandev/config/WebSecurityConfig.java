package org.ititandev.config;

import javax.sql.DataSource;

import org.ititandev.dao.AccountDAO;
import org.ititandev.security.JWTAuthenticationEntryPoint;
import org.ititandev.security.JWTAuthenticationFilter;
import org.ititandev.security.JWTLoginFilter;
import org.ititandev.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig{
	@Autowired
    private DataSource dataSource;
	
	@Autowired
    private JWTAuthenticationEntryPoint unauthorizedHandler;

//	@Autowired
//	private AuthenticationManager authenticationManager;

	@Autowired
	private AccountDAO accountDAO;

	@Autowired
	private MailService mailService;

	@Value("${mail.verify.path1}")
	private String mailVerifyPath1;

	@Value("${mail.verify.path2}")
	private String mailVerifyPath2;
	
	@Bean
	protected SecurityFilterChain securityFilterChain(HttpSecurity http, AuthenticationManager authenticationManager) throws Exception {
		http
			.csrf(csrf -> csrf.disable())
			.exceptionHandling(ex -> ex.authenticationEntryPoint(unauthorizedHandler))
			.sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
			.authorizeHttpRequests( auth -> auth
				.requestMatchers("/").permitAll()
				.requestMatchers(HttpMethod.POST, "/login").permitAll()
				.requestMatchers(HttpMethod.POST, "/signup").permitAll()
				.requestMatchers(HttpMethod.GET, "/download/photo/{filename}.{ext}").permitAll()
				.requestMatchers(HttpMethod.GET, "/download/avatar/{filename}.{ext}").permitAll()
				.requestMatchers(HttpMethod.GET, "/download/story/{filename}.{ext}").permitAll()
				.requestMatchers(HttpMethod.GET, "/verify/resend/{username}").permitAll()
				.requestMatchers(HttpMethod.GET, "/verify/{username}/{hash}").permitAll()
				.requestMatchers(HttpMethod.GET, "/avatar").permitAll()
				.requestMatchers(HttpMethod.POST, "/kiet").permitAll()
				.anyRequest().authenticated())
			.addFilterBefore(new JWTLoginFilter("/login", authenticationManager, accountDAO, mailService, mailVerifyPath1, mailVerifyPath2), UsernamePasswordAuthenticationFilter.class)
			.addFilterBefore(new JWTAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class)
			.headers(headers -> headers.cacheControl(cache -> {}));

		return http.build();
	}

	@Bean
	public AuthenticationManager authenticationManager(AuthenticationConfiguration config)
			throws Exception {
		return config.getAuthenticationManager();
	}
}
