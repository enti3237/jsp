package kr.co.farmstory.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	// DB 개발자 정보
	private static final String HOST = "jdbc:mysql://192.168.44.3/ljy";
	private static final String USER = "ljy";
	private static final String PASS = "1234";
	
	// DB 배포자 정보 (GCP의 보드 정보)
//	private static final String HOST = "jdbc:mysql://";
//	private static final String USER = "board";
//	private static final String PASS = "1q2w3e4r";
//	
	
	public static Connection getConnection() throws Exception {
		
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}
}
