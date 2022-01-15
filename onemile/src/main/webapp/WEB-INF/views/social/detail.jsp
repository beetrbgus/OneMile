<%@ page language="java" contentType="text/html  charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail-socialing.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/grid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reboot.css">


  <p>번호 : ${detail.socialNo}</p>
  <p>제목 : ${detail.title}</p>
  <p>대분류 : ${detail.type}</p>
  <p>소분류 : ${detail.smalltype}</p>
  <p>시작일 : ${detail.startDate}</p> 
  <p>종료일 : ${detail.endDate}</p>
  <p>설명 : ${detail.context}</p>
  <p>최소인원 : ${detail.minpeople}</p>
  <p>최대인원 :${detail.maxpeople}</p>
  <p>참여자 목록 : </p>
  <c:forEach items="${detail.participate}" var="parti">
  	<br>
  	${parti.memberNo} /
	${parti.profileImgNo} /
	${parti.nick} /
	${parti.intro} /
  </c:forEach>
  <p>모임장 회원번호 :${detail.memberNo}</p>
  <p>모임장 닉네임 : ${detail.nick}</p>
  <p>등록일 :${detail.regdate}</p>
  <p>모임장 이미지 번호 :</p>
  	<img width="400px" height="300" src="${pageContext.request.contextPath}/image/download?imageNo=${detail.profileImgNo}&folder=member">  
  <p>소셜링 이미지 번호 : </p>
  <c:forEach items="${detail.imageInfo}" var="imageDTO">
  	<img width="400px" height="300" src="${pageContext.request.contextPath}/image/download?imageNo=${imageDTO.imageNo}&folder=social">	
  </c:forEach>
  <p>위도 :${detail.lat}</p> 
  <p>경도 : ${detail.lng}</p>
  <p>상세주소 : ${detail.detailAddress}</p>
  <form id="socialform" method="post" action="../socialjoin" >
   	<input type="hidden" name="socialNo" value="${detail.socialNo}">
  </form>
	
	<c:choose>
		<c:when test="${detail.memberNo==logNo}"> 
			<button type="button" id="btn" data-joined="modify">수정하기</button>
		</c:when>
		<c:when test="${detail.isJoined=='수락대기중'}">
			<button type="button" id="btn" data-joined="exit">취소하기</button>
		</c:when>
		<c:when test="${detail.isJoined=='참여중'}">
			<button type="button" id="btn" data-joined="exit">탈퇴하기</button>
		</c:when>
		<c:otherwise>
			<button type="button" id="btn" data-joined="join">참가하기</button>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${detail.maxpeople > fn:length(detail.participate)}">
			<c:set value="false" var="isFull"></c:set>
		</c:when>
		<c:otherwise>
			<c:set value="true" var="isFull"></c:set>
		</c:otherwise>
	</c:choose>
	
<div class="container detail">
    <div class="detail-wrapper">
        <div class="detail_info">
            <p class="detail_name">${detail.title}</p>
            <div class="detail_info_container">
                <div>
                    <div>
                        <p class="sub">장소</p>
                    </div>
                    <p class="detail_startDate">${detail.detailAddress}</p>
                </div>
                <div>
                    <div>
                        <p class="socialing_startDate sub">모임일</p>
                    </div>
                    <p class="summary-sub">${detail.startDate} ~ ${detail.endDate}</p>
                </div>
                <div>
                    <div>
                        <p class="sub">분류</p>
                    </div>
                    <p class="detail_startDate">${detail.type} · ${detail.smalltype}
                </div>
            </div>
        </div>
        <div class="detail_carousel_row no_padding row">
            <div class="col-12">
                <div id="carouselExampleFade"
								class="carousel slide carousel-fade" data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach items="${detail.imageInfo}" var="imageDTO"
										varStatus="status">
										<div
											class="carousel-item ${status.index == 0 ? 'active' : ''}">
											<img src="${pageContext.request.contextPath}/image/download?imageNo=${imageDTO.imageNo}&folder=social" class="d-block w-100 image image-round image-border" alt="..." style="width:150px;height:350px">
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
        </div>
        <div class="detail_info_mobile">
            <div class="detail_info__host">
                <div>
                
                    <div class="detail_info__host__img"
                        style="background-image: url(&quot;https://munto-images.s3.ap-northeast-2.amazonaws.com/production-user/1634097886594-image-69491-profileImage&quot;);">
                   		
                    </div> <img class="socialing-host-hand" src="/host_20px.02a2c6f6.svg">
                </div>
                <div class="detail_info__host__name">심다예</div>
            </div>
            <div class="detail_info__header">
                <div class="detail_info__title">여자들의 로망 폴댄스 체험❤️</div>
            </div>
            <div class="detail_info__location"><img src="/1_calendar_location_24px.83d0023a.svg"><span>${detail.startDate} ~ ${detail.endDate}</span></div>
        </div>
    </div>
    <div class="detail_floating_zone" style="position: absolute; top: 600px; width: 412px; right: 350px;">
        <div class="detail_summary_row mt-5 row">
            <div class="col-12 main_col">
                <div class="user_cover"
                    style="background-image: url(&quot;https://munto-images.s3.ap-northeast-2.amazonaws.com/production-user/1634097886594-image-69491-profileImage&quot;);">
                </div> <span class="user">심다예</span>
                <div class="socialing_name">여자들의 로망 폴댄스 체험❤️</div>
                <div> </div>
            </div>
            <div class="col-12 loc_col"> <span class="loc"> <img src="/ic-social-calendar-location-24-px.2d6a2683.svg">
                    ${detail.detailAddress} ・</span><span> ${detail.startDate} ~ ${detail.endDate}</span> </div>
        </div>
        <div class="detail_buttons_row floating row">
            <div class="col">
                <div id="purchase" class="pointer purchase_button"> 소셜링 참여하기 </div>
                <div id="map" style="width:412px;height:400px;top: 50px;right: 20px;"></div>
            </div>
        </div>
    </div>
    <div id="introduce_row" class="detail_content_row row">
        <div class="col-12 p-20"> </div>
        <div class="col-12" id="introduce">${detail.context}
        </div>
    </div>
    <div id="host_row" class="detail_content_row row">
        <div class="col-12">
            <h3 class="sub_title"> 멤버소개 </h3>
            <h2 class="title"> 함께하는 멤버 </h2>
        </div>
        <div class="col-12">
            <div class="host_box pointer row">
                <div class="host_box_detail">
                    <div class="background_col col-auto">
                        <div>
                            <div class="user_cover"
                                style="background-image: url(&quot;https://munto-images.s3.ap-northeast-2.amazonaws.com/production-user/1634097886594-image-69491-profileImage&quot;);">
                            </div> <img class="socialing-host-hand" src="/host_20px.02a2c6f6.svg">
                        </div>
                    </div>
                    <div class="col user_info_col">
                        <div class="user">
                        <c:forEach items="${detail.participate}" var="parti">
  						<br>
						  	${parti.memberNo} /
							${parti.profileImgNo} /
							${parti.nick} /
							${parti.intro} /
						 </c:forEach>
                        </div>
                        <div class="user_grade"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="info_row" class="detail_content_row row">
        <div class="col-12">
            <h3 class="sub_title"> 안내사항 </h3>
            <h2 class="title"> 자세한 정보를 알려드릴게요 </h2>
        </div>
        <div class="col-12">
            <div class="info_row no_padding row">
                <div class="col-auto"> <img src="/2_group_24px.a24d0983.svg"> </div>
                <div class="col info_people">최소 ${detail.minpeople}명 ~ 최대 ${detail.maxpeople}명</div>
            </div>
            <div class="info_row no_padding row">
                <div class="col-auto"> <img src="/3_location_24px.5fffb19f.svg"> </div>
                <div class="col info_location">온라인(오픈채팅)</div>
            </div>
            <div class="info_row no_padding row">
                <div class="col-auto"> <img src="/4_calendar_time_24px.83b374d3.svg"> </div>
                <div class="col info_datetime">${detail.startDate} ~ ${detail.endDate}</div>
            </div>
            <div class="info_price_row info_row no_padding row" style="display: none;">
                <div class="col-auto"> <img src="/info_price.08ff223f.png"> </div>
                <div class="col info_price"></div>
            </div>
        </div>
    </div>
</div>	
	
	
	<script> 
		$(function(){
			let isFull = ${isFull};
			if(isFull){ 
				$("#joinBtn").attr("disabled",true);
			}
			console.log("isFull   "+isFull );
			$("#btn").on("click",function(){
				let status = $(this).data("joined");
				console.log("클릭됨!   "+status);
				let socialForm = $("#socialform");
				let  action = "";
				/* 각 버튼 클릭시 Action 지정. 수정은 페이지 이동 */
				if(status='modify'){
					location.href="${pageContext.request.contextPath}/social/modify/"+${detail.socialNo};
					return ;
				} else if(status=='exit'){
					action = "../socialexit";
				}else{
					action = "../socialjoin";
				}
				console.log("status     "+status);
				console.log("action     "+action);
				socialForm.attr("action",action);
				socialForm.submit();
			});


		});
	</script>
<script type="text/javascript"src="${root}/onemile/resources/js/social/mapRead.js"></script>	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>