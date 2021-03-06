package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	
	//싱글톤
	private static BoardDAO instance = new BoardDAO();
	private BoardDAO() {}
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public void insert(BoardDAO data) {
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
			String sql = "insert into CORONA(NUM, DT, AREA, TRAVEL, CONTACT, ACTION, REGISTRATION, MODIFIY, EXPOSURE) values(?,?,?,?,?,?,?,?,?)";
			
			//sql문 전송 객체
			pstmt = con.prepareStatement(sql);
			
			//?에 값 설정
			pstmt.setInt(1, 439);
			pstmt.setString(2, "21/03/24");
			pstmt.setString(3, "강북구");
			pstmt.setString(4, "(null)");
			pstmt.setString(5, "해외유입");
			pstmt.setString(6, "(null)");
			pstmt.setString(7, "2021-03-09 10:31");
			pstmt.setString(8, "2021-03-09 10:31");
			pstmt.setString(9, "Y");
			
			
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
	public List<BoardBean> getList(){
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
		String id = "duckwon2";
		String pass = "1234";
		Connection conn = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;
		List<BoardBean> list = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,id,pass);
			
			ppst = conn.prepareStatement("select* from CORONA");
			rs = ppst.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					BoardBean data = new BoardBean();
					
					data.setNum(rs.getInt("439"));
					data.setDt(rs.getString("강북구"));
					data.setDt(rs.getString("강북구"));
					data.setDt(rs.getString("강북구"));
					data.setDt(rs.getString("강북구"));
					data.setDt(rs.getString("강북구"));
					data.setDt(rs.getString("강북구"));
					data.setDt(rs.getString("강북구"));
					data.setDt(rs.getString("강북구"));
					
					list.add(data);
					
				}while (rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(ppst != null) ppst.close();
				if(conn != null) conn.close();
			}catch (Exception e2) {
				
			}
		}
		return list;
	}
	

}
