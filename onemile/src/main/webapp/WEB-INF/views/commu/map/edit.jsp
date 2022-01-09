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
.form-input {
	width:500px;
	font-size:20px;
	margin-top:1rem;
	margin-bottom:1rem;
}
.label{
	font-size:22px;
}
</style>
<div class="page-container">
	<div class="ui-header">
		<h2 class="title">커뮤니티</h2>
	</div>
	<form method="post" enctype="multipart/form-data">
		<select name="middleName" class="category">
			<option value="${commuEditVO.middleName}" class="label category">${commuEditVO.middleName}</option>
		</select>
		<input type="hidden" name="commuNo" value="${commuEditVO.commuNo}">
		<div id="map" style="width: 100%; height: 350px;"></div>
		<input class="form-input" type="text" name="fgLocation" readonly placeholder="위치를 선택하지 않으시면 기존 위치에 저장됩니다."><br>
		<label class="label">상세주소 : </label>
		<input class="form-input" type="text" name="detailAddress" placeholder="상세주소를 입력하세요." value="${commuEditVO.detailAddress}">
		<input type="hidden" name="lat" value="${commuEditVO.lat}">
		<input type="hidden" name="lng" value="${commuEditVO.lng}">
		<textarea rows="1" maxlength="100" name="title" class="post-title">${commuEditVO.title}</textarea>
		<textarea cols="100" rows="20" name="content" class="post-content">${commuEditVO.content}</textarea>
		<label class="danger">※사진을 새로 추가하면 기존사진은 삭제됩니다.</label>
		<input type="file" name="attach" class="file-choose">
		<input type="submit" value="수정하기" class="myButton">
	</form>
</div>
<script type="text/javascript"src="${root}/onemile/resources/js/commu-map.js"></script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>