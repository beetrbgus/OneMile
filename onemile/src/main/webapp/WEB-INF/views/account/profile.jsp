<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css">
<style>
.image.image-round {
	border-radius: 50%;
}
</style>
<script>


function getYmd10() {
	var val = '${memberVO.joinDate}'
	console.log("현재날짜"+typeof val);
	
    //yyyy-mm-dd 포맷 날짜 생성
	var d = new Date(${memberVO.joinDate});
    return d.getFullYear() + "년 " + (d.getMonth()+1) + "월 " + d.getDate() + "일 " + d.getHours() + "시 " + d.getMinutes() + "분 " + d.getSeconds() + "초 " +  '일월화수목금토'.charAt(d.getUTCDay())+'요일';
}
console.log(getYmd10());

const today = new Date();
const formattedDateKR = new Intl.DateTimeFormat("ko-KR").format(today);
console.log(formattedDateKR);
</script>
<!-- 1단 -->
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
											<img src="${pageContext.request.contextPath}/image/download?imageNo=${profile.imageNo}&folder=member" class="d-block w-100 image image-round image-border" alt="..." style="width:150px;height:150px">
										</div>
									</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
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
					</div>
					<div class="col-12 text_col">
						<div class="name_zone">
							<span class="name">${memberVO.nick}</span>
							<span class="badge">${memberVO.grade}</span>
						</div>
						<div class="email_zone">
							<span class="badge"> </span> 
							<span class="email">${memberVO.email}</span>
						</div>
					</div>
				</div>
				
				<a class="link_row row">
					<div class="col">자기소개  :  ${memberVO.intro}</div>
				</a> 
				<a class="link_row row">
					<div class="col">MBTI : ${memberVO.mbti}</div>
				</a> 
				<a class="link_row row">
					<div class="col">성별 : ${memberVO.gender}</div>
				</a> 
				<a class="link_row row">
					<div class="col">가입일 : ${memberVO.joinday}</div>
				</a>
			</div>
		</div>
		
		<!-- 2단 -->
		<div class="saved_col">
			<div class="saved_inner target target_meeting selected" style="padding-left:30px;border-left-width: 0px;margin-left: 10px;padding-top: 15px;padding-right:30px;">
				<div class="p-20 row target target_meeting title_row selected">
					<div class="col-12">
						<h1 class="mb-4">내 소셜링<span class="text_munto" id="SOCIALING_cnt"></span></h1>
					</div>
				</div>
				
				<div class="item_row p-20 row" id="SOCIALING_row">
					<c:forEach items="${socialListVO}" var="socialListVO">
					<a class="item_col col-6 col-md-4">
					<div class="image_zone" style="background-image: url('${pageContext.request.contextPath}/image/download?imageNo=${socialListVO.imgNo}&folder=social')"></div>
						<div class="item_type">소셜링</div>
						<div class="item_name">${socialListVO.title}</div>
						<div class="period">${socialListVO.startDate} ~ ${socialListVO.endDate}</div></a>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>