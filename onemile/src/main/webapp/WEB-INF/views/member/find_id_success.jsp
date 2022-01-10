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
<div class="wz container id-result" style="display: block;" >
    <div class="isJoin-email-wrap" style="width: 500px">
    	<h2 class="wz text display1">아이디 찾기</h2>
        <p id="inputedEmail" class="wz text headline2">${email}</p>
        <p id="joinedEmail" class="wz text body1">회원으로 등록된 이메일 아이디입니다.<br>해당 이메일로 로그인하고 와디즈를 이용하세요!
        </p>
        <p id="notJoinedEmail" class="wz text body1" style="display: none;">는 와디즈에 등록되어 있지 않은 계정입니다.</p>
        <div class="inner-container">
            <a id="goToJoin" class="wz primary block button" href="login" style="display: none;">회원가입하기</a>
            <a id="goToLogin" class="wz primary block button" href="login">로그인</a>
            <a id="btn-recheck" class="wz block button" href="find_id">다시 확인</a>
        </div>
    </div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>