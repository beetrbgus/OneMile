<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 출력 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h2>회원 정보 수정</h2>

<form method="post">
	
	<div class="container-400 container-center">
		<div class="row center">
        <h2>회원정보 수정</h2>
    </div>
		<div class="row">
			<label>이메일</label>  
			<input type="email" name="email" required class="form-input" value="${memberDTO.email}" readonly>
		</div>
		<div class="row">
			<label>닉네임</label>
			<input type="text" name="nick" required class="form-input" value="${memberDTO.nick}">
		</div>
		<div class="row">
			<label>휴대전화</label>
			<input type="tel" name="phone" required class="form-input" autocomplete="off" value="${memberDTO.phone}">
		</div>
		<div class="row">
			<label for="birth">생년월일</label>
			<input type="date" name="birth" required class="form-input"autocomplete="off">
		</div>
		<div class="row">
			<button class="snap-sync-btn-submit">수정</button>
		</div>
	
	</div>
</form>

<c:if test="${param.error != null}">
<h4><font color="red">비밀번호가 일치하지 않습니다</font></h4>
</c:if>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>