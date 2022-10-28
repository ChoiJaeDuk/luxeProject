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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

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
</style>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	//인수받기(test)
	let chanel = [ "징거버거", "타워버거", "불고기버거" ]
	let dior = [ "라이스버거", "데리버거", "새우버거", "한우버거", "치즈버거" ]
	let prada = [ "1997버거", "맥모닝", "빅맥", "베이컨버거", "치킨버거" ]

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
					  <a href="../index.jsp">HOME</a>
					  <a href="#">STYLE</a>
					  <a href="../shop/shop.jsp">SHOP</a>
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
					  <button class="tablinks"  id="defaultOpen" onclick="openBrand(event, 'all')">ALL</button>
					  <button class="tablinks" onclick="openBrand(event, 'chanel')">CHANEL</button>
					  <button class="tablinks" onclick="openBrand(event, 'dior')">DIOR</button>
					  <button class="tablinks" onclick="openBrand(event, 'prada')">PRADA</button>
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
						<option value="none" selected="selected">정렬</option> 
						<option value="like">LIKE</option>
						<option class="view">VIEW</option>
						<option class="update">UPDATE</option>							  
					</select>
					
				</div>
				
				<div id='all' class="gallery">
					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->

					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="디올이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="디올이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="디올이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="디올이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->
					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->


				</div><!-- all -->
				
				<div id='chanel' class="gallery">
					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->

					
					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="../img/product01.webp" alt="스타일이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->

				</div><!-- 샤넬 -->
				
				<div id='dior' class="gallery">
					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="스타일이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="스타일이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->

					
					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="스타일이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="스타일이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="스타일이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->
				</div>
				
				
				<!-- 디올 -->
				
				<div id='prada' class="gallery">
					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->

					
					<div class="gallery-row">
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>

						<div class='gallery-fram'>
							<div class='gallery-card'>
								<div id=gallery-con onclick='showPopup(false)'>
									<img id="card-img" src="" alt="프라다이미지" />
								</div>
							</div>
						</div>
					</div><!-- gallery-row -->

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
   					 <div class="select-tap"">
					    <div class="text"><i class="bi bi-list" style="font-size: 25px;"></i></div>
					    <ul class="option-list">
					      <li class="option">삭제</li>
					      <li class="option" onclick="showInsertform()">수정</li>
					    </ul>
					  </div>
   					</div>						
   				</div>
   				<div id='popup-img'>
   					<img src="../img/product01.webp" alt="스타일이미지"/>
   				</div>
   				<div id='popup-like'>
   					<div id='popup-like-con'>
   					<img id=like_img src='../img/icon/favorite02.png' style="width: 20px; height: 20px;">
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
						<textarea class="form-control" id="exampleTextarea" rows="8"></textarea>
					</div>
				</div>
				<div id='insert-submt'>
					<input type="submit" value="수정" id='submitBtn'>
					<button onclick="closeUpdateform()" id='closeBtn'>취소</button>
				</div>
			</div>
		</form>
	</div>
</div>
	<script type="text/javascript">
	function showPopup(hasFilter) {
		const popup = document.querySelector('#popup');
		  
		  if (hasFilter) {
		  	popup.classList.add('has-filter');
		  } else {
		  	popup.classList.remove('has-filter');
		  }
		  
		  popup.classList.remove('hide');
		}
		
		function closePopup() {
			const popup = document.querySelector('#popup');
		  popup.classList.add('hide');
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
		function showInsertform(hasFilter){
			const insert = document.querySelector('#update-pop');
			  
			  if (hasFilter) {
				  insert.classList.add('has-filter');
			  } else {
				  insert.classList.remove('has-filter');
			  }
			  
			  insert.classList.remove('hide');
			}
			
			function closeUpdateform() {
				const insert = document.querySelector('#update-popㄴ');
				insert.classList.add('hide');
			}
	
	//좋아요
	function likeEvent() {
		let like = document.querySelector("#like");
		like.classList.toggle("active");
	}
	
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
	</script>
	<script>

        var i = 0;
        $('#like_img').on('click',function(){
            if(i==0){
                $(this).attr('src','../img/icon/favorite01.png');
                i++;
            }else if(i==1){
                $(this).attr('src','../img/icon/favorite02.png');
                i--;
            }

        });
    </script>
</body>
</html>