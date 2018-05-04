package org.ititandev.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SignUpController {

	@PostMapping("/signup")
	public String signUp(HttpServletRequest request) throws IOException, JSONException{
		StringBuffer buffer = new StringBuffer();
		String line = null;
		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null)
			buffer.append(line);
		JSONObject json = new JSONObject(buffer.toString());

		String username = json.getString("username");
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		bcrypt.encode(json.getString("password"));
		
		return "done";
		
	}

}
