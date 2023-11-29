package com.haiyan.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Vector;

public class ConnectionPool {
	
	private Vector<Connection> pool;

	private String url; 
	
	private String username; 
	
	private String password;
	
	private String driverClassName; 
	
	private int poolSize = 20; 
	private static ConnectionPool instance = null ; 
	private ConnectionPool() {
		init();
	}
	private void init() {
		pool = new Vector<Connection>(poolSize);
		readConfig(); 
		addConnection(); 
	}
	public synchronized void release(Connection conn) {
		pool.add(conn);
	}
	public synchronized void closePool() {
		for (int i = 0; i < poolSize; i++) {
			if(pool.get(i) != null){
				try {
					((Connection)pool.get(i)).close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		}
		pool.clear();
	}
	public synchronized Connection getConnection() {
		if (pool.size() > 0) {
			Connection conn = pool.get(0);
			pool.remove(conn);
			return conn;
		} else {
			return null;
		}
	}
	private void addConnection() {
		Connection conn = null;
		for (int i = 0; i < poolSize; i++) {
			try {
				Class.forName(driverClassName);
				conn = java.sql.DriverManager.getConnection(url, username, password);
				pool.add(conn);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void readConfig() {
		try {
			Properties props = new Properties();
			props.load(getClass().getResourceAsStream("/dbpool.properties"));
			this.driverClassName = props.getProperty("driverClassName"); 
			this.username = props.getProperty("username"); 
			this.url = props.getProperty("url"); 
			this.password = props.getProperty("password");
			this.poolSize = Integer.parseInt(props.getProperty("poolSize")); 
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("读取属性文件出错。");
		}
	}
	public static ConnectionPool getInstance() {
		if (instance == null) { 
			instance = new ConnectionPool(); 
		}
		return instance;
	}
}
