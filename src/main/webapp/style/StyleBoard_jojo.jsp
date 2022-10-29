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
font-family: 'Noto Sans KR', sans-serif;
font-family: 'Roboto', sans-serif;
font-family: 'Lora', serif;

  -->


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

<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="../css/setting/Reset.css">
<link rel="stylesheet" type="text/css" href="../css/setting/Layout.css">
<link rel="stylesheet" type="text/css" href="../css/style/StyleBoard.css">
<style type="text/css">
.gallery-card img{
width: 300px; height: 300px;
}
</style>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	//인수받기(test)
	let chanel = ["징거버거", "타워버거", "불고기버거"];
	let dior = ["라이스버거", "데리버거", "새우버거", "한우버거", "치즈버거"];
	let prada = ["1997버거", "맥모닝", "빅맥", "베이컨버거", "치킨버거"];

	function subMenu(th) {

		let arr = new Function("return " + th.value)();
		let product = document.f.menu;

		//옵션제거
		while (product.length > 1) {
			product.options[1] = null;
		}

		//옵션추가
		for (let i = 0; i < arr.length; i++) {
			product.options[product.length] = new Option(arr[i], arr[i])
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#changeProduct").change(function() {
			$("#changeInput").val($(this).val());
		});
	});
</script>
</head>
<body>
	<div id='wrap'>
	
		<div id='header'>
				<div id='header-top'>
					<div id='header-top-menu'>
						<a href="">마이페이지</a>
						<a href="">관심상품</a>
						<a href="">로그인</a>
						<a href="" class='managermode'>관리자모드</a>
					</div>		
				</div><!--header-top -->
				
				<div id='header-bottom'>
				    <div class="topnav">
				    <div id='logo'>
				    	LUXE
					</div>
					  <a href="#">HOME</a>
					  <a href="#news">STYLE</a>
					  <a href="#contact">SHOP</a>
					  <div class="split">
					  	<input class="nav-search" type="text" name="search">
					  </div>
					</div>
				</div>									
		</div><!-- header -->
		<div class="clear"></div>
		
		<div id="banner">
			<div class="banner_img">
				<img alt="배너이미지입니다." src="">
			</div>
		</div>
		<div class="clear"></div>
		
		
		<div id='contents'>
			<div class="container">
				<div id='con'>
				<div class="title">
					<div id="main_title">STYLE</div>
				</div>
				
				<div class='tap-box'>
					<div class="tab">
					  <button class="tablinks"  id="defaultOpen"  name='all'>ALL</button>
					  <button class="tablinks"  name="샤넬">샤넬</button>
					  <button class="tablinks"  name="디올">디올</button>
					  <button class="tablinks"  name="프라다">프라다</button>
					</div>
					
					<!-- 글쓰기 -->
					<div class='gallery-insert' >

						<form name="f" id='getProductCode'>
							<select name="brandSelect" id='brandSelect' onchange="subMenu(this)">
								<option value="0">BRAND</option>
								<option value="chanel">CHANEL</option>
								<option value="dior">DIOR</option>
								<option value="prada">PRADA</option>
							</select> <select name="menu" id='changeProduct'>
								<option value="0">PRODUCT-SELECT</option>
							</select>
							<button id='gallery-insertbtn' type="button" onclick="showInsertform(false)">글쓰기</button>
						</form>
					</div>
					
					<!-- 정렬 -->
					<select class="select">
						<option value="" selected="selected">정렬</option> 
						<option value="like_no">LIKE</option>
						<option value="read_no">VIEW</option>
						<option value="board_reg_date">UPDATE</option>							  
					</select>
					
				</div>
				
				<div id='all' class="gallery">
					
				</div><!-- all -->
				
				<div id='샤넬' class="gallery">
	
				</div><!-- 샤넬 -->
				
				<div id='디올' class="gallery">
					
				</div>
				
				
				<!-- 디올 -->
				
				<div id='프라다' class="gallery">
				
				</div>
				<!-- 프라다 -->
				</div><!-- con -->
			</div><!-- container -->
		</div><!-- contents -->
		<div class="clear"></div>
		
		<div id='footer'>
			<div id='footer-textbox'>
				<h5>고객센터 1588-1588</h5>
				<p>운영시간 평일 11:00-18:00(토,일,공휴일휴무)<br>
				점심시간 평일 13:00-14:00</p>
				<h6>주소 : 경기도 성남시 분당구 오리역 16번출구</h6>
				<p>LUXE(주)는 통신판매 중개자로서 통신판매의 당사자가 아니므로 개별 판매자가 등록한 상품정보에 대해서 책임을 지지 않습니다.
				<br>단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다</p>
			</div>
		
		
		</div>
		
	</div>
	<div id="popup" class="hide">
  		<div class="popup-form">
   			<div id='popup-contents'>
   				<div id='popup-title'>
   					<img src="../img/icon/userphoto_icon.png" style="width: 60px; opacity: 0.8; float: left;"/>
   					<div id='popup-title-text'>
   						<h4>작성자이름</h4>
   						<p>날짜</p>
   					</div> 
   					<div id='drop-btn'>
   					 <div class="select-tap">
					    <div class="text">선택</div>
					    <ul class="option-list" style="visibility: hidden;">
					      <li class="option">선택</li>
					      <li class="option">삭제</li>
					      <li class="option" onclick="showUpdateform()">수정</li>
					    </ul>
					  </div>
   					</div>					
   				</div>
   				<div id='popup-img'>
   					<img src="../img/product01.webp" alt="스타일이미지"/>
   				</div>
   				<div id='popup-like'>
   					<div id='popup-like-con'>
   					<img src='../img/icon/favorite01.png' style="width: 20px; height: 20px;">
   						<span>좋아요</span>
   						<span style="font-family: 'Roboto', sans-serif;">0</span>
   						<span>개</span>
   					</div>
   				</div>
   				<div id='popup-text'>
   					<p style="width: 100%; overflow: hidden;">내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다s</p>
   				</div>
   				<div id='popup-tag'>
   					<span>#모델번호</span> <span>#상품명</span> <span>#브랜드</span>
   				</div>
   				<div id='popup-close'>
   					<button onclick="closePopup()">닫기</button>
   				</div>
   			</div>
 		</div>
	</div>
	
	<div id="insert-pop" class="hide">
	<div id='insert-contents'>
		<form id='insert-form' name="writeForm" method="post" action="">
			<div id='productImg'>
				<img src="../img/product01.webp" alt="상품이미지" />
			</div>

			<div id='insert-con'>
				<div id='insert-title-text'>
					<span>이름</span><input type="text" class="form-control"
						placeholder="이름" readonly="readonly"> <span>상품이름</span><input
						type="text" class="form-control" placeholder="상품이름"
						id='changeInput' readonly="readonly"> <span>상품코드</span><input
						type="text" class="form-control" placeholder="상품코드"
						readonly="readonly">
				</div>


				<div id='insert-text'>
					<div class="form-group">
						<span>내용</span>
						<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
					</div>
				</div>

				<div id='insertImg'>
					<span>스타일업로드</span> <input class="form-control" type="file"
						id="formFile">
				</div>


				<div id='insert-submt'>
					<input type="submit" value="등록" id='submitBtn'>
					<button onclick="closeInsertform()" id='closeBtn'>취소</button>
				</div>
			</div>
		</form>
	</div>
</div>
	
<div id="update-pop" class="hide">
	<div id='update-contents'>
		<form id='update-form' name="writeForm" method="post" action="">
			<div id='update-productImg'>
				<img src="../img/product01.webp" alt="상품이미지" />
			</div>

			<div id='update-con'>
				<div id='update-title-text'>
					<span>이름</span><input type="text" class="form-control"
						placeholder="이름" readonly="readonly"> <span>상품이름</span><input
						type="text" class="form-control" placeholder="상품이름"
						id='changeInput' readonly="readonly"> <span>상품코드</span><input
						type="text" class="form-control" placeholder="상품코드"
						readonly="readonly">
				</div>


				<div id='update-text'>
					<div class="form-group">
						<span>내용</span>
						<textarea class="form-control" id="update-exampleTextarea" rows="8"></textarea>
					</div>
				</div>
				<div id='update-submt'>
					<input type="submit" value="수정" id='update-submitBtn'>
					<button onclick="closeUpdateform()" id='update-closeBtn'>취소</button>
				</div>
			</div>
		</form>
	</div>
</div>	
	
	<script type="text/javascript">
	function showPopup(hasFilter, th) {
		
		const popup = document.querySelector('#popup');
		  
		  if (hasFilter) {
		  	popup.classList.add('has-filter');
		  } else {
		  	popup.classList.remove('has-filter');
		  }
		  
		  popup.classList.remove('hide');
		  
		let img = th.firstChild;
		let boardNo = img.getAttribute("name");
		
		$.ajax({
			url :"../ajax" , //서버요청주소
			type:"post", //요청방식(method방식 : get | post | put | delete )
			dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			data: {key:"styleBookAjax" , methodName : "selectStyleBook", boardRegNo:boardNo}, //서버에게 보낼 데이터정보(parameter정보)
			success :function(styleBook){
				$("#popup-img > img").attr("src", "${path}/stylebook/"+styleBook.fName);
				$("#popup-title-text").html('');
				let str = '';
				
				str += "<h4>"+styleBook.userId+"</h4>";
				str += "<p>"+styleBook.boardRegDate+"</p>";
				
				$("#popup-title-text").html(str);
				
				$("#popup-like-con span:nth-child(3)").text(styleBook.likeNo);
				
				$("#popup-text > p").text(styleBook.boardContent);
				
				$("#popup-tag").html('');
				let str2 = '';
				str2 += "<span>#"+styleBook.modelNo+"</span> ";
				str2 += "<span>#"+styleBook.brand+"</span> ";
				str2 += "<span>#"+styleBook.goodsName+"</span> ";
				str2 += "<span>#"+styleBook.goodsNameKor+"</span>";
				str2 += "<span id='boardRegNo' style='display:none'>"+styleBook.boardRegNo+"</span>";
				
				$("#popup-tag").html(str2);
				
			} , //성공했을때 실행할 함수 
			error : function(err){  
				alert(err+"에러 발생했어요.");
			}  //실팽했을때 실행할 함수 
		});
	}
		
		function closePopup() {
			const popup = document.querySelector('#popup');
		  popup.classList.add('hide');
		  $(".option-list").css("visibility", "hidden");
		}
	
	//등록
	function showInsertform(hasFilter){
		const insert = document.querySelector('#insert-pop');
		  
		  if (hasFilter) {
			  insert.classList.add('has-filter');
		  } else {
			  insert.classList.remove('has-filter');
		  }
		  
		  insert.classList.remove('hide');
		}
		
		function closeInsertform() {
			const insert = document.querySelector('#insert-pop');
			insert.classList.add('hide');
		}
		
		
	//수정
	function showUpdateform(hasFilter){
		if(confirm("게시물을 수정하시겠습니까?")){
		const insert = document.querySelector('#update-pop');
		  
		  if (hasFilter) {
			  insert.classList.add('has-filter');
		  } else {
			  insert.classList.remove('has-filter');
		  }
		  
		  insert.classList.remove('hide');
		} else 
			return;
		
		}
		
		function closeUpdateform() {
			const insert = document.querySelector('#update-pop');
			insert.classList.add('hide');
			
			
		}
		
	//좋아요
	/* function likeEvent() {
		let like = document.querySelector("#like");
		like.classList.toggle("active");
	} */
	
	//드롭다운
	function onClickSelect(e) {
	  const isActive = e.currentTarget.className.indexOf("active") !== -1;
	  if (isActive) {
	    e.currentTarget.className = "select-tap";
	  } else {
	    e.currentTarget.className = "select-tap active";
	  }
	}
	
	document.querySelector("#drop-btn .select-tap").addEventListener("click", onClickSelect);
	
	function onClickOption(e) {
	  const selectedValue = e.currentTarget.innerHTML;
	  document.querySelector("#drop-btn .text").innerHTML = selectedValue;
	}
	
	var optionList = document.querySelectorAll("#drop-btn .option");
	for (var i = 0; i < optionList.length; i++) {
	  var option = optionList[i];
	  option.addEventListener("click", onClickOption);
	}
	
	
	/* 브랜드탭 */
	function openBrand(evt, brandName) {
		var brand = brandName;
		  var i, gallery, tablinks;
		  gallery = document.getElementsByClassName("gallery");
		  for (i = 0; i < gallery.length; i++) {
			  gallery[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(brandName).style.display = "block";
		  evt.currentTarget.className += " active";
				
	}
	document.getElementById("defaultOpen").click();
	


	$(function() {
		
		//let sortCondtion=

		function selectAllStyleBook (brand, goodsNo, sortCondition) {
			
			if(brand=='all'){
				brand="";
			}
			
			if(goodsNo==null || goodsNo =="") {goodsNo=0;}
			if(sortCondition==null) {sortCondition=""};
			$.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"styleBookAjax" , methodName : "selectAllStyleBook", brand:brand, goodsNo, sortCondition:sortCondition}, //서버에게 보낼 데이터정보(parameter정보)
				success :function(styleBookList){
					
					$(".gallery").html('');
					
					let str="";
					$.each(styleBookList, function(index, styleBook) {							
						if((index%4)==0)	{
							str += `<div class="gallery-row">`;
						}
						str += `<div class='gallery-fram'>`;
						str+=`<div class='gallery-card'>`;
						str+=`<div id=gallery-con onclick='showPopup(false, this)' name='gallery-con'>`;
						str+=`<img id=${"${styleBook.boardRegNo}"} src="${path}/stylebook/${"${styleBook.fName}"}" name=${"${styleBook.boardRegNo}"} alt="스타일이미지" class="styleBookImg"/>`;
						str+=`</div></div></div>`;
						
						if(index!=0 && ((index+1)%4)==0 || (index+1)==styleBookList.length){
							str +=`</div>`;
						}

					});
					let b="";
					if(brand==null || brand=="") b="#all";
					else b="#"+brand
					$(b).html(str);
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});
		}
		
		let brand="all";
		let sortConditon = "";
		$("button[class=tablinks]").click(function() {
			brand = $(this).attr("name");
			openBrand(event, brand);
			selectAllStyleBook(brand, 0, "");	
			
		});
		
		
		$(".select").on("change", function() {
			sortConditon = $(this).val();
			if(sortConditon=="") {
				return false;
			}
			console.log(sortConditon);
			selectAllStyleBook(brand, 0, sortConditon);
		});
		
		/* $(window).ready(function() {
			$("#defaultOpen").click();
		}); */
		
		<%session.setAttribute("userId", "ID");%>
		$("#drop-btn > div").on("click", function() {
			let id = $("#popup-title-text > h4").text();
			console.log(id);
			if(id=="${sessionScope.userId}"){
				$(".option-list").css("visibility", "visible");
			} else {
				$(".option-list").css("visibility", "hidden");
				return;
			}
			
		});
		$(window).ready(function() {
			$("#defaultOpen").click();
		});
		
		$(".option").on("click", function() {
			let option = $(this).text();
			if(option =='선택')
				return;
			else if (option=='삭제')
				deleteStyleBook();
			//else if (option == '수정')
				//updateStyleBook();
		})
		
		function deleteStyleBook() {
			if(confirm("게시물을 삭제하시겠습니까?")){
				closePopup();
				let boardRegNo = $("#boardRegNo").text();
				
				$.ajax({
					url :"../ajax" , //서버요청주소
					type:"post", //요청방식(method방식 : get | post | put | delete )
					dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data: {key:"styleBookAjax" , methodName : "deleteStyleBook", boardRegNo:boardRegNo}, //서버에게 보낼 데이터정보(parameter정보)
					success :function(result){
						alert("삭제에 성공했습니다.");
						//$("#drop-btn > div > div").text("선택");
						selectAllStyleBook(brand, 0, sortConditon);
					} , //성공했을때 실행할 함수 
					error : function(err){  
						alert(err+"에러 발생했어요.");
					}  //실패했을때 실행할 함수 
				});
			}
			else {
				$("#drop-btn > div > div").text("선택");
				return;
			}
			
		};
		
	/* 	function updateStyleBook() {
			if(confirm("게시물을 수정하시겠습니까?")){
				let boardRegNo = $("#boardRegNo").text();
			
				//$("#drop-btn > div > div").text("선택");
			} else{
				//$("#drop-btn > div > div").text("선택");
				return;
			}
				
		} */
		
		
		
		
	});
	
	
	</script>
</body>
</html>