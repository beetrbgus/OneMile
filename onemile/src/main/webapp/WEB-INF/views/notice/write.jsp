<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.page-container {
	max-width: 700px;
	margin: auto;
	padding: 56px 0;
	overflow-x: inherit;
}
.post-title {
	min-height: 43px;
	height: 43px;
	font-weight: 700;
	font-size: 32px;
	overflow: hidden
}

.post-content {
	font-size: 22px;
}

textarea {
	width: 100%;
	padding: 0;
	margin: 0 -10px 4px;
	border: 0;
	border-radius: 0;
	resize: none;
}

﻿select::-ms-expand { 
	display: none;
}
.select {
  -o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
.file-choose{
	width:100%;
}
.category{
	width:100%;
	font-size:22px;
	padding-top:0.4rem;
}
.myButton {
	float:right;
	margin-top:10px;
	border-color: #00c4c4;
    background-color: #00c4c4;
    color: #fff;
    padding: 9px 24px;
    line-height: 1.75;
    font-size: 16px;
}
.myButton:hover {
	background-color:#dde2e6;
}
</style>
<div class="page-container">
	<div class="ui-header">
		<h2 class="title">운영사항</h2>
	</div>
	<form  method="post" enctype="multipart/form-data">
		<input type="hidden" name="mapNo" value=0>
		<select name="middleName" class="category" required>
			<option value="" class="label category">카테고리 선택</option>
			<option value="공지사항" class="label category">공지사항</option>
			<option value="운영규칙" class="label category">운영규칙</option>
			<option value="자주하는질문" class="label category">자주하는질문</option>
		</select>
		<textarea rows="1" maxlength="100" name="title" class="post-title"
			placeholder="제목을 입력하세요."></textarea>
		<textarea cols="100" rows="20" id="content" name="content" class="post-content"
			placeholder="내용을 입력하세요."></textarea>
		<input type="file" name="attach" class="file-choose">
		<input type="submit" value="등록하기" class="myButton">
	</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>