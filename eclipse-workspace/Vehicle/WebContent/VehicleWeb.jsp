<%@page import="vehicle.VehicleBean"%>
<%@page import="vehicle.VehicleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>강남권</h1>
	<table width="1300" border="3" bordercolor="lightgray">
	
		<tr height = "30">
			<td width="50" align="center">번호</td>
			<td width="80" align="center">충전소 명</td>
			<td width="80" align="center">충전소 위치</td>
			<td width="70" align="center">설치시도명</td>
			<td width="50" align="center">휴점일</td>
			<td width="80" align="center">소재지 도로명</td>
			<td width="80" align="center">소재지 지번</td>
			<td width="80" align="center">관리업체 명</td>
			<td width="80" align="center">관리업체 번호</td>
			<td width="50" align="center">위도</td>
			<td width="50" align="center">경도</td>
		</tr>
		<%
		VehicleDAO md = new VehicleDAO();
		List list = md.makeListVehicle();
		Iterator it = list.iterator();
		VehicleBean sb = null;
		try {
			while(it.hasNext()) {
				sb = (VehicleBean)it.next();
			
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