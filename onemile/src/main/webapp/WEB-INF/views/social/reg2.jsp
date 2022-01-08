<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


제목 :
<input type="text" name="name">
<select class="big" name="type" required >
	<option value="">카테고리선택</option>
	<c:forEach var="category" items="${bigCategory}">
		<option value="${category.bigType}">${category.bigType}</option>
	</c:forEach>
</select>
<select class="middle" name="smalltype"></select>

소분류 :
<input type="text" name="smalltype">
설명 :
<input type="text" name="context">
시작일 :
<input type="text" name="stratDate">
종료일 :
<input type="text" name="endDate">
위도 :
<input type="text" name="lat">
경도 :
<input type="text" name="lng">
경도 :
<input type="text" name="detailaddress">
이미지 :
<input type="file" name="attach">

<div id="map" style="width: 500px; height: 400px;"></div>

<script>
	$(function(){
		$("select[name=type]").on("change",function(){
			var category = $(this).val();

			$.ajax({
			  url : "${pageContext.request.contextPath}/miles/data/category/child",
	  		  type : "post",
	  		  data : {
	  			  categorySuper : category
	  		  },
	  		  success : function(resp) {
	  			console.log("성공", resp);
	  			
	  			var middle = $(".middle");
	  			middle.children().remove();
	  			for (var dto of resp) {
					var middleOption = $("<option>");
					middleOption.val(dto.smallType);
					middleOption.text(dto.smallType);
					middle.append(middleOption);
				}
	  		  },
	  		  error : function(e) {
				  console.log("실패", e);
	  		  }
	  		});
		});
	});
</script>
<script>
	var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 2
	};
	//지도를 생성합니다.
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var markerPosition = new kakao.maps.LatLng(37.566826, 126.9786567);
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>