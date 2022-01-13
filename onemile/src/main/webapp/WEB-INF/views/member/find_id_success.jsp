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
			<h2 class="wz text display1" style="display: flex;margin-top: 50px">아이디 찾기</h2>
			<p id="inputedEmail" class="wz text headline2" style="margin-top: 50px">${email}</p>
			<p id="joinedEmail" class="wz text body1">
				회원으로 등록된 이메일 아이디입니다.<br>해당 이메일로 로그인하고 원마일을 이용하세요!
			</p>
			<div class="inner-container" style="margin-top: 30px">
				<a id="goToLogin" class="wz primary block button" href="login">로그인</a>
				<a id="btn-recheck" class="wz block button" href="find_id">다시 확인</a>
			</div>
		</div>
	</div>
</div>
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>