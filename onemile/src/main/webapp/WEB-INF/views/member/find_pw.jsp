<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.outer2 {
	display: flex;
	justify-content: center;
	margin-top: 70px;
}

.error {
	margin-top: 10px;
	color: red;
}
</style>
<script>
	$(function() {
		/* 인증번호 전송 */
		var number = "";

		$("#BtnSendlink").click(function(e) {
			e.preventDefault();

			var email = $("input[name=email]").val();
			console.log("email" + email);
			$.ajax({
				url : "${root}/member/emailSend?email=" + email,
				type : "get",
				dataType : "text",
				success : function(data) {
					if (data == "error") {
					} else {
						number = data;
					}
				}
			});
		});
	});

	/*인증시간 타이머  */
	var timer = null;
	var isRunning = false;
	$(function() {
		$(".btn_recive_num").click(function(e) {
			var display = $('.timer');
			var leftSec = 300;
			// 남은 시간
			// 이미 타이머가 작동중이면 중지
			if (isRunning) {
				clearInterval(timer);
				display.html("");
				startTimer(leftSec, display);
			} else {
				startTimer(leftSec, display);
			}
		});
	})
	function startTimer(count, display) {
		var minutes, seconds;
		timer = setInterval(function() {
			minutes = parseInt(count / 60, 10);
			seconds = parseInt(count % 60, 10);
			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;
			display.html(minutes + ":" + seconds);
			// 타이머 끝
			if (--count < 0) {
				clearInterval(timer);
				display.html("시간초과");
				$("#serialChk").attr("disabled", true);
				$("#serialChk").css("background", "#fff");
				isRunning = false;
			}
		}, 1000);
		isRunning = true;
	}
</script>
<div class="outer2">
	<div class="wz container pw-check" style="width: 500px">
		<h2 class="wz text display2">비밀번호 찾기</h2>
		<p class="wz text body1" style="margin-top: 70px;">
			가입하셨던 이메일 계정을 입력하시면,<br>인증번호를 보내드립니다.<br>
		</p>
		<form class="wz form" onsubmit="checkEmail()" method="post"
			action="${pageContext.request.contextPath}/member/emailCheck">
			<input type="hidden" id="findType" value="FIND_PASSWORD">
			<div class="label-hidden field">
				<label class="text-hidden" for="email">이메일 주소</label>
				<div class="wz input">
					<input id="serialChk" type="email" name="email" id="email"
						placeholder="이메일 계정"> 
						<span class="timer" id="timerC">00:00</span>
						
						<button id="BtnSendlink" class="wz primary block button btn_recive_num" type="button" onclick="checkEmail()" style="width: 150px; height: 48px; position:absolute; ; top : 1px; right:1px;margin-left: -119px;">인증요청</button>
				</div>
				
				<c:if test="${param.error != null}">
					<div class="row center">
						<h4 class="error">입력하신 정보가 일치하지 않습니다</h4>
					</div>
				</c:if>
			</div>

			
			
			<input type="text" name="serial" placeholder="인증번호 6자리">
			<button type="submit">인증하기</button>

		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>