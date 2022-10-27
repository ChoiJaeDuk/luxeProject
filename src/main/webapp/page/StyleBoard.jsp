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
<link rel="stylesheet" type="text/css" href="../css/page/StyleBoard.css">
<style type="text/css">
</style>
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
					  <button class="tablinks"  id="defaultOpen" onclick="openBrand(event, 'all')">ALL</button>
					  <button class="tablinks" onclick="openBrand(event, 'chanel')">CHANEL</button>
					  <button class="tablinks" onclick="openBrand(event, 'dior')">DIOR</button>
					  <button class="tablinks" onclick="openBrand(event, 'prada')">PRADA</button>
					</div>
					
					<!-- 글쓰기 -->
					<div class='gallery-insert' >
						<button id='gallery-insertbtn' onclick='insertForm(false)'>글쓰기</button>
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
   					 <div class="select-tap">
					    <div class="text">선택</div>
					    <ul class="option-list">
					      <li class="option">선택</li>
					      <li class="option">삭제</li>
					      <li class="option">수정</li>
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
	function insertForm(hasFilter) {
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
</body>
</html>