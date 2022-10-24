<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>	
<body>
 <a href="testDuck.jsp/front?key=sell&methodName=updateSellStatus">나와랏!!!</a> 

<form name="writeForm" method="post" action="${pageContext.request.contextPath}/front?key=sell&methodName=updateSellStatus">
	sellNo<input type="text" name="sellNo" size="30"></span></b></td><p>
	sellStatus<input type="text" name="sellStatus" size="30"></span></b></td><p>
	sellUserId<input type="text" name="sellUserId" size="30"></span></b></td><p>
	<!-- sellPrice<input type="text" name="sellPrice" size="30"></span></b></td><p>
	purDate<input type="text" name="purDate" size="30"></span></b></td><p>
	serialNumber<input type="text" name="serialNumber" size="30"></span></b></td><p> -->
	<input type="submit" value="보내!">
	
	<a href="${pageContext.request.contextPath}/front?key=sell&methodName=selectSellAll"> tttt</a>
	<c:forEach items="${sellAllList}" var="s">
		<p>${s.sellPrice}<p>
		${s.sellNo}<p>
		
	</c:forEach>
</form>
</body>
</html>