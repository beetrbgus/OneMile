<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h1>주문서 확인</h1>
	${confirmVO.productNo} /
	<input type="hidden" value="${sessionScope.logNo}">
	<input type="hidden" value="${sessionScope.logId}">
	<input type="hidden" value="${confirmVO.quantity}">
	<input type="hidden" name="totalAmount" value="${confirmVO.price}">
	<input type="hidden" value="${confirmVO.productName}">
	<input type="hidden" name="type" value="정기">
	
	<div>
		${confirmVO.productNo}	/ ${confirmVO.productName} / ${confirmVO.price} / ${confirmVO.quantity}
	</div> 
	
	
	
	
	
<form action="confirm" method="POST">
	<input type="hidden" name="productNo" value="${confirmVO.productNo}">
	<input type="hidden" name="quantity" value="${confirmVO.quantity}">
	<button type="button" id="btn-submit" onclick="purchaseReservation()" class="wz primary button">결제하기</button>
</form>