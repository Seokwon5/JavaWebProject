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
<!--게시글에 카운터링 설정 변수 선언 --> 
<%
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum="1";
		
	} 
	int count = 0; //전체 글의 갯수 저장 변수
	int number = 0; //페이지 넘버링 변수
	
	//현재 보고자 하는 페이지숫자를 저장.
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
		<font color="white" size="5">전기 자동차 충전소<a href="#" style="text-decoration:none"></a></font>
	</td>
	<td align= "center" width="200" bgcolor="gray">
		<font color = "white" size="4"><a href="Gangnam.jsp" style="text-decoration:none">강남구</a></font>
	</td>
	<td align= "center" width="200" bgcolor="gray">
		<font color = "white" size="4"><a href="Gangbuk.jsp" style="text-decoration:none">강북구</a></font>
	</td>
	<td align= "center" width="200" bgcolor="gray" >
		<font color = "white" size="4"><a href="Info.jsp" style="text-decoration:none">사이트 정보</a></font>
	</td>
</table>



<h2>강남구 충전소 정보</h2>
   <table width = "1800" border="1" bgcolor = "skyblue">
   		<tr height = "40">
   			
   			<td width = "30" align="center">번호</td>
   			<td width = "100" align="center">이름</td>
   			<td width = "90" align="center">위치</td>
   			<td width = "60" align="center">도시명</td>
   			<td width = "30" align="center">휴업</td>
   			<td width = "100" align="center">도로명</td>
   			<td width = "100" align="center">주소</td>
   			<td width = "80" align="center">회사명</td>
   			<td width = "80" align="center">회사번호</td>
   			<td width = "40" align="center">위도</td>
   			<td width = "40" align="center">경도</td>
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