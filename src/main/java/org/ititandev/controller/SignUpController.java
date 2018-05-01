package org.ititandev.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/signup")
public class SignUpController {

	@PostMapping()
	
    public String hello(HttpServletRequest request) throws JSONException, ClientProtocolException, IOException {
		String ip = "hello";
		ip = request.getRemoteAddr();
        
        HttpClient httpClient = HttpClientBuilder.create().build();
        HttpPost request1 = new HttpPost("http://ip-api.com/json/" + ip);
        //StringEntity params =new StringEntity("details={\"name\":\"myname\",\"age\":\"20\"} ");
        //request1.addHeader("content-type", "application/x-www-form-urlencoded");
        //request1.setEntity(params);
        HttpResponse response1 = httpClient.execute(request1);
        String json = EntityUtils.toString(response1.getEntity());
        JSONObject jsonObj = new JSONObject(json);
//        return jsonObj.toString();
		return ip + "\n" + jsonObj.getString("country") + jsonObj.getString("city")+ jsonObj.getDouble("lat") + jsonObj.getDouble("lon");	
    }
	
}
