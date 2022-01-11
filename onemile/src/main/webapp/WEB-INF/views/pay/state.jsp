<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row mt-3">
	<div class="col">
		<h2>결제코드 : ${state.sid}</h2>
		<h2>상품 : ${state.item_name}</h2>
		<h2>시작날짜 : ${state.created_at}</h2>
		<h2>정기결제 상태 : 
			<c:if test="${state.status eq 'ACTIVE'}">
				진행중
			</c:if>
		</h2>
	</div>
	</div>
</div>