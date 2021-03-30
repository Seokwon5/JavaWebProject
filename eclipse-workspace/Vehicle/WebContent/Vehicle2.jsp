<%@page import="vehicle.VehicleBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="vehicle.VehicleDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>List</h1>
	<table>
	
	<%
	    VehicleDAO md = new VehicleDAO();
		List list  = md.makeListVehicle();
		Iterator it = list.iterator();
		VehicleBean sb = null;

		try {
			while(it.hasNext()) {
				sb=(VehicleBean)it.next();
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
				out.print("<td>"+sb.getNum()+"<td>");
			}
		}catch(Exception es){
			System.out.println("Exception Err: ");
		}
			
	%>
	
	</table>



</body>
</html>