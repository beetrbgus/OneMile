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
	$(".hiddenmember").click(function(){ 
		let memberno = 	$(this).data("memberno");
		$("#memberno").val(memberNo);
		console.log("memberno  "+memberno );
		/*$("#hiddenForm").submit();*/
		 
	});
	$("#moreBtn").click();
	function loadData(page, size) {

		$.ajax({
			url: "${pageContext.request.contextPath}/admin/member/hidedetail",
			type: "get",
			data: {
				page: page,
				size: size,
				search: search,
				keyword: keyword
			},
			success: function (resp) {
				if (resp.length < size) {
					$("#moreBtn").remove();
				}
				var tbody = $('#tbody');
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
					tbody.append(template);
				}
			},
			error: function (e) {
				console.log("??????", e);
			}
		});
	};
});
</script>
<div class="board wzui">
	<div class="ui-header">
		<h2 class="title">?????? ?????? ??????</h2>
	</div>
	<div class="ui-tabs">
		<ul>
			<li><a href="${root}/onemile/admin/member/list">????????????</a></li>
			<li><a href="${root}/onemile/admin/member/quit">??????????????????</a></li>
			<li><a href="${root}/onemile/admin/member/hide">??????????????????</a></li>
		</ul>
	</div>
</div>
<div class="search-box">
	<form method="get">
		<select name="search">
			<option value="email">?????????</option>
			<option value="nick">?????????</option>
		</select>
		<input type="text" name="keyword" class="input-form">
		<input type="submit" value="??????" class="wz button primary">
	</form>
</div>
<div class="memberT">
	<table>
		<thead>
		<tr>
			<th>?????????</th>
			<th>?????????</th>
			<th>?????????</th>
			<th>??????</th>
			<th>????????????</th>
			<th>??????</th>
			<th>?????????</th>
			<th>????????????</th>
		</tr>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
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
	</tr>
</template>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>