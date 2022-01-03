<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 출력 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.float-container > .float-item-left:nth-child(1) {
		width:25%;	
		padding:0.5rem;
	}
	.float-container > .float-item-left:nth-child(2) {
		width:75%;
		padding:0.5rem;
	}
	
	.link-btn {
		width:100%;
	}
</style>

<div class="container-900 container-center">
	<div class="row">
		<h2>회원 상세 정보</h2>
	</div>
	<div class="row float-container">
	
	<div class="float-item-left">
		<!-- 회원 프로필 이미지 -->
		<div class="row">
			<c:choose>
				<c:when test="${memberProfileMidDTO == null}">
				<img src="https://via.placeholder.com/300x300?text=User" width="100%" class="image image-round image-border">
				</c:when>
				<c:otherwise>
				<img src="profile?imageNo=${memberProfileMidDTO.imageNo}" width="100%" class="image image-round image-border">
				</c:otherwise>
			</c:choose>
		</div> 
			
			<!-- 회원 아이디 -->
			<div class="row center">
				<h2>${memberDTO.email}</h2>
			</div>
			
			<!-- 각종 메뉴들 -->
			<div class="row center">
				<a href="edit_pw" class="link-btn-block">비밀번호 변경</a>
			</div>
			<div class="row center">
				<a href="edit" class="link-btn-block">개인정보 변경</a>
			</div>
			<div class="row center">
				<a href="quit" class="link-btn-block">회원 탈퇴</a>
			</div>
			
		</div>
		
		<!-- 2단 -->
		<div class="float-item-left">
		
			<!-- 회원 정보 출력 -->
			<div class="row">
				<h2>회원 상세 정보</h2>
			</div>
			<div class="row">
				<table class="table table-stripe">
					<tbody>
						<tr>
							<th width="25%">아이디</th>
							<td>${memberDTO.email}</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>${memberDTO.nick}</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${memberDTO.birth}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${memberDTO.email}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${memberDTO.phone}</td>
						</tr>
						<tr>
							<th>가입일시</th>
							<td>${memberDTO.joinDate}</td>
						</tr>
						<tr>
							<th>등급</th>
							<td>${memberDTO.grade}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>