<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>결제 내역</h1>

<form action="confirm" method="get">
<c:forEach var="ProductBuyDTO" items="${list}">
	<div>
		${ProductBuyDTO.itemName} / ${ProductBuyDTO.totalAmount} / ${ProductBuyDTO.buyTime} / ${ProductBuyDTO.status}
		${ProductBuyDTO.pbNo} / ${ProductBuyDTO.productNo} / ${ProductBuyDTO.status}
		 <c:if test="${ProductBuyDTO.status != '결제취소'}">
		<a href="${pageContext.request.contextPath}/pay/cancel_part?pbNo=${ProductBuyDTO.pbNo}&productNo=${ProductBuyDTO.productNo}">해당항목 취소</a>
		
		</c:if>
	</div>
</c:forEach>
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>