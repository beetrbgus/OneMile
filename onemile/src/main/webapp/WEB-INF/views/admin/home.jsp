<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<main class="board wzui">
	<div class="ui-header">
		<h2 class="title">관리자 메뉴</h2>
	</div>
	<div class="ui-tabs">
		<ul>
			<li><a href="${root}/onemile/admin/member/list">회원</a></li>
			<li><a href="${root}/onemile/admin/approve/list">회원가입승인</a></li>
			<li><a href="${root}/onemile/social/list">소셜링</a></li>
			<li><a href="${root}/onemile/cobuy/list">공동구매</a></li>
			<li><a href="${root}/onemile/commu/notmap/list">커뮤니티</a></li>
		</ul>
	</div>
</main>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>