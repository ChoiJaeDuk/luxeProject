<%@page import="luxeProject.Start"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Start st = new Start();
String id =st.test();
out.println(id);

%>

</body>
</html>