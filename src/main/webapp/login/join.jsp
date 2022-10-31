<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<!--
font-family: "Noto Sans KR", sans-serif;
font-family: "Roboto", sans-serif;
font-family: "Lora", serif;

  -->
  <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
  
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 템플릿요소 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="../css/setting/Reset.css">
<link rel="stylesheet" type="text/css" href="../css/setting/Layout.css">
<link rel="stylesheet" type="text/css" href="../css/login/join.css">
<style type="text/css">
</style>

<script type="text/javascript">
	//모든 공백 체크 정규식
	let empJ = /\s/g;
	//아이디 정규식
	let idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	// 비밀번호 정규식
	let pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	let nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 이메일 검사 정규식
	let mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	let phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
	
	

	$(document).ready(function() {
						//아이디 중복확인
						$("#idcheckbtn").click(function() {
											if ($("#userId").val() == "") {
												$("#useridCheck").text(
														"아이디를 입력하세요.");
												$("#useridCheck").css("color","red");

											} else if (idJ.test($("#userId").val()) != true) {
												$("#useridCheck").text("4~12자의 영문, 숫자만 사용 가능합니다.");
												$("#useridCheck").css("color","red");
											} else if ($("#userId").val() != "") {
												let userId = $("#userId").val();
												$.ajax({
															url : "../ajax", //어디로 보낼지 주소
															type : "post",
															dataType : "text", //중복체크 결과값 text로 받아오기
															data : {
																key : "userAjax",
																methodName : "userIdCheck" , userId : $("#userId").val()
															},
															success : function(result) {
																if(result=="true"){
																	alert("중복된 아이디 입니다. 다른 아이디를 입력해주세요")
																	$("#userId").focus();
																}else{
																	alert("사용가능한 아이디입니다.")
																	$("#userPwd").focus();
																}

															},
															error : function(err) {
																alert(err)
															}
														});//
											}//else if

										});//click

						$("form")
								.on(
										"submit",
										function() {
											let inval_Arr = new Array(8)
													.fill(false);
											if (idJ.test($("#userId").val())) {
												inval_Arr[0] = true;
											} else {
												inval_Arr[0] = false;
												alert("아이디를  확인하세요.");
												return false;
											}
											// 비밀번호가 같은 경우 && 비밀번호 정규식
											if (($("#userPwd").val() == ($("#userPwd2")
													.val()))
													&& pwJ.test($("#userPwd")
															.val())) {
												inval_Arr[1] = true;
											} else {
												inval_Arr[1] = false;
												alert("비밀번호를 확인하세요.");
												return false;
											}
											// 이름 정규식
											if (nameJ
													.test($("#userName").val())) {
												inval_Arr[2] = true;
											} else {
												inval_Arr[2] = false;
												alert("이름을 확인하세요.");
												return false;
											}
											// 이메일 정규식
											if (mailJ.test($("#userEmail")
													.val())) {
												console.log(phoneJ.test($(
														"#userEmail").val()));
												inval_Arr[4] = true;
											} else {
												inval_Arr[4] = false;
												alert("이메일을 확인하세요.");
												return false;
											}
											// 휴대폰번호 정규식
											if (phoneJ.test($("#userPhone")
													.val())) {
												console.log(phoneJ.test($(
														"#userPhone").val()));
												inval_Arr[5] = true;
											} else {
												inval_Arr[5] = false;
												alert("휴대폰 번호를 확인하세요.");
												return false;
											}

											//주소확인
											if (address.val() == "") {
												inval_Arr[7] = false;
												alert("주소를 확인하세요.");
												return false;
											} else
												inval_Arr[7] = true;

											//전체 유효성 검사
											let validAll = true;
											for (let i = 0; i < inval_Arr.length; i++) {
												if (inval_Arr[i] == false) {
													validAll = false;
												}
											}
											if (validAll == true) { // 유효성 모두 통과
												alert("어머 저건 꼭 사야해. luxe에 오신걸 환영합니다!~~.");
											} else {
												alert("정보를 다시 확인하세요.")
											}
										});

						$("#userId")
								.blur(
										function() {
											if (idJ.test($("#userId").val())) {
												console.log("true");
												$("#useridCheck").text("");
											} else {
												console.log("false");
												$("#useridCheck")
														.text(
																"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
												$("#useridCheck").css("color",
														"red");
											}
										});
						$("#userPwd").blur(
								function() {
									if (pwJ.test($("#userPwd").val())) {
										console.log("true");
										$("#pw_check").text("");
									} else {
										console.log("false");
										$("#pw_check").text(
												"4~12자의 숫자 , 문자로만 사용 가능합니다.");
										$("#pw_check").css("color", "red");
									}
								});

						//1~2 패스워드 일치 확인
						$("#userPwd2").blur(function() {
							if ($("#userPwd").val() != $(this).val()) {
								$("#pw2_check").text("비밀번호가 일치하지 않습니다.");
								$("#pw2_check").css("color", "red");
							} else {
								$("#pw2_check").text("");
							}
						});

						//이름에 특수문자 들어가지 않도록 설정
						$("#userName")
								.blur(
										function() {
											if (nameJ.test($(this).val())) {
												console.log(nameJ.test($(this)
														.val()));
												$("#name_check").text("");
											} else {
												$("#name_check")
														.text(
																"한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)");
												$("#name_check").css("color",
														"red");
											}
										});
						$("#userEmail").blur(function() {
							if (mailJ.test($(this).val())) {
								$("#email_check").text("");
							} else {
								$("#email_check").text("이메일 양식을 확인해주세요.");
								$("#email_check").css("color", "red");
							}
						});

						// 휴대전화
						$("#userPhone").blur(function() {
							if (phoneJ.test($(this).val())) {
								console.log(nameJ.test($(this).val()));
								$("#phone_check").text("");
							} else {
								$("#phone_check").text("휴대폰번호를 확인해주세요 ");
								$("#phone_check").css("color", "red");
							}
						});
					});

	//우편번호 찾기 버튼 클릭시 발생 이벤트
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백("")값을 가지므로, 이를 참고하여 분기 한다.
				let fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				let extraRoadAddr = ""; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== "" && data.apartment === "Y") {
					extraRoadAddr += (extraRoadAddr !== "" ? ", "
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== "") {
					extraRoadAddr = " (" + extraRoadAddr + ")";
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== "") {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);
				/*      let a = console.log(data.zonecode);
				   let b = console.log(fullRoadAddr);
				   
				   if(a == null || b = null){
				      alert("주소를 확인하세요.");
				      return false;
				   }   */

				$("[name=useroaddress]").val(data.zonecode);
				$("[name=userAddr]").val(fullRoadAddr);

				document.getElementById("useroaddress").value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById("userAddr").value = fullRoadAddr;

				//document.getElementById("userDeAddr").value = data.jibunAddress; 
			}
		}).open();
	}
</script>
</head>
<body>
	<div id="wrap">
	<jsp:include page="../layout/header.jsp" />
		<div class="clear"></div>


		<div id="contents">
			<div class="container">
				<div id="con">

					<form id="insert-form" name="writeForm" method="post" action="${pageContext.request.contextPath}/front?key=user&methodName=insertUser">

						<div id="insert-title-text">
							<h3>회원가입</h3>
							<div class="form-group mb-3">
								<label for="id">아이디</label> <input type="text"
									class="form-control" id="userId" name="userId" placeholder="ID" aria-label="Recipient"s username" aria-describedby="button-addon2">
								<button type="button" id="idcheckbtn" class="btn btn-primary">아이디 중복확인</button>
								<div class="eheck_font" id="useridCheck"></div>
							</div>


							<div class="form-group">
								<label for="pw">비밀번호</label> <input type="password"
									class="form-control" id="userPwd" name="userPwd"
									placeholder="PASSWORD">
								<div class="eheck_font" id="pw_check"></div>
							</div>
							<div class="form-group">
								<label for="pw2">비밀번호 확인</label> <input type="password"
									class="form-control" id="userPwd2" name="userPwd2"
									placeholder="Confirm Password">
								<div class="eheck_font" id="pw2_check"></div>
							</div>

							<div class="form-group">
								<label for="userName">이름</label> <input type="text"
									class="form-control" id="userName" name="userName"
									placeholder="Name">
								<div class="eheck_font" id="name_check"></div>
							</div>

							<div class="form-group">
								<label for="userEmail">이메일 주소</label> <input type="email"
									class="form-control" id="userEmail" name="userEmail"
									placeholder="E-mail">
								<div class="eheck_font" id="email_check"></div>
							</div>


							<div class="form-group">
								<label for="userPhone">휴대폰 번호("-"없이 번호만 입력해주세요)</label> <input
									type="tel" class="form-control" id="userPhone" name="userPhone"
									placeholder="Phone Number">
								<div class="eheck_font" id="phone_check"></div>
							</div>



							<div class="form-group">
							<label for="userPhone">주소</label><p>
								<input class="form-control" style="width: 40%; display: inline;"
									placeholder="우편번호" name="useroaddress" id="useroaddress"
									type="text" readonly="readonly">
								<button type="button" class="btn btn-default"
									onclick="execPostCode();">
									<i class="fa fa-search"></i> 우편번호 찾기
								</button>
							</div>

							<div class="form-group">
								<input class="form-control" style="top: 5px;"
									placeholder="도로명 주소" name="userAddr" id="userAddr"
									type="text"  />
							</div>


							<div class="form-group text-center">
							   <button type="button" class="btn btn-primary"  onclick="history.go(-1);">취소</button>
								<button type="submit" class="btn btn-primary">회원가입</button>
							</div>
						</div>

					</form>


				</div>
			</div>
			<!-- container -->
		</div>
		<!-- contents -->
		<div class="clear"></div>

		<jsp:include page="../layout/footer.jsp" />

	</div>
	<!-- 스크립트 -->
	<script type="text/javascript" src="StyleBoard.js"></script>
</body>
</html>