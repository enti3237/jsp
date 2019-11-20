package sub1;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	// DB정보
	private static final String HOST = "jdbc:mysql://192.168.44.9/ljy";
	private static final String USER = "ljy";
	private static final String PASS = "1234";
	
	public static Connection getConnection() throws Exception {
		
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}
}
