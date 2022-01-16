<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.outer2 {
	display: flex;
	justify-content: center;
	margin-top: 70px;
}
</style>

<div class="outer2">
	<div class="wz container id-result" style="display: flex;justify-content: center;">
		<div class="isJoin-email-wrap" style="width: 500px;">
			<h2 class="wz text display1" style="display: flex;margin-top: 50px">회원탈퇴 성공</h2>
			<p id="inputedEmail" class="wz text headline2" style="margin-top: 50px"></p>
			<p id="joinedEmail" class="wz text body1">
				그동안 원마일을 이용해주셔서 감사합니다!<br>다음에 만나요. 제발~~~
			</p>
			<div class="inner-container" style="margin-top: 30px">
				<a id="goToLogin" class="wz primary block button" href="${pageContext.request.contextPath}">홈으로 가기</a>
				
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>