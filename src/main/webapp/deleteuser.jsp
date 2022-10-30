<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>탈퇴하기</title>
<script type="text/javascript">
$(function(){
	if($("#deleteBtn").submit(function(){
		if(!confirm("정말 탈퇴하겠습니까?")){
			return false
		}
	}));
	
})

</script>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form
				action="${pageContext.request.contextPath}/front?key=user&methodName=deleteUser"
				method="post" id = "deleteForm">
				<div class="w3-center w3-large w3-margin-top">
					<h3>탈퇴하기</h3>
				</div>
				<div>
						<input type="hidden" id="userId" name="userId" readonly value ="${loginUser.userId }">
							<p>
						<label>Password</label> <input class="w3-input" type="text"
							id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요." required>
					</p>
					<p class="w3-center">
						<button type="submit" id="deleteBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원탈퇴</button>
						<button type="button" onclick="history.go(-1);"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>