<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 출력 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/profile.css">

<style>
.image.image-round {
	border-radius: 50%;
}
</style>
<%-- <div class="container-900 container-center">
	<div class="row float-container">
	
	<div class="float-item-left">
		<!-- 회원 프로필 이미지 -->
		<div class="row">	
			<c:choose>
				<c:when test="${memberVO.imageNo==0}">
				<img src="https://via.placeholder.com/300x300?text=User" width="100%" class="image image-round image-border">
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/image/download?imageNo=${memberVO.imageNo}&folder=member" width="100%" height="100%" class="image image-round image-border">
				</c:otherwise>
			</c:choose>
	
		</div> 
			
			<!-- 회원 정보 -->
			<div class="row center">
				<h2>${memberVO.nick}</h2>
			</div>
			<div class="row center">
				<h4>${memberVO.email}</h4>
			</div>
			<div class="row center">
				<h4>[${memberVO.grade}]</h4>
			</div>
			
			<div class="row center"></div>
			
			<!-- 각종 메뉴들 -->
			<div class="row center">
				<a href="edit" class="link-btn-block">내 정보 수정</a>
			</div>
			<div class="row center">
				<a href="edit_pw" class="link-btn-block">비밀번호 변경</a>
			</div>
			<div class="row center">
				<a href="${pageContext.request.contextPath}/membership/reg_membership" class="link-btn-block">멤버십 구매목록</a>
				<a href="${pageContext.request.contextPath}/cobuy/buylist" class="link-btn-block">공동구매 구매목록</a>
			</div>
			
		</div>
		
		<!-- 2단 -->
		<div class="float-item-left">
		
			<!-- 회원 정보 출력 -->
			<div class="row">
				<table class="table table-stripe">
					<tbody>
						<tr>
							<th width="25%">아이디</th>
							<td>${memberVO.email}</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>${memberVO.nick}</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${memberVO.birth}</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>${memberVO.email}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${memberVO.phone}</td>
						</tr>
						<tr>
							<th>가입일시</th>
							<td>${memberVO.joinDate}</td>
						</tr>
						<tr>
							<th>등급</th>
							<td>${memberVO.grade}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</div> --%>


<div class="container">
	<div class="row">
		<div class="profile_col">
			<div class="profile_inner">
				<div class="row user_row">
					<div class="col-12 image_col">
						<div class="profile_image_cover">

							<div id="carouselExampleFade"
								class="carousel slide carousel-fade" data-bs-ride="carousel">
								<div class="carousel-inner">
										<c:forEach items="${memberVO.imageList}" var="profile" varStatus="status">
									<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
										
										<img src="${pageContext.request.contextPath}/image/download?imageNo=${profile.imageNo}&folder=member" class="d-block w-100" alt="...">
									</div>
										</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleFade" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleFade" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>


							<%-- <div class="row">
								<c:forEach items="${memberVO.imageList}" var="profile">
									<img
										src="${pageContext.request.contextPath}/image/download?imageNo=${profile.imageNo}&folder=member"
										width="100%" height="100%"
										class="image image-round image-border">
								</c:forEach>
							</div> --%>
						</div>
					</div>
					<div class="col-12 text_col">
						<div class="name_zone">
							<span class="name">${memberVO.nick}</span> <span class="badge">${memberVO.grade}</span>
						</div>
						<div class="email_zone">
							<span class="badge"> </span> <span class="email">${memberVO.email}</span>
						</div>

					</div>
				</div>
				<div class="menu_row row"></div>
				<a class="link_row row" href="${root}/member/edit">
					<div class="col">회원정보 수정</div>
				</a> <a class="link_row row" href="${root}/member/edit_pw">
					<div class="col">비밀번호 변경</div>
				</a> <a class="row link_row"
					href="${pageContext.request.contextPath}/membership/reg_membership">
					<div class="col">멤버십 결제내역</div>
				</a><a class="row link_row"
					href="${pageContext.request.contextPath}/cobuy/buylist">
					<div class="col">공동구매 결제내역</div>
				</a><a class="row link_row"
					href="${pageContext.request.contextPath}/member/logout">
					<div class="col">로그아웃</div>
				</a>
			</div>
		</div>
		<div class="saved_col">

			<div class="saved_inner target target_meeting selected">
				<div class="p-20 row target target_meeting title_row selected">
					<div class="col-12">
						<h1 class="mb-4">
							소셜링 <span class="text_munto" id="SOCIALING_cnt">4건</span>
						</h1>
					</div>
				</div>
				<div class="item_row p-20 row" id="SOCIALING_row">
					<a class="item_col col-6 col-md-4"><div class="image_zone"
							style="background-image: url(https://munto-images.s3.ap-northeast-2.amazonaws.com/production-socialing/1641468204669-cover-83584-image_cropper_E720A01D-AFAD-4BAE-87B1-9AD465F50613-37699-000017E0E76E7CBB.jpg)"></div>
						<div class="item_type">소셜링</div>
						<div class="item_name">프리다이빙 하실분🤚</div>
						<div class="period">2022.01.30 ~ 2022.01.30</div></a><a
						class="item_col col-6 col-md-4"><div class="image_zone"
							style="background-image: url(https://munto-images.s3.ap-northeast-2.amazonaws.com/meta/coverimg_activity.png)"></div>
						<div class="item_type">소셜링</div>
						<div class="item_name">해이마마 배우기 슈퍼댄서 우리 버킷리스트 언능 치루자고여!!!!</div>
						<div class="period">2022.01.18 ~ 2022.01.18</div></a><a
						class="item_col col-6 col-md-4"><div class="image_zone"
							style="background-image: url(https://munto-images.s3.ap-northeast-2.amazonaws.com/production-socialing/1641668627686-cover-30009-image_cropper_CDF814DA-B9C9-46EE-A85B-53BECB4E97B3-24090-000006274DFAB077.jpg)"></div>
						<div class="item_type">소셜링</div>
						<div class="item_name">리틀포레스트 컨셉 여행 1박</div>
						<div class="period">2022.01.13 ~ 2022.01.13</div></a><a
						class="item_col col-6 col-md-4"><div class="image_zone"
							style="background-image: url(https://munto-images.s3.ap-northeast-2.amazonaws.com/production-socialing/1641883562238-cover-30009-image_cropper_D635E852-C5C6-45BD-87FD-91E1E8FD5229-45322-00000ABB1078208E.jpg)"></div>
						<div class="item_type">소셜링</div>
						<div class="item_name">강원도 영월 리틀포레스트 여행</div>
						<div class="period">2022.01.13 ~ 2022.01.13</div></a>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>