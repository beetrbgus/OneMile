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
<%-- <p>번호 : ${detail.socialNo}</p>

	<h2>  멤버가 참가한 갯수 해서 참가 불가능하게 만들기. </h2>
	<h2>  공동구매 수정 </h2> 
	<h2>  내 위치 기반으로 만들기 </h2> 
	<h2>  차트 물어보기. </h2> 
	<h2>  신고 기능 </h2> 
	<h2>  관리자 페이지. </h2> 
	
  <p>번호 : ${detail.socialNo}</p>
	<p>제목 : ${detail.title}</p> --%>
	
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
                <div id="carouselExampleFade"
								class="carousel slide carousel-fade" data-bs-ride="carousel" >
								<div class="carousel-inner">
									<c:forEach items="${detail.imageInfo}" var="imageDTO"
										varStatus="status">
										<div
											class="carousel-item ${status.index == 0 ? 'active' : ''}">
											<img src="${pageContext.request.contextPath}/image/download?imageNo=${imageDTO.imageNo}&folder=social" class="d-block w-100" alt="..." style="width:150px;height:350px">
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
                
                </div> <span class="user">모임장 닉네임${detail.nick}</span>
                <div class="socialing_name">${detail.title}</div>
                <div> </div>
            </div>
            <div class="col-12 loc_col"> <span class="loc">
                    ${detail.detailAddress}</span>
                    <br>
                    <span> ${detail.startDate} ~ ${detail.endDate}</span> </div>
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
								<div  id="purchase"   data-joined="join" class="pointer purchase_button"> 소셜링 참여하기 </div>
							</c:otherwise>
						</c:choose>
						
						<!-- 신고하기 -->
						<form>
						<div class="wz-message-box project-report">
						<div id="reward-report-content" data-campaign-id="135101" data-is-logged-in="false" data-maker-name="(주)투유에이치앤비">
							<div class="RewardProjectReportContainer_container__1XPZm">
								<div class="RewardProjectReportContainer_text__20T0i">
									<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA0MCA0MCI+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9Imljb240Ij48cmVjdCB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIGZpbGw9Im5vbmUiLz48cGF0aCBkPSJNMzUsMzEuOTRIMzRWMjJBMTQsMTQsMCwwLDAsNiwyMnY5Ljk0SDVhMSwxLDAsMCwwLTEsMVYzN2ExLDEsMCwwLDAsMSwxSDM1YTEsMSwwLDAsMCwxLTFWMzIuOTRBMSwxLDAsMCwwLDM1LDMxLjk0Wk04LDIyYTEyLDEyLDAsMCwxLDI0LDB2OS45NEg4Wk0zNCwzNkg2VjMzLjk0SDM0WiIvPjxyZWN0IHg9IjE5IiB5PSIyIiB3aWR0aD0iMiIgaGVpZ2h0PSI0Ii8+PHJlY3QgeD0iNi4yMSIgeT0iNy4zIiB3aWR0aD0iMiIgaGVpZ2h0PSI0IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNC40NiA3LjgyKSByb3RhdGUoLTQ0Ljk5KSIvPjxyZWN0IHg9IjMwLjY3IiB5PSI4LjI1IiB3aWR0aD0iNCIgaGVpZ2h0PSIyIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzLjAzIDI1LjgxKSByb3RhdGUoLTQ1KSIvPjxwYXRoIGQ9Ik0xMSwyMmgyYTcsNywwLDAsMSw3LTdWMTNBOSw5LDAsMCwwLDExLDIyWiIvPjwvZz48L2c+PC9zdmc+" alt="alarm icon">상품에 문제가 있나요?
								</div>
								<input type="hidden" name="soclaiNo" value="${detail.socialNo}">
								<input type="hidden" name="type" value="social">
								
								<span><button type="button" id="reportBtn">신고하기</button><i class="icon chevron-right" aria-hidden="true"></i></span></a>
							
								</div>
						</div>
					</div>
                	</form>
              												
                <div id="map" style="width:412px;height:300px;top:50px;right: 20px;"></div>
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
                                style="background-image: url('${pageContext.request.contextPath}/image/download?imageNo=${detail.hostImgNo}&folder=member');">
                            </div>
                        </div>
                    </div>
                    <div class="col user_info_col">
                      <div class="user">
                        
                        <c:forEach items="${detail.participate}" var="parti">
							  	<br>
							  	${parti.nick} 
                      			<c:choose>
                     				<c:when test="${detail.memberNo==logNo}">
                     					<c:choose>
							  				<c:when test= "${parti.isJoined eq '수락대기중'}">
							  					<button type="button" class="socialaprrove" data-memberno="${parti.memberNo}">수락하기</button>
							  					<button type="button" class="ban" data-memberno="${parti.memberNo}">거절하기</button>
							  				</c:when>
							  				<c:otherwise>
							  					<button type="button" class="ban" data-memberno="${parti.memberNo}">강퇴하기</button>
							  				</c:otherwise>
							  			</c:choose>
                     				</c:when>
                     			</c:choose>
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
            <div class="info_price_row info_row no_padding row" style="display: none;">
                <div class="col-auto"> <img src="/info_price.08ff223f.png"> </div>
                <div class="col info_price"></div>
            </div>
        </div>
    </div>
</div>	
	
	
	<script> 
		$(function(){
			//참가자 꽉 찼을 때
			let isFull = ${isFull};
			if(!isFull){ 
				$("#purchase").on("click",function(){
					let status = $(this).data("joined");
					console.log("클릭됨!   "+status);
					let socialForm = $("#socialform");
					let  action = "";
					/* 각 버튼 클릭시 Action 지정. 수정은 페이지 이동 */
					if(status=='exit'){
						action = "../socialexit"; 
					}else{
						action = "../socialjoin"; 
					}
					console.log("status     "+status);
					console.log("action     "+action);
					socialForm.attr("action",action);
					socialForm.submit(); 
				});
			}
			console.log("isFull   "+isFull );
			// 내 동네일때
			let ismyTown = ${ismytown};
			if(!ismyTown){
				$("#purchase").attr("disabled",true);
			}

		});
	</script>
<script type="text/javascript"src="${root}/onemile/resources/js/social/mapRead.js"></script>	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>