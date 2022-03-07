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
<style>
	#carouselExampleFade {
		padding-top: 60px;
	}
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
<script >
var detailAddress="${detail.detailAddress}";
$(function(){
	
	$("#reportBtn").on("click",function(){
		$("body").addClass("ReactModal__Body--open");
	});
});

//회원승인
$(function(){
	$(".socialaprrove").on("click",function(){
		var partiMemberNo = $(this).data("memberno");
		var socialNo = '${detail.socialNo}'
		$.ajax({ 
			url : '${pageContext.request.contextPath}/social/appove',
			type : "post",
			async : false,
			data : { 
				"partiMemberNo" : partiMemberNo,
				
				"socialNo" : socialNo
			},
			success : function(resp) {
				console.log("성공", resp);
					
			
		  	},
	 		error : function(e) {
			  console.log("실패", e);
 		  	}
 		});
	});


//회원거절
	$(".ban").on("click",function(){
		var partiMemberNo = $(this).data("memberno");
		var socialNo = '${detail.socialNo}'
		$.ajax({ 
			url : '${pageContext.request.contextPath}/social/denied',
			type : "post",
			async : false,
			data : { 
				"partiMemberNo" : partiMemberNo,
				
				"socialNo" : socialNo
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
	<c:choose>
		<c:when test="${detail.maxpeople > fn:length(detail.participate)}">
			<c:set value="false" var="isFull"></c:set>
		</c:when>
		<c:otherwise>
			<c:set value="true" var="isFull"></c:set>
		</c:otherwise>
	</c:choose>
<form id="socialform" method="post" action="../socialjoin" >
<input type="hidden" name="socialNo" value="${detail.socialNo}">	
</form> 
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
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<c:forEach items="${detail.imageInfo}" var="imageDTO" varStatus="status">
					    	<button type="button" 
					    		data-bs-target="#carouselExampleIndicators"
					    		data-bs-slide-to="${status.index}" 
					    		class="${status.index == 0 ? 'active' : ''}"
					    		aria-current="${status.index == 0 ? 'true' : ''}"
					    		aria-label="Slide ${status.index+1}"></button>
				    	</c:forEach>
					</div>
					<div class="carousel-inner">
						<c:forEach items="${detail.imageInfo}" var="imageDTO"
							varStatus="status">
							<div
								class="carousel-item ${status.index == 0 ? 'active' : ''}">
								<img src="${pageContext.request.contextPath}/image/download?imageNo=${imageDTO.imageNo}&folder=social" class="d-block w-100" alt="..." style="width:150px;height:350px">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
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
                   		
                    </div>
                </div>
                <div class="detail_info__host__name">${detail.nick}</div>
            </div>
            <div class="detail_info__header">
                <div class="detail_info__title">${detail.title}</div>
            </div>
            <div class="detail_info__location"><span>${detail.startDate} ~ ${detail.endDate}</span></div>
        </div>
    </div>
    <div class="detail_floating_zone" style="position: absolute; top: 530px; width: 430px; right: 350px;">
        <div class="detail_summary_row mt-5 row">
            <div class="col-12 main_col">
                <div class="user_cover"
                    style="background-image">
                	<img class=" image image-round image-border" style="width:300px;height:50px;" src="${pageContext.request.contextPath}/image/download?imageNo=${detail.hostImgNo}&folder=member">
                </div> 
                <span class="user">${detail.nick}</span>
                <div class="socialing_name">${detail.title}</div>
                <div> </div>
            </div>
            <div class="col-12 loc_col"> 
            	<span class="loc">
                   ${detail.detailAddress}</span>
                   <br>
                <span> ${detail.startDate} ~ ${detail.endDate}</span>
            </div>
        </div>
        <div class="detail_buttons_row floating row">
            <div class="col">
                <c:choose>
					<c:when test="${detail.memberNo==logNo}">
						<div class="pointer purchase_button">
							<a href="${pageContext.request.contextPath}/social/modify/${detail.socialNo}"> 
								 수정하기 
							</a>
						</div>
						<div  class="pointer purchase_button" style="margin-top:20px;">
							<a href="${pageContext.request.contextPath}/social/delete/${detail.socialNo}">
								 삭제하기 
							</a>
						</div>
					</c:when>
					<c:when test="${joined eq '수락대기중'}">
						<div id="purchase"   data-joined="exit" class="pointer purchase_button"> 취소하기</div>
					</c:when>
					<c:when test="${detail.memberNo!=logNo and joined eq '참여중'}">
						<div id="purchase"    data-joined="exit" class="pointer purchase_button"> 탈퇴하기 </div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${isFull}">
								<div class="pointer purchase_button"> 모집 인원 완료 </div>
							</c:when>
							<c:otherwise>
								<div id="purchase"   data-joined="join" class="pointer purchase_button"> 소셜링 참여하기 </div>
							</c:otherwise>
						</c:choose>
						
					</c:otherwise>
				</c:choose>
              
                <div id="map" style="width:412px;height:300px;top:50px;right: 20px;"></div>
            </div>
        </div>
    </div>
    <div id="introduce_row" class="detail_content_row row">
        <div class="col-12 p-20"> </div>
        <div class="col-12" id="introduce">
        	${detail.context} 
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
                                style="background-image: url('${pageContext.request.contextPath}/image/download?imageNo=${detail.hostImgNo}&folder=member');">
                            </div>
                        </div>
                    </div>
                    <div class="col user_info_col">
                        <div class="user">
    	                    <c:forEach items="${detail.participate}" var="parti">
							  	<br>
							  	${parti.nick} ·
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
                <div class="col-auto">
                </div>인원 :  
                <div class="col info_people"> 최소 ${detail.minpeople}명 ~ 최대 ${detail.maxpeople}명</div>
            </div>
            <div class="info_row no_padding row">
                <div class="col-auto"></div>
                <div class="col info_location">위치 : ${detail.detailAddress}</div>
            </div>
            <div class="info_row no_padding row">
                <div class="col-auto"></div>
                <div class="col info_datetime">일정 : ${detail.startDate} ~ ${detail.endDate}</div>
            </div>
        </div>
    </div>
</div>	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b89479d3bf4f702a0c7b99d5edfb1391&libraries=services" charset="utf-8"></script>
<script> 
	$(function(){
		//참가자 꽉 차지 않았을 때
		let isFull = ${isFull};
		let status = $("#purchase").data("joined");
		console.log("status "+status);
		if(isFull&&status=='join'){
			console.log("다 참");
			$("#purchase").off('click');
		}
		$("#purchase").on("click",function(){
			console.log("클릭됨!   "+status);
			let socialForm = $("#socialform");
			let  action = "";
			/* 각 버튼 클릭시 Action 지정. 수정은 페이지 이동 */
			let ismyTown = ${ismytown};
			
			if(status=='exit'){
				action = "../socialexit";
			}else{
				action = "../socialjoin";
				
				if(!ismyTown){
					alert("내 동네가 아닙니다. 지역의 소모임을 이용해보세요!");
					return false;
				}
			}
			console.log("status     "+status);
			console.log("action     "+action);
			socialForm.attr("action",action);
			socialForm.submit(); 
		});
		
		console.log("isFull   "+isFull );
	});
</script>
<script>
var lat= ${detail.lat};
var lng= ${detail.lng}; 
</script>
<script type="text/javascript"src="${root}/onemile/resources/js/social/mapRead.js"></script>	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>