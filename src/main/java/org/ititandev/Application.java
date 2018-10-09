package org.ititandev;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
@EnableAutoConfiguration
public class Application {

	public static ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");

	public static void main(String[] args) throws IOException {
		SpringApplication.run(Application.class, args);
	}
}
