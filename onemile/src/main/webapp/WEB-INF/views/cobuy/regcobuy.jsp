<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);
</script>
<form method="post" enctype="multipart/form-data">
	<input type="file" name="attach"> <input type="text"
		name="title" placeholder="공구의 제목을 입력해주세요."> 만료 기한 : <input
		type="date" min="2022-01-01" name="deadLine"> 가격 : <input
		type="number" name="price"> 수량 : <input type="number"
		name="stock"> 상품 이름 : <input type="text" name="pName">
	상품 설명 :
	<textarea name="descript" placeholder="상품 정보를 입력해주세요."></textarea>
	<input type="file" name="attach" multiple="multiple">
	<div id="map" style="width: 500px; height: 400px;"></div>
	

	<button type="submit">전송한다</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>