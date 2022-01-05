<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	<input type="hidden" name="cobuyNo" value="${detail.getCobuyNo()}">
	<input type="text" name="cobuyNo" value="${detail.getCobuyNo()}">
	<!-- 대표 이미지 , 나머지 이미지 -->
	<!-- 상품 테이블 -  제목 , 마감기한 , 구매자 명수 , 가격  
	상품 설명 , 상품 이미지 나머지. -->
	<!-- 판매자 테이블 - 프로필 사진 ,회원번호 닉네임 , 이메일  , 전화 -->
	<!-- 지도 테이블 - 위도,경도 ,상세주소 -->
	<p>${detail.imageList[0]}</p>
	<!-- 상품 영역 -->
	<p>${detail.title}</p> 
	<p>${detail.deadLine}</p> 
	<p>${detail.customerCnt}</p>
	<p>${detail.stock}</p>
	<p>${detail.PName}</p>
	<p>${detail.descript}</p>
	<form action="buy" method="post">
		<input type="number" name="stock" min="0">
		<input type="hidden" name="cobuyNo" value="${detail.getCobuyNo()}">
		<input type="hidden" name="memberNo" value="${detail.memberNo}">
		<button type="submit">구매하기</button>
	</form>
	<p>상품에 문제가 있나요? <a>신고하기</a></p>
	
	<!-- 판매자 영역 -->
	<p>${detail.memberImageNo}</p>
	<p>${detail.nick}</p>
	<p>${detail.email}</p>
	<p>${detail.phone}</p>
	<!-- 지도 영역 -->
	<p>${detail.lat}</p>
	<p>${detail.lng}</p>
	<p>수령 장소 :  ${detail.detailAddress}</p>
	<p>${detail.lat}</p>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 1
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	infowindow = new kakao.maps.InfoWindow({
		zindex : 1
	}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>