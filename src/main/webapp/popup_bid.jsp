<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
button {
  height: 2.5em;
  cursor: pointer;
}

#popup {
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, .7);
  z-index: 1;
}

#popup.hide {
  display: none;
}

#popup.has-filter {
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
}

#popup .content {
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}
</style>

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
</script>
</head>
<body>
<button onclick="showPopup(false)">필터없는 팝업창 보기</button>

<div id="popup" class="hide">
  <div class="content">
    <p>

      <form name="writeForm" method="post" action="${pageContext.request.contextPath}/front?key=goods&methodName=insertGoods"
	enctype="multipart/form-data">
	brand<input type="text" name="brand" size="30"><p>
	category<input type="text" name="category" size="30"><p>
	goodsName<input type="text" name="goodsName" size="30"><p>
	goodsNamekor<input type="text" name="goodsNameKor" size="30"><p>
	goodsModelNo<input type="text" name="goodsModelNo" size="30"><p>
	releaseDate<input type="text" name="goodsReleaseDate" size="30"><p>
	releasePrice<input type="text" name="goodsReleasePrice" size="30"><p>	

   <input type="file" name="goodsMainImg" maxlength="60" size="40">
  
	<input type="submit" value="보내!">
	
	<a href="${pageContext.request.contextPath}/front?key=sell&methodName=selectSellAll"> tttt</a>
	<c:forEach items="${sellAllList}" var="s">
		<p>${s.sellPrice}<p>
		${s.sellNo}<p>
		
	</c:forEach>
</form>
    </p>
    <button onclick="closePopup()">닫기</button>
  </div>
</div>
</body>
</html>