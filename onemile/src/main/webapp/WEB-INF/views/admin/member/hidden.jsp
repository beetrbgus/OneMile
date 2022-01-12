<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.memberT{
	padding-top:1rem;
}
table, th, td{
	margin-left:auto;
	margin-right:auto;
	text-align:center;
	border: 1px solid #bcbcbc;
}
table{
	margin-top:1rem;
	width:1200px;
	overflow:auto;
}
.intro{
	width:400px;
	overflow: hidden;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<div class="board wzui">
	<div class="ui-header">
		<h2 class="title">탈퇴 회원 목록</h2>
	</div>
	<div class="ui-tabs">
		<ul>
			<li><a href="${root}/onemile/admin/member/list">회원목록</a></li>
			<li><a href="${root}/onemile/admin/member/hidden">탈퇴회원목록</a></li>
		</ul>
	</div>
</div>
<div class="memberT">
	<table>
		<thead>
		<tr>
			<th>이메일</th>
			<th>닉네임</th>
			<th>핸드폰</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>등급</th>
			<th>가입일</th>
			<th>자기소개</th>
			<th>닉네임변경일</th>
			<th>탈퇴일</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.email}</td>
				<td>${list.nick}</td>
				<td>${list.phone}</td>
				<td>${list.gender}</td>
				<td>${list.birth}</td>
				<td>${list.grade}</td>
				<td>${list.joinDate}</td>
				<td class="intro">${list.intro}</td>
				<td>${list.nickModi}</td>
				<td>${list.exitDate}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>