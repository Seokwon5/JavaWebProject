package vehicle;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class VehicleDAO {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "select*from vehicle";
	String drv = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
	String user = "duckwon2";
	String pass = "1234";
	
public Connection makeConnection() throws SQLException{
	try {
		Class.forName(drv);
		conn = DriverManager.getConnection(url, user, pass);
	}catch(ClassNotFoundException ex) {
		System.out.println("SQL CNF: "+ex.getCause());
	}catch(SQLException es) {
		System.out.println("SQL CNF: "+es.getSQLState());
		
	}
	return conn;
}
public ResultSet getRS() {
	try {
		conn = makeConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
	}catch(SQLException es) {
		System.out.println("SQL RS Err: "+es.getErrorCode());
	}
	return rs;
	
}
public void printVehicle() {
	try {
		rs = getRS();
		while(rs.next()) {
			System.out.printf("%20s",rs.getInt("1"));
			System.out.printf("%20s",rs.getString("2"));
			System.out.printf("%20s",rs.getString("3"));
			System.out.printf("%20s",rs.getString("4"));
			System.out.printf("%20s",rs.getString("5"));
			System.out.printf("%20s",rs.getString("6"));
			System.out.printf("%20s",rs.getString("7"));
			System.out.printf("%20s",rs.getString("8"));
			System.out.printf("%20s",rs.getString("9"));
			System.out.printf("%20s",rs.getString("10"));
			System.out.printf("%20s%n",rs.getString("11"));
		}
	}catch(SQLException es) {
		System.out.println("SQL Err3: "+es.getSQLState());
	}
}


public List makeListVehicle() {
	
	VehicleBean sb = null;
	List list = new ArrayList();
	
	try {
		
		rs = getRS();
		while(rs.next()) {
			sb=new VehicleBean();
			sb.setNum(rs.getInt(1));
			sb.setStation(rs.getString(2));
			sb.setLocation(rs.getString(3));
			sb.setCity(rs.getString(4));
			sb.setClosed(rs.getString(5));
			sb.setRoadname(rs.getString(6));
			sb.setLot(rs.getString(7));
			sb.setManagement(rs.getString(8));
			sb.setPhonenumber(rs.getString(9));
			sb.setLatitude(rs.getString(10));
			sb.setHardness(rs.getString(11));
			list.add(sb);
		}
	}catch(SQLException es) {
		System.out.println("SQL Err4: "+es.getSQLState());
	}finally {
		try {
			if(rs!=null) {rs.close();}
		}catch (Exception e2) {
			e2.printStackTrace();
		}
	}try {
		if(stmt!=null) {stmt.close();}
	}catch(Exception e2) {
		e2.printStackTrace();
	}
	try {
		if(conn!=null) {conn.close();}
	}catch(Exception e2) {
		e2.printStackTrace();
	}

	return list;
}
 


public void printListVehicle() {
	List list = makeListVehicle();
	Iterator it = list.iterator();
	VehicleBean sb = null;
	try {
		while(it.hasNext()) {
			sb = (VehicleBean)it.next();
			System.out.printf("%20s", sb.getNum());
			System.out.printf("%20s", sb.getStation());
			System.out.printf("%20s", sb.getLocation());
			System.out.printf("%20s", sb.getCity());
			System.out.printf("%20s", sb.getClosed());
			System.out.printf("%20s", sb.getRoadname());
			System.out.printf("%20s", sb.getLot());
			System.out.printf("%20s", sb.getManagement());
			System.out.printf("%20s", sb.getPhonenumber());
			System.out.printf("%20s", sb.getLatitude());
			System.out.printf("%20s%n", sb.getHardness());
		}
	}catch(Exception es) {
		System.out.println("Exception Err: ");
	}
	
}
	
	
	
	public static void main(String[] args) {
		System.out.println("hi");
		VehicleDAO md = new VehicleDAO();
		md.printVehicle();
		System.out.println("list processing");
		md.printListVehicle();
		System.out.println("¼º°ø");

	}

}