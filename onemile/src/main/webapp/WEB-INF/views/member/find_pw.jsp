<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
    <p class="wz text body1" style="margin-top: 70px;">가입하셨던 이메일 계정을 입력하시면,<br>인증번호를 보내드립니다.<br></p>
    <form class="wz form" onsubmit="checkEmail()" method="post">
        <input type="hidden" id="findType" value="FIND_PASSWORD">
        <div class="label-hidden field">
            <label class="text-hidden" for="email">이메일 주소</label>
            <div class="wz input">
                <input id="userName serialChk" type="email" name="email" placeholder="이메일 계정">
            	<span class="timer" id="timerC">00:00</span>
            </div>
            <c:if test="${param.error != null}">
			<div class="row center"> 
				<h4 class="error">입력하신 정보가 일치하지 않습니다</h4>
			</div>
			</c:if>
         </div>
        <button id="BtnSendlink" class="wz primary block button btn_recive_num" type="button" onclick="checkEmail()">인증요청</button>
        <input type="email" name="email" class="userName" placeholder="인증번호 6자리">
        
        
    </form>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>