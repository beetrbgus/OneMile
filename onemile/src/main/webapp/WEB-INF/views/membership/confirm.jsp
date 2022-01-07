<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>결제할 상품 정보 확인</h1>
	${confirmVO.productNo} /
	<input type="hidden" value="${sessionScope.logNo}">
	<input type="hidden" value="${confirmVO.quantity}">
	<input type="hidden" value="${sessionScope.logId}">
	<input type="hidden" name="totalAmount" value="${confirmVO.price}">
	<input type="hidden" value="${confirmVO.productName}">
	총 가격 : <input type="text" readonly value="totalAmount">
	<input type="hidden" name="type" value="정기">
	<div>
		${confirmVO.productNo}	/ ${confirmVO.productName} / ${confirmVO.price}
	</div> 
<form action="confirm" method="POST">
	<input type="hidden" name="productNo" value="${confirmVO.productNo}">
	<input type="hidden" name="quantity" value="${confirmVO.quantity}">
	
	<button type="submit">전송하세요~~~</button> 
</form>