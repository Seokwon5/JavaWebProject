<%@page import="vehicle.VehicleBean"%>
<%@page import="vehicle.VehicleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h1>������</h1>
	<table width="1300" border="3" bordercolor="lightgray">
	
		<tr height = "30">
			<td width="50" align="center">��ȣ</td>
			<td width="80" align="center">������ ��</td>
			<td width="80" align="center">������ ��ġ</td>
			<td width="70" align="center">��ġ�õ���</td>
			<td width="50" align="center">������</td>
			<td width="80" align="center">������ ���θ�</td>
			<td width="80" align="center">������ ����</td>
			<td width="80" align="center">������ü ��</td>
			<td width="80" align="center">������ü ��ȣ</td>
			<td width="50" align="center">����</td>
			<td width="50" align="center">�浵</td>
		</tr>
		<%
	    VehicleDAO md = new VehicleDAO();
		List list  = md.makeListVehicle();
		Iterator it = list.iterator();
		VehicleBean sb = null;

		try {
			while(it.hasNext()) {
				sb=(VehicleBean)it.next();
			
	%>
		
		<tr height = "30">
			<td width="50" align="center"><%=sb.getNum()%></td>
			<td width="80" align="center"><%=sb.getStation()%></td>
			<td width="80" align="center"><%=sb.getLocation()%></td>
			<td width="70" align="center"><%=sb.getCity()%></td>
			<td width="50" align="center"><%=sb.getClosed()%></td>
			<td width="80" align="center"><%=sb.getRoadname()%></td>
			<td width="80" align="center"><%=sb.getLot()%></td>
			<td width="80" align="center"><%=sb.getManagement()%></td>
			<td width="80" align="center"><%=sb.getPhonenumber()%></td>
			<td width="50" align="center"><%=sb.getLatitude()%></td>
			<td width="50" align="center"><%=sb.getHardness()%></td>
			
			<% 
			}
			  }catch(Exception es){
				  System.out.println("Exception Err: ");
			  }
			%>
			
		</tr>
		
	
	</table>

</body>
</html>