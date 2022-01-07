<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- S : MAIN -->
<link rel="stylesheet" href="${root}/resources/css/wdetail.css">
<link rel="stylesheet" href="${root}/resources/css/common.css">
<div id="container" class="wd-layout-sub-content reward actionbar-hide">
	<!-- S : 리워드 헤더 -->
	<div class="reward-header">
		<div class="bg"
			style="background-image: url(${pageContext.request.contextPath}/image/download?imageNo=${detail.imageList[0].imageNo}&folder=cobuy)">
		</div>
		<h2 class="title">${detail.title}</h2>
	</div>
	<!-- E : 리워드 헤더 -->

	<!-- S: 리워드 오픈된 프로젝트 새소식 scroll 포커스 위치 -->
	<div id="openRewardNavigationLocation"></div>
	<!-- E : 리워드 네비게이션 -->
	<div class="reward-body-wrap">
		<!-- S : 서브 컨텐트 영역 -->
		<div class="wd-ui-sub-contents">
			<!-- S : 페이지 레이아웃 컨테이너 -->
			<div class="wd-ui-info-wrap">
				<!-- S : 우측 캠페인 관련 정보 -->
				<div class="wd-ui-sub-opener-info" style="padding-top: 0;">
					<!-- S : 프로젝트 정보 **** 웹 -->
					<h3 class="text-hidden">프로젝트 정보</h3>
					<div class="project-state-info">
						<div class="state-box">

							<p class="remaining-day">20일 남음</p>

							<p class="rate-bar">
								<em style="width: 4748%"></em>
							</p>

							<p class="achievement-rate" style="margin-bottom: 16px;">
								<strong>N명</strong> 구매
							</p>
							<p class="total-amount" style="margin-bottom: 16px;">
								<strong>${detail.price}</strong>원
							</p>
							<p class="total-supporter" style="margin-bottom: 16px;">
								<strong>수량</strong><input type="number" max="${detail.stock}">${detail.stock}
							</p>
						</div>

						<!-- 프로젝트 유형이 글로벌/앵콜 프로젝트가 아닌경우: 기존과 동일하게 처리 -->
						<div class="btn-wrap funding">
							<button type="submit"
								class="wz button primary block btn-reward-funding">구매하기</button>
						</div>
					</div>

					<!-- S : 프로젝트 신고하기 -->
					<div class="wz-message-box project-report">
						<div id="reward-report-content" data-campaign-id="135101"
							data-is-logged-in="false" data-maker-name="(주)투유에이치앤비">
							<div class="RewardProjectReportContainer_container__1XPZm">
								<div class="RewardProjectReportContainer_text__20T0i">
									<img
										src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA0MCA0MCI+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9Imljb240Ij48cmVjdCB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIGZpbGw9Im5vbmUiLz48cGF0aCBkPSJNMzUsMzEuOTRIMzRWMjJBMTQsMTQsMCwwLDAsNiwyMnY5Ljk0SDVhMSwxLDAsMCwwLTEsMVYzN2ExLDEsMCwwLDAsMSwxSDM1YTEsMSwwLDAsMCwxLTFWMzIuOTRBMSwxLDAsMCwwLDM1LDMxLjk0Wk04LDIyYTEyLDEyLDAsMCwxLDI0LDB2OS45NEg4Wk0zNCwzNkg2VjMzLjk0SDM0WiIvPjxyZWN0IHg9IjE5IiB5PSIyIiB3aWR0aD0iMiIgaGVpZ2h0PSI0Ii8+PHJlY3QgeD0iNi4yMSIgeT0iNy4zIiB3aWR0aD0iMiIgaGVpZ2h0PSI0IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNC40NiA3LjgyKSByb3RhdGUoLTQ0Ljk5KSIvPjxyZWN0IHg9IjMwLjY3IiB5PSI4LjI1IiB3aWR0aD0iNCIgaGVpZ2h0PSIyIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzLjAzIDI1LjgxKSByb3RhdGUoLTQ1KSIvPjxwYXRoIGQ9Ik0xMSwyMmgyYTcsNywwLDAsMSw3LTdWMTNBOSw5LDAsMCwwLDExLDIyWiIvPjwvZz48L2c+PC9zdmc+"
										alt="alarm icon">프로젝트에 문제가 있나요?
								</div>
								<span>신고하기<i class="icon chevron-right"
									aria-hidden="true"></i></span>
							</div>
						</div>
					</div>
					<!-- E : 프로젝트 신고하기 -->

					<!--S : 네이버페이 혜택  -->
					<div class="naver-pay-benefits">
						<div id="naver-pay-benefits" data-is-donation-category="false"></div>
					</div>
					<!--E : 네이버페이 혜택  -->

					<!--S : 팔로우활동 정보  -->
					<div class="social-info">
						<a href="/web/campaign/detailBacker/135101">
							<figure>
								<div class="profiles">
									<span
										style="background-image: url(${pageContext.request.contextPath}/image/download?imageNo=${detail.memberImageNo}&folder=member)"></span>
								</div>
								<figcaption>
									<p>
										<strong></strong>
									</p>
								</figcaption>
							</figure> <span class="icon-chevron-right"> </span>
						</a>
					</div>
					<!--E : 팔로우활동 정보  -->
					<!--S : 지지서명 정보  -->
					<h3 class="text-hidden">지지서명</h3>

					<!-- S : 메이커 정보  -->
					<div class="project-maker-info">
						<h3 class="project-right-title">판매자 정보</h3>
						<div id="funding-maker-info" data-enc-user-id="2071478406"
							data-campaign-id="135101"
							data-image-url="${pageContext.request.contextPath}/image/download?imageNo=${detail.memberImageNo}&folder=member"
							data-maker-name="${detail.nick}" data-answer-hour-time="6시간 이내"
							data-host-email="${detail.email}"
							data-host-call-num="${detail.phone}">
							<div class="FundingMakerInfoContainer_container__hy1D5">
								<div class="FundingMakerInfoContainer_header__1pDXk">
									<a class="MakerInfoHeader_link__HmY8C"
										href="${pageContext.request.contextPath}/image/download/image${memberImageNo}">
										<button
											class="Avatar_avatar__CiRY0 Avatar_xs__1Mz7G MakerInfoHeader_avatar__ltZMd">
											<span
												style="background-image: url(${pageContext.request.contextPath}/image/download?imageNo=${detail.memberImageNo}&folder=member);"></span>
										</button>
										<div class="MakerInfoHeader_texts__1vfam">
											<span class="MakerInfoHeader_makerName__KDu0a">${detail.nick}</span>
										</div>
									</a>
									<div class="FundingMakerInfoContainer_contactSection__3NBTk">
										<table class="MakerInfoContactSection_table__-Itp6">
											<tbody>
												<tr>
													<th>이메일</th>
													<td>philotation@gmail.com</td>
												</tr>
												<tr>
													<th>문의전화</th>
													<td>050713980811</td>
												</tr>
											</tbody>
										</table>
									</div>

									<button
										class="AccordionButton_accordionButton__M9bzX FundingMakerInfoContainer_accordionButton__3agGg">
										<svg viewBox="0 0 32 32" focusable="false" role="presentation"
											class="withIcon_icon__2cPeY" aria-hidden="true">
											<path
												d="M16 22.4L5.6 12l1.12-1.12L16 20.16l9.28-9.28L26.4 12 16 22.4z">
											</path>
                                        </svg>
									</button>
								</div>
							</div>
						</div>
					</div>

					<!-- E : 리턴 폼 -->

					<!-- E : 인증 확인 모달 -->
				</div>
				<!-- E : 우측 캠페인 관련 정보 -->

				<!-- S : 캠페인 정보 -->
				<div class="wd-ui-sub-campaign-info-container">
					<div class="wd-ui-sub-campaign-info">
						<!-- S : 탭 주요 콘텐츠 -->
						<div class="wd-ui-tab-contents">
							<section class="wd-ui-tab-contents">
								<h3 class="text-hidden">프로젝트 스토리</h3>
								<!-- 이미지가 아닌 동영상 URL이 넘어오는 경우 iframe에 동영상을 보여줘야 함 -->
								<div class="view-slide-wrap" style="padding: 0">
									<ul
										class="view-slide-big image-slide slick-initialized slick-slider"
										style="">
										<button type="button" class="slick-prev slick-arrow"
											aria-label="Previous" role="button" style="display: block;">Previous</button>
										<!-- 상품 이미지 목록 -->
										<div aria-live="polite" class="slick-list draggable"
											style="height: 401px;">
											<div class="slick-track" style="opacity: 1; width: 3160px;"
												role="listbox">
												<li class="slick-slide slick-current slick-active"
													data-slick-index="0" aria-hidden="false"
													style="width: 632px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;"
													tabindex="-1" role="option"
													aria-describedby="slick-slide00">
													<div class="img-responsive"
														style="background: url('${pageContext.request.contextPath}/image/download?imageNo=${detail.imageList[0].imageNo}&folder=cobuy'); background-size: contain; background-position: center 0; width: 100%; height: 0; padding-bottom: 63.49%;">
													</div>
												</li>
											</div>
										</div>
										<button type="button" data-role="none"
											class="slick-next slick-arrow" aria-label="Next"
											role="button" style="display: block;">Next</button>
									</ul>
								</div>
								<ul class="view-slide-nav" style="display: none">
									<li><img class="img-responsive"
										src="https://cdn.wadiz.kr/wwwwadiz/green001/2021/1209/20211209155515289_135101.jpg/wadiz/format/jpg/quality/80/optimize"
										alt=""></li>
								</ul>
								<script>
									jQuery(function($) {
										$('.view-slide-big.image-slide').show()
												.slick({
													slidesToShow : 1,
													slidesToScroll : 1,
													adaptiveHeight : true,
													fade : true,
													focusOnSelect : true
												});

										// 공간 팝업 show hide
										$(
												'.space-box-container, .space-box-container-small')
												.on(
														'click',
														function() {
															$(
																	'#spaceModalContainer')
																	.css(
																			'display',
																			'block');
														});

										$('.btn-cancel').on(
												'click',
												function() {
													$('#spaceModalContainer')
															.css('display',
																	'none');
												});
									});

									function copy() {
										var inp = document
												.createElement('input');
										document.body.appendChild(inp);
										inp.value = document
												.getElementById("addressText").innerText;
										inp.select();
										document.execCommand('copy', false);
										inp.remove();
										alertify.alert('주소가 복사되었습니다.');
									}
								</script>
								<script src="/resources/static/js/lazysizes.min.js"></script>
								<div class="campaign-title">
									<strong class="title"> ${detail.title}</strong> <span
										class="category icon-label-o" style="color: #495057;">
										<em>${detail.middleName}</em>
									</span>
								</div>
								<div class="campaign-summary"
									style="background-color: #ffffff; color: #495057;">${detail.descript}</div>

								<!-- S : 예약구매 중 글로벌/앵콜 일 경우 노출 -->

								<!-- E : 예약구매 중 글로벌/앵콜 일 경우 노출 -->

								<!-- S : campaign 컨텐츠 -->
								<div class="wd-ui-campaign-content">
									<div class="wd-ui-cont" style="padding-top: 24px;">
										<!-- S : 프로젝트 정보 -->
										<div class="project-state-info">
											<div class="state-box">
												<p class="remaining-day"
													style="margin-bottom: 16px; color: #495057;">${detail.deadLinestr}까지</p>

												<p class="achievement-rate"
													style="margin-bottom: 8px; line-height: 30px; color: #495057;">
													<strong>${detail.customerCnt} </strong>명 구매함
												</p>
												<p class="total-amount"
													style="margin-bottom: 8px; line-height: 30px; color: #495057;">
													<strong>${detail.price}</strong>원
												</p>
												<p class="total-supporter"
													style="margin-bottom: 6px; line-height: 30px; color: #495057;">
													<strong>수량</strong><input type="number"
														max="${detail.stock}">${detail.stock}
												</p>
											</div>
											<script>
												$(function(){
													let deadLine = $(".remaining-day").text();
													console.log("deadLine    "+deadLine);
													let deadLineDate = new Date(deadLine);
													
													console.log("deadLineDate    "+deadLineDate);
												});
											</script>
											<!-- 프로젝트 유형이 글로벌/앵콜 프로젝트가 아닌경우: 기존과 동일하게 처리 -->
											<div class="btn-wrap funding">
												<button onclick="backMoney('backing', 'false');"
													data-event="button-reward-funding"
													class="wz button primary block btn-reward-funding">구매하기</button>
											</div>
										</div>
										<!-- E : 프로젝트 정보 -->
										<!--S : 네이버페이 혜택 모바일 -->
										<div class="naver-pay-benefits">
											<div id="naver-pay-benefits-mobile"
												data-is-donation-category="false"></div>
										</div>
										<!--E : 네이버페이 혜택 모바일 -->

										<div class="project-maker-info">
											<h3 class="project-right-title">판매자 정보</h3>
											<div id="funding-maker-info-2" data-is-mobile="true"
												data-enc-user-id="2071478406" data-campaign-id="135101"
												data-image-url="https://www.wadiz.kr/wwwwadiz/green001/2021/1125/20211125123725333_135101.jpg"
												data-maker-name="비앤힐" data-answer-hour-time="6시간 이내"
												data-member-list="[]" data-host-email="admin@toyouhnb.com"
												data-host-call-num="15448624"
												data-website-a="https://bnheal.co.kr/" data-website-b=""
												data-social-url-fb="" data-social-url-tw=""
												data-social-url-ig="bnheal_official/"
												data-is-preview="false">
												<div class="FundingMakerInfoContainer_container__hy1D5">
													<div class="FundingMakerInfoContainer_header__1pDXk">
														<a class="MakerInfoHeader_link__HmY8C"
															href="/web/maker/detail/3326219?path=reward_detail">
															<button
																class="Avatar_avatar__CiRY0 Avatar_xs__1Mz7G MakerInfoHeader_avatar__ltZMd">
																<span
																	style="background-image: url('${pageContext.request.contextPath}/image/download?imageNo=${detail.memberImageNo}&folder=member');"></span>
															</button>
															<div class="MakerInfoHeader_texts__1vfam">
																<span class="MakerInfoHeader_makerName__KDu0a">${detail.nick}</span><span
																	class="MakerInfoHeader_subInfo__2ZA3n">판매자</span>
															</div>
														</a>
													</div>
												</div>
											</div>
										</div>

										<!-- S : 프로젝트 신고하기 -->
										<div class="wz-message-box project-report-mobile">
											<div id="reward-report-content2" data-campaign-id="135101"
												data-is-logged-in="false" data-maker-name="(주)투유에이치앤비">
												<div class="RewardProjectReportContainer_container__1XPZm">
													<div class="RewardProjectReportContainer_text__20T0i">
														<img
															src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA0MCA0MCI+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9Imljb240Ij48cmVjdCB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIGZpbGw9Im5vbmUiLz48cGF0aCBkPSJNMzUsMzEuOTRIMzRWMjJBMTQsMTQsMCwwLDAsNiwyMnY5Ljk0SDVhMSwxLDAsMCwwLTEsMVYzN2ExLDEsMCwwLDAsMSwxSDM1YTEsMSwwLDAsMCwxLTFWMzIuOTRBMSwxLDAsMCwwLDM1LDMxLjk0Wk04LDIyYTEyLDEyLDAsMCwxLDI0LDB2OS45NEg4Wk0zNCwzNkg2VjMzLjk0SDM0WiIvPjxyZWN0IHg9IjE5IiB5PSIyIiB3aWR0aD0iMiIgaGVpZ2h0PSI0Ii8+PHJlY3QgeD0iNi4yMSIgeT0iNy4zIiB3aWR0aD0iMiIgaGVpZ2h0PSI0IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNC40NiA3LjgyKSByb3RhdGUoLTQ0Ljk5KSIvPjxyZWN0IHg9IjMwLjY3IiB5PSI4LjI1IiB3aWR0aD0iNCIgaGVpZ2h0PSIyIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzLjAzIDI1LjgxKSByb3RhdGUoLTQ1KSIvPjxwYXRoIGQ9Ik0xMSwyMmgyYTcsNywwLDAsMSw3LTdWMTNBOSw5LDAsMCwwLDExLDIyWiIvPjwvZz48L2c+PC9zdmc+"
															alt="alarm icon">프로젝트에 문제가 있나요?
													</div>
													<span>신고하기<i class="icon chevron-right"
														aria-hidden="true"></i></span>
												</div>
											</div>
										</div>
										<!-- E : 프로젝트 신고하기 -->

										<!-- S : 프로젝트 내용 -->
										<div id="introdetails" style="height: auto;" class="story">
											<strong class="title">물품 설명</strong>
											<div class="delivery-info">
												<i class="icon"></i>구매자님은 반드시 수령장소를 확인해주세요.
											</div>
											<!--글 내용 (이미지) -->
											<div class="inner-contents fr-view">
												<p>${detail.descript}</p>
												<c:forEach items="${detail.imageList}" var="item">
													<p>
														<img class="fr-fic fr-dib lazyloaded" data-width="750"
															data-height="400" style=""
															src="${pageContext.request.contextPath}/image/download?imageNo=${item}&folder=cobuy">
													</p>
												</c:forEach>
											</div>
										</div>
										<!-- E : 프로젝트 내용 -->

										<!-- 공간 노출 배너 -->

										<!-- 공간 노출 배너 -->
									</div>
								</div>
								<!-- E : campaign 컨텐츠 -->
								<div class="banner-section-RB1"></div>
								<input type="hidden" id="movieembed" value="">
							</section>
						</div>

					</div>
					<!-- E : 탭 주요 콘텐츠 -->
				</div>
			</div>
		</div>
		<!-- E : 페이지 레이아웃 컨테이너 -->
	</div>
	<!-- E : 서브 컨텐트 영역 -->
</div>

<input type="hidden" name="cobuyNo" value="${detail.getCobuyNo()}">
<input type="text" name="cobuyNo" value="${detail.getCobuyNo()}">
<!-- 대표 이미지 , 나머지 이미지 -->
<!-- 상품 테이블 -  제목 , 마감기한 , 구매자 명수 , 가격  
	상품 설명 , 상품 이미지 나머지. -->
<!-- 판매자 테이블 - 프로필 사진 ,회원번호 닉네임 , 이메일  , 전화 -->
<!-- 지도 테이블 - 위도,경도 ,상세주소 -->

<!-- 판매자 영역 -->
<p>${detail.memberImageNo}</p>
<p>${detail.nick}</p>
<p>${detail.email}</p>
<p>${detail.phone}</p>
<!-- 지도 영역 -->
<p>${detail.lat}</p>
<p>${detail.lng}</p>
<p>수령 장소 : ${detail.detailAddress}</p>
<p>${detail.lat}</p>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 1
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	infowindow = new kakao.maps.InfoWindow({
		zindex : 1
	}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>