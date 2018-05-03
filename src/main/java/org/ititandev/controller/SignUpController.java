package org.ititandev.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.json.JSONException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SignUpController {

	@PostMapping("/signup")
	public String signUp(HttpServletRequest request) throws JSONException, ClientProtocolException, IOException {
		return null;
		
	}

}
