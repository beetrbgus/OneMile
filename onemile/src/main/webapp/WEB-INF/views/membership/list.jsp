<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>결제 테스트</h1>

<form action="${pageContext.request.contextPath}/membership/confirm" method="get">
<c:forEach var="membershipDTO" items="${list}">
<div>
		<input type="checkbox" name="mspNo" value="${membershipDTO.mspNo}">
	${membershipDTO.mspNo}	 / ${membershipDTO.mspProduct} / ${membershipDTO.mspPrice}
	
	</div>
</c:forEach>

<input type="submit" value="구매하기">
</form>