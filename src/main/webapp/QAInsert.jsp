<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script src="../js/jquery-3.6.1.min.js"></script>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form
				action=""
				method="post" id = "Qainsert">
				<div class="w3-center w3-large w3-margin-top">
					<h3>상품등록문의</h3>
				</div>
				<div>
				<label>ID</label>
				<input type="text" class="w3-input" id="userId" name="userId" readonly="readonly" placeholder="${loginUser.userId }" value ="${loginUser.userId }" >
							
				<label>브랜드명</label> 
				<input class="w3-input" type="text" id="insertBrand" name="insertBrand" placeholder="브랜드명을 입력하세요." required>
				
				<label>상품명</label> 
				<input class="w3-input" type="text" id="insertProductName" name="insertProductName" placeholder="상품명을 입력하세요." required>
					
					<p class="w3-center">
						<button type="submit" id="insertBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">등록</button>
						<button type="button" onclick="history.go(-1);"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>