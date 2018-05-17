package org.ititandev.config;

import java.io.FileInputStream;
import java.util.Properties;
import org.apache.commons.lang3.SystemUtils;

public class Config {
	private String path;
	private Properties properties;
	private Properties config;
	private static Config instance;

	private Config() {
		properties = new Properties();
		config = new Properties();
		try {
			properties.load(this.getClass().getClassLoader().getResourceAsStream("application.properties"));
			if (SystemUtils.IS_OS_LINUX)
				path = "/etc/instagram/server.conf";
			else
				path = "server.conf";
			config.load(new FileInputStream(path));
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