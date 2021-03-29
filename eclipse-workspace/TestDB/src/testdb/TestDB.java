package testdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestDB {

	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
		String id = "duckwon2";
		String pass = "1234";
		
		try {
			Class.forName(driver);
			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		//Connection (db연결)
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try { 
			con = DriverManager.getConnection(url, id, pass);
			
			//sql문
			String sql = "insert into STUDENT(ID,NAME,DEPT_NAME,TOT_CRED) values(?,?,?,?)";
			
			//sql문 전송 객체
			pstmt = con.prepareStatement(sql);
			
			//?에 값 설정
			pstmt.setInt(1, 55746);
			pstmt.setString(2, "Le");
			pstmt.setString(3, "Biolgy");
			pstmt.setString(4, "7");
			
			
			//sql전송
			int n = pstmt.executeUpdate();
			if(n == 1) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
			
			
		}finally {
			//Connection, PreparedStatment 자원을 반납
			
			try {
				if(pstmt != null)pstmt.close();
				if(pstmt != null)con.close();
				
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

}



