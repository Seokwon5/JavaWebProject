package model1;

import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleCn {
	
	public static void main(String[] args) {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
		String user = "duckwon2";
		String password = "1234";
		try {
			Class.forName(driver);
			System.out.println("jdbc driver �ε� ����");
			DriverManager.getConnection(url, user, password);
			System.out.println("����Ŭ ���� ����");
		} catch (ClassNotFoundException e) {
			System.out.println("jdbc driver �ε� ����");
		} catch (SQLException e) {
			System.out.println("����Ŭ ���� ����");
		}
	}

}