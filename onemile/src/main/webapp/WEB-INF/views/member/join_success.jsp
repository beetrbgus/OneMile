<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-300 container-center">
	<div class="row center">
		<h2>회원 가입 완료</h2>
	</div>
	<hr>
	<div class="row center">
		<a href="login" class="link-btn-block">로그인하기</a>	
	</div>
	<div class="row center"> 
		<a href="${pageContext.request.contextPath}" class="link-btn-block">메인페이지 보기</a>
	</div>
</div>

<div class="SignUpDefaultLayout_container__1xI1T"><div class="SignUpDefaultLayout_contentWrapper__1EEim"><div class="SignUpContainerWrapper_container__2_hvR"><div class="SignUpTitle_container__2ISq0"><h2 class="SignUpTitle_title__1WR6C"><p>박근우 서포터님<br>와디즈에 오신 걸 환영합니다</p></h2><div class="SignUpTitle_desc__3n2-P"><p>앞으로 서포터님의 일상을 더욱 즐겁게<br>만들어줄 다양한 프로젝트를 소개해드릴게요</p></div><button class="SignUpTitle_backBtn__2dPEe">이전 페이지로 이동</button><button class="waffle button block SignUpTitle_goWadizBtn___zuYy" type="button">와디즈 홈으로 바로가기</button></div></div></div></div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>