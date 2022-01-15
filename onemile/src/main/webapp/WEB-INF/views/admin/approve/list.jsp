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
<script>
$(function () {
	var page = 1;
	var size = 25;
	var search = '';
	var keyword = '';
	var url = new URL(location.href);
	var urlParams = url.searchParams;

	if(urlParams.get("search")){
		search = urlParams.get("search");
	}
	
	if(urlParams.get("keyword")){
		keyword = urlParams.get("keyword");
	}
	
	$("#moreBtn").click(function () {
		loadData(page, size);
		page++;
	});
	
	$("#moreBtn").click();
	function loadData(page, size) {

		$.ajax({
			url: "${pageContext.request.contextPath}/admin/approve/listdetail",
			type: "get",
			data: {
				page: page,
				size: size,
				search: search,
				keyword: keyword
			},
			success: function (resp) {
				console.log("성공", resp);
				var tbody = $('#tbody');
				if (resp.length < size) {
					$("#moreBtn").remove();
				}
				for (var i = 0; i < resp.length; i++) {
					var template = $('#memberTemplate').html();
					template = template.replace("{{email}}", resp[i].email);
					template = template.replace("{{nick}}", resp[i].nick);
					template = template.replace("{{phone}}", resp[i].phone);
					template = template.replace("{{gender}}", resp[i].gender);
					template = template.replace("{{birth}}", resp[i].birth);
					template = template.replace("{{grade}}", resp[i].grade);
					template = template.replace("{{joinDate}}", resp[i].joinDate);
					template = template.replace("{{intro}}", resp[i].intro);
					template = template.replace("{{memberNo}}", resp[i].memberNo);
					tbody.append(template);
				}
			},
			error: function (e) {
				console.log("실패", e);
			}
		});
	};
});
</script>
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
		<tbody id="tbody">
		</tbody>
	</table>
	<div class="ProjectListMoreButton_container__1JFxX ProjectCardList_more__3AbzT"><button type="button"
						id="moreBtn" class="ProjectListMoreButton_button__27eTb">더보기<i class="icon expand-more"
							aria-hidden="true"></i></button>
					<div class="wz-loader ProjectListMoreButton_loader__1Kcvt"></div>
				</div>
</div>
</div>
<template id="memberTemplate">
	<tr>
		<td>{{email}}</td>
		<td>{{nick}}</td>
		<td>{{phone}}</td>
		<td>{{gender}}</td>
		<td>{{birth}}</td>
		<td>{{grade}}</td>
		<td>{{joinDate}}</td>
		<td>{{intro}}</td>
		<td><a class="a" onclick="window.open('../account/profile?memberNo={{memberNo}}','window_name','width=600,height=500,location=no,status=no,scrollbars=yes');">더보기</a></td>
	</tr>
</template>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>