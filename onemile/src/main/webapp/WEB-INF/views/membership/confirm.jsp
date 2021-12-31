<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>결제할 상품 정보 확인</h1>
<form action="confirm" method="POST">
<c:forEach var="membershipDTO" items="${list}">
	<input type="hidden" name="mspNo" value="${membershipDTO.mspNo}">
	<input type="hidden" name="partner_user_id" value="${sessionScope.logId}">
	<input type="hidden" name="total_amount" value="${membershipDTO.mspPrice}">
	
	<div>
		${membershipDTO.mspNo}	 / ${membershipDTO.mspProduct} / ${membershipDTO.mspPrice}
	</div>
<input type="submit" value="결제하기">
</c:forEach>

</form>