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
	<p>${detail.title}</p> 
	<p>${detail.deadLine}</p> 
	<p>${detail.customerCnt}</p>
	<p>${detail.stock}</p>
	<input type="number" name="stock" min="0">
	<p>${detail.title}</p>
	<p>${detail.deadLine}</p>
	<p>${detail.title}</p>
	<p>${detail.deadLine}</p>
	<p>${detail.title}</p>
	<p>${detail.deadLine}</p>

zzzzzzzzzzzzzzzzzz
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>