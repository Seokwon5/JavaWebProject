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
		
		//Connection (db����)
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try { 
			con = DriverManager.getConnection(url, id, pass);
			
			//sql��
			String sql = "insert into STUDENT(ID,NAME,DEPT_NAME,TOT_CRED) values(?,?,?,?)";
			
			//sql�� ���� ��ü
			pstmt = con.prepareStatement(sql);
			
			//?�� �� ����
			pstmt.setInt(1, 55746);
			pstmt.setString(2, "Le");
			pstmt.setString(3, "Biolgy");
			pstmt.setString(4, "7");
			
			
			//sql����
			int n = pstmt.executeUpdate();
			if(n == 1) {
				System.out.println("����");
			}else {
				System.out.println("����");
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
			
			
		}finally {
			//Connection, PreparedStatment �ڿ��� �ݳ�
			
			try {
				if(pstmt != null)pstmt.close();
				if(pstmt != null)con.close();
				
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

}



