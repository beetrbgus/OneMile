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
<div class="page-body" style="width: 500px">
  <main class="account-intro-login">
    <div class="user-sign-container">
      <div class="wz container form-container form-login">
        <h2 class="wz text display2">비밀번호 변경</h2>
        <form name="frm_login" id="frm_login" class="wz form" method = "post">
          <div class="field">
            <div class="wz input">
            <label class="label">현재 비밀번호</label>
              <input type="password" name="nowPw" id="userName" class="input-text" autocomplete="off"/>
            </div>
            </div>
          <div class="field">
            <div class="wz input">
            <label class="label">변경할 비밀번호</label>
              <input type="password" name="changePw" class="input-text"   />
            </div>
           <c:if test="${param.error != null}">
			<div class="row center"> 
				<h4 class="error">입력하신 정보가 일치하지 않습니다</h4>
			</div>
			</c:if>
          </div>
          <input type="submit" id="btnLogin" class="wz button primary block submit-button" value="변경하기"/>
           </form>
      </div>
     </div>
  </main>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>