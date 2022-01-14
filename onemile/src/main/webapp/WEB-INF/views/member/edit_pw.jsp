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
.notice {
	color: red;
}
.error {
	color: red;
</style>

<script>
//비밀번호 정규표현식
function pwCheck(){
    var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
    var input = document.querySelector("input[name=nowPw]");
    var notice = input.nextElementSibling;

    if(regex.test(input.value)){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "비밀번호는 8~16자 이내의 영문,숫자,특수문자로 작성하세요";
        return false;
    }
}
//비밀번호 확인
function pw2Check(){
    var pwInput = document.querySelector("input[name=nowPw]");
    var pw2Input = document.querySelector("input[name=changePw]");
    var notice = pw2Input.nextElementSibling;

   if(pwInput.value.length > 0 && pwInput.value == pw2Input.value){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "비밀번호가 일치하지 않습니다";
        return false;
    }
}	
</script>
<div class="outer2" style="margin-top: 70px">
<div class="page-body" style="width: 500px">
  <main class="account-intro-login">
    <div class="user-sign-container">
      <div class="wz container form-container form-login">
        <h2 class="wz text display2" style="margin-top: 70px">비밀번호 변경</h2>
        <form name="frm_login" id="frm_login" class="wz form" method = "post">
          <div class="field">
            <div class="wz input">
            <label class="label">현재 비밀번호</label>
              <input type="password" name="nowPw" id="userName" class="input-text" autocomplete="off"/>
           	<div class="notice"></div>
            </div>
            </div>
          <div class="field">
            <div class="wz input">
            <label class="label">변경할 비밀번호</label>
              <input type="password" name="changePw" class="input-text"/>
              <div class="notice"></div>
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