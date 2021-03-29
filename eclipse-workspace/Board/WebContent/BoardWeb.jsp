
<%@page import="model.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%
	SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd HH:mm");
	BoardDAO manager = BoardDAO.getInstance();
	List<BoardBean> list = manager.getList();
	BoardBean data = new BoardBean();
	
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>날짜</td>
			<td>지역</td>
			<td>여행</td>
			<td>접촉경로</td>
			<td>액션</td>
			<td>가입일자</td>
			<td>모디파이</td>
			<td>접촉여부</td>
		</tr>
		
		<tr>
			<td><%=data.getNum() %></td>
			<td><%=data.getDt() %></td>
			<td><%=data.getArea() %></td>
			<td><%=data.getTravel() %></td>
			<td><%=data.getContact() %></td>
			<td><%=data.getAction() %></td>
			<td><%=data.getRegistration() %></td>
			<td><%=data.getModifiy() %></td>
			<td><%=data.getExposure() %></td>
	
		
		
		</tr>
	</table>

</body>
</html>