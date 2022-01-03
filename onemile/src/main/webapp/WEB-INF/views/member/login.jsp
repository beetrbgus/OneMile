<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.page-body{
		width:400px;
	}
	.page-body{
		margin-left: auto;
	    margin-right: auto;
	    margin-top: 10px;
		margin-bottom: 10px;
		padding-top:5px;
		padding-bottom:5px;
	}
	.bottom-message{
		width: 100%;
	    height: 56px;
	    text-align: center;
	    line-height: 56px;
	    font-size: 13px;
	    position: relative;
	    bottom: auto;
	    left: auto;
	    margin-top: 12px;
	    box-shadow: none;
	    background: none;
	}
	.forgot{
		margin-left: auto;
    	margin-right: auto;
		display: inline-block;
	    position: relative;
	    cursor: pointer;
	    padding-left: 24px;
	    vertical-align: top;
	    font-size: 13px;
    	font-weight: 400;
	}
	
	#txtSaveId{
		padding-left:0;
	}
	
	.login-action{
		text-align: center;
	}
</style>

<div class="black-bg-wrap" style="display:none;"></div>
<div class="page-body">
  <main class="account-intro-login">
    <div class="user-sign-container">
      <div class="wz container form-container form-login">
        <h2 class="wz text display2">로그인</h2>
        <form name="frm_login" id="frm_login" class="wz form" method="post">
          <div class="field">
            <div class="wz input">
              <input type="email" id="userName" name="email" class="input-text" placeholder="이메일 아이디" title="이메일 아이디" autocomplete="off" value="${cookie.saveId.value}"/>
            </div>
            <!-- <em id="emailError" class="error-text helper error">이메일 형식이 올바르지 않습니다.</em> -->
          </div>
          <div class="field">
            <div class="wz input">
              <input type="password" id="password" name="pw" class="input-text" placeholder="비밀번호(영문, 숫자, 특수 문자 포함 8자 이상)" title="비밀번호(영문, 숫자, 특수 문자 포함 8자 이상)" />
            </div>
           <c:if test="${param.error != null}">
			<div class="row center"> 
				<h4 class="error">로그인 정보가 일치하지 않습니다</h4>
			</div>
			</c:if>
          </div>
          <input type="submit" id="btnLogin" class="wz button primary block submit-button" value="로그인"/>
          <input type="hidden" name="returnURL" value="wAccountLogin07d0.html">
        </form>
        <div class="bottom-message">
          <p>아직 원마일 계정이 없나요? <a href="${root}/member/join">회원가입</a></p>
        </div>
        <div class="login-action">
        	<label>
			<c:choose>
				<c:when test="${cookie.saveId == null}">
					<input type="checkbox" name="saveId">
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="saveId" checked>
				</c:otherwise>
			</c:choose>
			<span class="forgot" id="txtSaveId" class="wz text caption2">아이디 저장</span>
			</label>
            <p class="forgot"><a class="wz text" href="${root}/member/find_id">아이디 찾기<i class="icon chevron-right"></i></a></p>
          	<p class="forgot"><a class="wz text" href="${root}/member/find_pw">비밀번호 찾기<i class="icon chevron-right"></i></a></p>
          </div>
      </div>
     </div>
  </main>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>