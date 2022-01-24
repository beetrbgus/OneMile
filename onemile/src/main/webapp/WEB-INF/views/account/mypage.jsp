<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css">
<style>
.image {
    border: 2px solid transparent;
}

.image.image-round {
    border-radius: 50%;
}

.image.image-border,
.image.image-hover:hover {
    border: 2px solid gray;
}
</style>
<script>
$(function(){
	$("#socialstatus").on("change",function(){
		var checkNo = $(this).val();
		console.log(checkNo);
		$.ajax({ 
			url : '${pageContext.request.contextPath}/account/status/',
			type : "post",
			async : false,
			data : { 
				checkNo : checkNo
			},
			success : function(resp) {
				console.log("성공", resp);
				
				},
	 		error : function(e) {
			  console.log("실패", e);
 		  	}
		});
	});
});

</script>


<div class="container">
	<div class="row">
		<div class="profile_col">
			<div class="profile_inner">
				<div class="row user_row">
					<div class="col-12 image_col">
						<div class="profile_image_cover">
							<!-- 이미지  -->
							<div id="carouselExampleFade"
								class="carousel slide carousel-fade" data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach items="${memberVO.imageList}" var="profile"
										varStatus="status">
										<div
											class="carousel-item ${status.index == 0 ? 'active' : ''}">
											<img src="${pageContext.request.contextPath}/image/download?imageNo=${profile.imageNo}&folder=member" class="d-block w-100 image image-round image-border" alt="..." style="width:150px;height:150px">
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
						</div>
						<!-- 1단 프로필 -->
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
					<div class="col">회원정보 수정</div></a>
				 <a class="link_row row" href="${root}/member/edit_pw">
					<div class="col">비밀번호 변경</div></a> 
					<a class="row link_row" href="${root}/membership/reg_membership">
					<div class="col">멤버십 결제내역</div></a>
					<a class="row link_row" href="${root}/cobuy/buylist">
					<div class="col">공동구매 결제내역</div></a>
					<a class="row link_row" href="${root}/member/logout">
					<div class="col">로그아웃</div></a>
			</div>
		</div>
		
		
		<!-- 2단 -->
		<div class="saved_col">
			<div class="saved_inner target target_meeting selected" style="padding-left:30px;border-left-width: 0px;margin-left: 10px;padding-top: 15px;padding-right:30px;">
				<div class="p-20 row target target_meeting title_row selected">
					<div class="col-12">
						<h1 class="mb-4">내 소셜링 <span class="text_munto" id="SOCIALING_cnt"></span></h1>
					</div>
					<select id="socialstatus" class="form-control"> 
						<option value="0" selected="">활동중인 모임</option><!-- 0이면 참여중 --> 
						<option value="1">참여했던 모임</option> <!-- 1이면 참여종료 -->
						<option value="2">참여 대기중</option> <!-- 2이면 참여대기중 -->
					</select>
				</div>
				
				<div class="item_row p-20 row" id="SOCIALING_row">
					<c:forEach items="${socialListVO}" var="socialListVO">
					<a class="item_col col-6 col-md-4">
					<div class="image_zone" style="background-image: url('${pageContext.request.contextPath}/image/download?imageNo=${socialListVO.imgNo}&folder=social')"></div>
						<div class="item_type">소셜링</div>
						<a href="${pageContext.request.contextPath}/social/detail/${socialListVO.socialNo}">
						<div class="item_name">${socialListVO.title}</div>
						</a>
						<div class="period">${socialListVO.startDate} ~ ${socialListVO.endDate}</div></a>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>