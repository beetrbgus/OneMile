<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.link-btn-block {
	width: 100%;
	padding: 10px;
	border: 1px solid gray;
	text-decoration: none;
	color: gray;
	text-align: center;
}
</style>

<div class="container center-block"
	style="width: 20%; margin-top: 100px">
	<div class="row mt-5" style="text-align: center">
		<h2 class="wz text display2">회원가입 완료</h2>
	</div>
	<div class="row" style="margin-top: 30px">
		<p>${joinId}님</p>
		<p>
			<br>원마일에 오신 걸 환영합니다!
		</p>
		<p>
			앞으로 회원님의 일상을 더욱 재밌게<br>만들어줄 다양한 컨텐츠를 소개해드릴게요
		</p>

	</div>
	<div class="row" style="margin-top: 30px">
		<a href="login" class="wz primary block button">로그인</a>
	</div>
	<div class="row">
		<a href="${pageContext.request.contextPath}" class="link-btn-block">원마일
			홈으로 가기</a>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>