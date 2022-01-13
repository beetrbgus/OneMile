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

<div class="outer2">
<div class="page-body" style="width: 500px">
  <main class="account-intro-login">
    <div class="user-sign-container">
      <div class="wz container form-container form-login">
        <h2 class="wz text display2">아이디 찾기</h2>
        <form name="frm_login" id="frm_login" class="wz form" action="${root}/member/find_id" method = "post">
          <div class="field">
            <div class="wz input">
            <label class="label">닉네임</label>
              <input type="text" name="nick" id="userName" class="input-text" placeholder="닉네임을 입력하세요" title="이메일 아이디" autocomplete="off"/>
            </div>
            </div>
          <div class="field">
            <div class="wz input">
            <label class="label">연락처</label>
              <input type="tel" name="phone" class="input-text" placeholder="-포함 13자리를 입력해주세요" title="비밀번호(영문, 숫자, 특수 문자 포함 8자 이상)" />
            </div>
           <c:if test="${param.error != null}">
			<div class="row center"> 
				<h4 class="error">입력하신 정보가 일치하지 않습니다</h4>
			</div>
			</c:if>
          </div>
          <input type="submit" id="btnLogin" class="wz button primary block submit-button" value="찾기"/>
           </form>
      </div>
     </div>
  </main>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>