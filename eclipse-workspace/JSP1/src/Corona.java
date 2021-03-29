import java.sql.*;

public class Corona {
	public static void main(String[] args)throws Exception {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String dbFileUrl = "C:\\Users\\tjrdn\\eclipse-workspace\\JSP1.db";
		
		try {
			
			Class.forName("org.sqlite.JDBC"); //SQLite�� ����ϱ�����.
			con=DriverManager.getConnection("jdbc:sqlite:"+dbFileUrl);
			System.out.println("SQLite DB connected");
			
			stmt = con.createStatement();
			
			rs = stmt.executeQuery("select * from aa;");
			
			stmt.executeUpdate("insert into aa(id, memo) values(1,'�׽�Ʈ');");

		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
