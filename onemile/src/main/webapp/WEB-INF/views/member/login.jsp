<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form method="post">
<div class="container-400 container-center">
	<div class="row center">
		<h1>회원 로그인</h1>
	</div>
	<div class="row"> 
		<label>아이디</label>
		<input type="text" name="email" required class="form-input" 
				autocomplete="off" value="${cookie.saveId.value}">
	</div>
	<div class="row">
		<label>비밀번호</label>
		<input type="password" name="pw" required class="form-input">
	</div>
	<ul class="row">
        <li><a href="${root}/member/find_id">아이디 찾기</a></li>
        <li><a href="${root}/member/find_pw">비밀번호 찾기</a></li>
        <li><a href="${root}/member/join">회원가입</a></li>
    </ul>

	<div class="row">
		<label>
			<c:choose>
				<c:when test="${cookie.saveId == null}">
					<input type="checkbox" name="saveId">
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="saveId" checked>
				</c:otherwise>
			</c:choose>
			아이디 저장
		</label>
	</div>
	
	<div class="row right">
		<input type="submit" value="로그인" class="form-btn form-inline">
	</div>
	
	<c:if test="${param.error != null}">
	<div class="row center"> 
		<h4 class="error">로그인 정보가 일치하지 않습니다</h4>
	</div>
	</c:if>
</div>

</form>