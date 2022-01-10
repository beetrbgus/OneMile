<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.outer2 {
	display: flex;
	justify-content: center;
}
</style>

<div class="outer2">
<div class="wz container pw-check" style="width: 500px">
	 <h2 class="wz text display2">비밀번호 찾기</h2>
    <p class="wz text body1">가입하셨던 이메일 계정을 입력하시면,<br>인증번호를 보내드립니다.<br></p>
    <form class="wz form" onsubmit="checkEmail()" method="post">
        <input type="hidden" id="findType" value="FIND_PASSWORD">
        <div class="label-hidden field">
            <label class="text-hidden" for="email">이메일 주소</label>
            <div class="wz input">
                <input id="userName" type="email" name="email" placeholder="이메일 계정">
            </div>
            <c:if test="${param.error != null}">
			<div class="row center"> 
				<h4 class="error">입력하신 정보가 일치하지 않습니다</h4>
			</div>
			</c:if>
         </div>
        <button id="BtnSendlink" class="wz primary block button" type="submit" onclick="checkEmail()">인증요청</button>
        <button id="BtnReSendlink" class="wz block button" type="button" onclick="checkEmail()" style="display: none">인증요청</button>
    </form>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>