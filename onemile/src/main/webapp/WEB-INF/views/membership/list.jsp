<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h1>결제 테스트</h1>

<c:forEach var="membershipDTO" items="${list}">
	
	<input class="productNo" name="isselect" type="radio" value="${membershipDTO.mspNo}">
	
	${membershipDTO.mspNo} / ${membershipDTO.mspProduct}  / ${membershipDTO.mspPrice}
</c:forEach>
<button id="submitBtn" type="button">구매하기</button>
<form id="submitForm"action="${pageContext.request.contextPath}/membership/confirm"
	method="get">
	<input id="productNo" type="hidden" name="productNo" value="">
	<input name="quantity" type="hidden" value="1">
</form>

<script>
$(function(){
	$("input[name='isselect']:radio").change(function () {
        //라디오 버튼 값을 가져온다.
        var no = this.value;
        $("#productNo").val(no);
	});
	$("#submitBtn").on("click",function(){
		
		$("#submitForm").submit();
	});
});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>