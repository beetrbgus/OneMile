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
							<div class="row">
								<c:choose>
									<c:when test="${memberVO.imageNo==0}">
										<img src="https://via.placeholder.com/300x300?text=User"
											width="100%" class="image image-round image-border">
									</c:when>
									<c:otherwise>
										<img
											src="${pageContext.request.contextPath}/image/download?imageNo=${memberVO.imageNo}&folder=member"
											width="100%" height="100%"
											class="image image-round image-border">
									</c:otherwise>
								</c:choose>

							</div>
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
				<div class="menu_row row">
				
				</div>
				<a class="link_row row">
					<div class="col">MBTI  :  ${memberVO.mbti}
					<c:forEach items="${socialListVO}" var="socialListVO">
					${socialListVO.title} ${socialListVO.startDate} ${socialListVO.endDate}
					</c:forEach>
					</div>
				</a> <a class="link_row row">
					<div class="col">${memberVO.intro} 
					
					</div>
				</a> <a class="row link_row">
					<div class="col">
					<%-- <img src="${pageContext.request.contextPath}/image/download?imageNo=${socialListVO.imgNo}&folder=social"> --%>
					</div>
				
				</a>
			</div>
		</div>
		<!-- <div class="saved_col">
			<div class="saved_inner">
				<div class="li_row mb-3">
					<div class="row">
						<div class="col-6 text_center">
							<a class="selector" target=".target_feed"> 피드 </a>
						</div>
						<div class="col-6 text_center">
							<a class="selector selected" target=".target_meeting"> 모임 </a>
						</div>
					</div>
				</div>
				<div class="p-20 row target target_feed text_center">
					<div class="col-12 mb-3 mt-5">
						<img src="/feed.9aba0aa2.svg">
					</div>
					<div class="col-12 mb-3">
						피드는 문토앱에서 확인할 수 있습니다.<br> 취향이 통하는 사람들의 모임 문토
					</div>
					<div class="col-12">
						<a class="btn btn-fatter btn-munto btn-round" id="install_button">
							설치하기 <img src="/right.b8d0f10a.svg">
						</a>
					</div>
				</div>
				<div class="p-20 row target target_meeting title_row selected">
					<div class="col"></div>
					<div class="col-auto select_col">
						<select id="status" class="form-control">
							<option value="PLAYING" selected="">활동중인 모임</option>
							<option value="CLOSE">참여했던 모임</option>
						</select>
					</div>
					<div class="col-12">
						<h1 class="mb-4">
							정기모임 <span class="text_munto" id="ITEM_cnt">0건</span>
						</h1>
					</div>
				</div>
				<div id="ITEM_row"
					class="item_row p-20 row target target_meeting selected"></div>
			</div>
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
		</div> -->
		<c:forEach items="${socialListVO}" var="socialListVO">
			${socialListVO.title}
		</c:forEach>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>