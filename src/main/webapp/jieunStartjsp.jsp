<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/front?key=order&methodName=selectOrder" class="btn btn-danger">selectOrder</a><p>
아이디 : <input type="text" id=>

<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/front">
			<input type="hidden" name="key" value = "order" /> <!-- Controller를 찾는 정보 -->
			<input type="hidden" name="methodName" value = "selectOrderByUserIdForSell" />  <!-- 메소드이름 -->
			<fieldset>
				<legend>Login</legend>
				<div class="form-group">
					<label for="userId" class="col-lg-2 control-label">User Id</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="userId" name="userId"
							placeholder="userId">
					</div>
				</div>		
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-default">Cancel</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</fieldset>
</form>

<a href="${pageContext.request.contextPath}/front?key=sales&methodName=selectSales" class="btn btn-danger">매출확인하기</a><p>

<a href="${pageContext.request.contextPath}/front?key=sales&methodName=selectBrandSalesByMonth&brand=프라다" class="btn btn-danger">프라다</a><p>
<a href="${pageContext.request.contextPath}/front?key=sales&methodName=selectBrandSalesByMonth&brand=디올" class="btn btn-danger">디올</a><p>
<a href="${pageContext.request.contextPath}/front?key=sales&methodName=selectBrandSalesByMonth&brand=샤넬" class="btn btn-danger">샤넬</a><p>

<button onclick="location.href='${pageContext.request.contextPath}/front?key=sales&methodName=selectSalesRatesBrand'">판매량 확인하기</button>

<hr>

<%-- <form name ="alarm" action="${pageContext.request.contextPath}/front"> --%>
<!-- <input type="hidden" name="key" value = "alarm" /> -->
<!-- <input type="hidden" name="methodName" value = "insertAlarm" />   -->
<!-- 상품번호<input type="text" id="goodsNo" name="goodsNo"><p> -->
<!-- 알람제목<input type="text" id="alarmSubject" name="alarmSubject"><p> -->
<!-- 알람내용<input type="text" id="alarmContent" name="alarmContent"><p> -->
<!-- <button type="submit">알람등록</button> -->
<!-- </form> -->
<%-- <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/front">
			<input type="hidden" name="key" value = "alarm" /> Controller를 찾는 정보
			<input type="hidden" name="methodName" value = "selectAlarm" />  메소드이름
			<fieldset>
				<legend>Login</legend>
				<div class="form-group">
					<label for="userId" class="col-lg-2 control-label">User Id</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="userId" name="userId"
							placeholder="userId">
					</div>
				</div>		
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-default">Cancel</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</fieldset>
</form>
--%>

<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/front">
			<input type="hidden" name="key" value = "alarm" /> Controller를 찾는 정보
			<input type="hidden" name="methodName" value = "checkNewAlarm" />  메소드이름
			<fieldset>
				<legend>Login</legend>
				<div class="form-group">
					<label for="userId" class="col-lg-2 control-label">User Id</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="userId" name="userId"
							placeholder="userId">
					</div>
				</div>		
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-default">Cancel</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</fieldset>
</form>


</body>
</html>