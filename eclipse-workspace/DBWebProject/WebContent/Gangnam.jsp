<%@page import="java.util.Vector"%>
<%@page import="vehicle.VehicleBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="vehicle.VehicleDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{
    text-align:center;
}
#paging{
    font-size: 22pt;
}
</style>
</head>
<body>
<center>
<!--�Խñۿ� ī���͸� ���� ���� ���� --> 
<%
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum="1";
		
	} 
	int count = 0; //��ü ���� ���� ���� ����
	int number = 0; //������ �ѹ��� ����
	
	//���� ������ �ϴ� ���������ڸ� ����.
	int currentPage = Integer.parseInt(pageNum);


VehicleDAO md = new VehicleDAO(); 
	count = md.getAllCount();
	
	int startRow = (currentPage-1)*pageSize+1;
	int endRow = currentPage * pageSize;


	Vector<VehicleBean> vec = md.getAllVehicle(startRow , endRow);
	
	number = count - (currentPage  - 1) *pageSize;
%>


<table width = "1000"  bordercolor="black">
	

	<tr height = "50">
	<td align= "center" width="200" bgcolor="black" >
		<font color="white" size="5">���� �ڵ��� ������<a href="#" style="text-decoration:none"></a></font>
	</td>
	<td align= "center" width="200" bgcolor="gray">
		<font color = "white" size="4"><a href="Gangnam.jsp" style="text-decoration:none">������</a></font>
	</td>
	<td align= "center" width="200" bgcolor="gray">
		<font color = "white" size="4"><a href="Gangbuk.jsp" style="text-decoration:none">���ϱ�</a></font>
	</td>
	<td align= "center" width="200" bgcolor="gray" >
		<font color = "white" size="4"><a href="Info.jsp" style="text-decoration:none">����Ʈ ����</a></font>
	</td>
</table>



<h2>������ ������ ����</h2>
   <table width = "1800" border="1" bgcolor = "skyblue">
   		<tr height = "40">
   			
   			<td width = "30" align="center">��ȣ</td>
   			<td width = "100" align="center">�̸�</td>
   			<td width = "90" align="center">��ġ</td>
   			<td width = "60" align="center">���ø�</td>
   			<td width = "30" align="center">�޾�</td>
   			<td width = "100" align="center">���θ�</td>
   			<td width = "100" align="center">�ּ�</td>
   			<td width = "80" align="center">ȸ���</td>
   			<td width = "80" align="center">ȸ���ȣ</td>
   			<td width = "40" align="center">����</td>
   			<td width = "40" align="center">�浵</td>
   		</tr>
   			
   
   <%
   

         
         for (int i = 0; i < vec.size(); i++){
        	 VehicleBean sb = vec.get(i);
         
       %>

       <tr height = "40">

       	<td width ="30" align="center"> <%=sb.getNum() %></td>
       	<td width ="100" align="center"> <%=sb.getStation() %></td>
       	<td width ="90" align="center"> <%=sb.getLocation() %></td>
       	<td width ="60" align="center"> <%=sb.getCity() %></td>
       	<td width ="30" align="center"> <%=sb.getClosed() %></td>
       	<td width ="100" align="center"> <%=sb.getRoadname() %></td>
       	<td width ="100" align="center"> <%=sb.getLot() %></td>
       	<td width ="80" align="center"> <%=sb.getManagement() %></td>
       	<td width ="80" align="center"> <%=sb.getPhonenumber() %></td>
       	<td width ="40" align="center"> <%=sb.getLatitude() %></td>
       	<td width ="40" align="center"> <%=sb.getHardness() %></td>
       </tr>
       
         
      <% 
   }
 %>
   

   
   </table>

   
   </center>

</body>
</html>