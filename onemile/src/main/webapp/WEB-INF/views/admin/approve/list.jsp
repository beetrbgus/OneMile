<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.memberT{
	padding-top:1rem;
	margin:0 auto;
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
.a:hover{
	color:black;
}
.input-form{
	font-size:20px;
	border: 1px solid #00c4c4;
	padding-top:0.07em;
	width:350px;
}
.search-box{
	margin-left:auto;
	margin-right:auto;
	width:50%;
	text-align:center;
	overflow:auto;
}
</style>
<div class="board wzui">
	<div class="ui-header">
		<h2 class="title">가입 승인 대기 목록</h2>
	</div>
<div class="search-box">
	<form method="get">
		<select name="search">
			<option value="email">이메일</option>
			<option value="nick">닉네임</option>
		</select>
		<input type="text" name="keyword" class="input-form">
		<input type="submit" value="검색" class="wz button primary">
	</form>
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
			<th>프로필보기</th>
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
				<td><a class="a" onclick="window.open('../account/profile','window_name','width=600,height=500,location=no,status=no,scrollbars=yes');">더보기</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>