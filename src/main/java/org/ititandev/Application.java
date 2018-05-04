package org.ititandev;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class Application {

	public static ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");

	public static void main(String[] args) throws IOException {
		SpringApplication.run(Application.class, args);
	}
}
