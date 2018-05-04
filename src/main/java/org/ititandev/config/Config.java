package org.ititandev.config;

import java.io.FileInputStream;
import java.util.Properties;

public class Config {

	private Properties properties;
	private Properties config;
	private static Config instance;

	private Config() {
		properties = new Properties();
		config = new Properties();
		try {
			properties.load(this.getClass().getClassLoader().getResourceAsStream("application.properties"));
			config.load(new FileInputStream("server.conf"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String _getProperty(String key) {
		return properties.getProperty(key);
	}
	
	private String _getConfig(String key) {
		return config.getProperty(key);
	}
	public static String getProperty(String key) {
		if (instance == null)
			instance = new Config();
		return instance._getProperty(key);
	}

	public static String getConfig(String key) {
		if (instance == null)
			instance = new Config();
		return instance._getConfig(key);
	}
}