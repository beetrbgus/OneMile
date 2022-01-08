<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	$(function () {
		var page = 1;
		var size = 20;

		$(".ProjectListMoreButton_button__27eTb").click(function () {
			loadData(page, size);
			page++;
		});

		$(".ProjectListMoreButton_button__27eTb").click();

		function loadData(page, size, middleName) {

			$.ajax({
				url: "${pageContext.request.contextPath}/cobuy/listdetail",
				type: "get",
				data: {
					page: page,
					size: size
				},
				success: function (resp) {
					if (resp.length < size) {
						$(".more-btn").remove();
					}
					for (var i = 0; i < resp.length; i++) {
						var date = new Date(resp[i].deadLine);
						var dateString = date.getFullYear()+"년 "+date.getMonth()+1+"월 "+date.getDate()+"일 "+date.getHours()+"시 "+date.getMinutes()+"분 "+date.getSeconds()+"초";

						var CobuyListVO = resp[i];
						console.log(CobuyListVO.cobuyNo);
						console.log(typeof CobuyListVO.cobuyNo);
						var divCol=
							"<div class='ProjectCardList_item__1owJa'>"+
							"<div>"+
							"<div class='CommonCard_container__e_ebQ CommonCard_squareSmall__1Cdkn'>"+
							"<a href='detail?cobuyNo="+CobuyListVO.cobuyNo+
							"' class='CardLink_link__1k83H CommonCard_image__vaqkf' aria-hidden='true' tabindex='-1'>"+
							"<div class='CommonCard_rect__2wpm4'>"+
							"<span class='CommonCard_background__3toTR CommonCard_visible__ABkYx'"+
							"style='background-image: url(${pageContext.request.contextPath}/image/download?imageNo=${CobuyListVO.imgNo}&folder=cobuy)'></span>"+
							"</div>"+
							"</a>"+
							"<div class='CommonCard_info__1f4kq'>"+
							"<div class='RewardProjectCard_info__3JFub'>"+
							"<div class='RewardProjectCard_infoTop__3QR5w'>"+
							"<a href='detail?cobuyNo="+CobuyListVO.cobuyNo+
							"' class='CardLink_link__1k83H'>"+
							"<p class='CommonCard_title__1oKJY RewardProjectCard_title__iUtvs'>"+
							"<strong>"+CobuyListVO.pname+"<br>"+CobuyListVO.title+"</strong>"+
							"</p>"+
							"</a>"+
							"<div>"+
							"<span class='RewardProjectCard_makerName__2q4oH'>"+CobuyListVO.nick+"</span>"+		
							"</div></div><div class='RewardProjectCard_gauge__3p9US'>"+		
							"<span style='width: 100%;'></span>"+
							"</div>"+
							"<span class='RewardProjectCard_percent__3TW4_'>"+CobuyListVO.stock+"개 남음</span>"+
							"<span class='RewardProjectCard_amount__2AyJF'>"+CobuyListVO.price+"원</span>"+
							"<span class='RewardProjectCard_days__3eece RewardProjectCard_isAchieve__1LcUu'>"+
							"<span class='RewardProjectCard_remainingDay__2TqyN'>"+dateString+"</span>"+
							"<span class='RewardProjectCard_remainingDayText__2sRLV'>마감</span>"+
							"<span class='RewardProjectCard_isAchieve__1LcUu'></span></span></div></div></div></div></div>";
						$(".ProjectCardList_list__1YBa2").append(divCol);
					}
				},
				error: function (e) {
					console.log("실패", e);
				}
			});
		}
	});
</script>

<div class="RewardMainWrapper_container__2HR7Y">
	<div class="VisualSlider_container__1pJYR">
		<div class="slick-slider slick-initialized" dir="ltr">
			<div class="slick-list">
				<div class="slick-track" style="width: 14170px; opacity: 1; transform: translate3d(-3270px, 0px, 0px);">
					<div data-index="-1" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
						style="width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/wreward/collection/selfdevelopment?order=recommend&amp;endYn=N&amp;_refer_section_st=RMK_5"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170626735_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">새해 자기계발을 위한<br>출판 클래스 기획전</p>
											<p class="VisualSlide_badge__HWnUy">펀딩으로 이루는 새해 계획</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
					<div data-index="0" class="slick-slide" tabindex="-1" aria-hidden="true"
						style="outline: none; width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/wcomingsoon/rwd/135211?acid=10013966&amp;_refer_section_st=RMK_0"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn1.wadiz.kr/images/20220107/1641513132430.png/wadiz/optimize&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">NEW 특대형 카본핸들<br>10년 쓰는 풀카본 우산</p>
											<p class="VisualSlide_badge__HWnUy">가벼운 무게로 장시간 들어도 부담 없어요</p>
										</div>
									</div>
									<div class="banner_adBadge__2iyux banner_keyVisual__1TLsm">AD</div>
								</a></div>
						</div>
					</div>
					<div data-index="1" class="slick-slide" tabindex="-1" aria-hidden="true"
						style="outline: none; width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/campaign/detail/124953?_refer_section_st=RMK_1"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170733696_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">탄산 조절 가능한 <br>필립스 소다메이커</p>
											<p class="VisualSlide_badge__HWnUy">집에서 내려마시는 이태리 탄산수</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
					<div data-index="2" class="slick-slide slick-active slick-current" tabindex="-1" aria-hidden="false"
						style="outline: none; width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/campaign/detail/111414?_refer_section_st=RMK_2"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170822923_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">[50주년 한정판]<br>올드 성음기타 복각 프로젝트</p>
											<p class="VisualSlide_badge__HWnUy">빈티지 감성과 기술력의 만남</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
					<div data-index="3" class="slick-slide" tabindex="-1" aria-hidden="true"
						style="outline: none; width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/campaign/detail/121576?acid=10013914&amp;_refer_section_st=RMK_3"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn1.wadiz.kr/images/20220104/1641276801405.png/wadiz/optimize&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">미국 실리콘밸리에서<br>소문난 그 백팩</p>
											<p class="VisualSlide_badge__HWnUy">마그네틱 기능을 탑재한 원터치 사이드 포켓</p>
										</div>
									</div>
									<div class="banner_adBadge__2iyux banner_keyVisual__1TLsm">AD</div>
								</a></div>
						</div>
					</div>
					<div data-index="4" class="slick-slide" tabindex="-1" aria-hidden="true"
						style="outline: none; width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/campaign/detail/127645?_refer_section_st=RMK_4"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170948420_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">세균과 냄새 잡는<br>UV 공기청정 고양이 화장실</p>
											<p class="VisualSlide_badge__HWnUy">모든 모래를 거침없이 살균</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
					<div data-index="5" class="slick-slide" tabindex="-1" aria-hidden="true"
						style="outline: none; width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/wreward/collection/selfdevelopment?order=recommend&amp;endYn=N&amp;_refer_section_st=RMK_5"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170626735_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">새해 자기계발을 위한<br>출판 클래스 기획전</p>
											<p class="VisualSlide_badge__HWnUy">펀딩으로 이루는 새해 계획</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
					<div data-index="6" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
						style="width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/wcomingsoon/rwd/135211?acid=10013966&amp;_refer_section_st=RMK_0"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn1.wadiz.kr/images/20220107/1641513132430.png/wadiz/optimize&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">NEW 특대형 카본핸들<br>10년 쓰는 풀카본 우산</p>
											<p class="VisualSlide_badge__HWnUy">가벼운 무게로 장시간 들어도 부담 없어요</p>
										</div>
									</div>
									<div class="banner_adBadge__2iyux banner_keyVisual__1TLsm">AD</div>
								</a></div>
						</div>
					</div>
					<div data-index="7" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
						style="width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/campaign/detail/124953?_refer_section_st=RMK_1"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170733696_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">탄산 조절 가능한 <br>필립스 소다메이커</p>
											<p class="VisualSlide_badge__HWnUy">집에서 내려마시는 이태리 탄산수</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
					<div data-index="8" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
						style="width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/campaign/detail/111414?_refer_section_st=RMK_2"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170822923_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">[50주년 한정판]<br>올드 성음기타 복각 프로젝트</p>
											<p class="VisualSlide_badge__HWnUy">빈티지 감성과 기술력의 만남</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
					<div data-index="9" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
						style="width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/campaign/detail/121576?acid=10013914&amp;_refer_section_st=RMK_3"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn1.wadiz.kr/images/20220104/1641276801405.png/wadiz/optimize&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">미국 실리콘밸리에서<br>소문난 그 백팩</p>
											<p class="VisualSlide_badge__HWnUy">마그네틱 기능을 탑재한 원터치 사이드 포켓</p>
										</div>
									</div>
									<div class="banner_adBadge__2iyux banner_keyVisual__1TLsm">AD</div>
								</a></div>
						</div>
					</div>
					<div data-index="10" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
						style="width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/campaign/detail/127645?_refer_section_st=RMK_4"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170948420_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">세균과 냄새 잡는<br>UV 공기청정 고양이 화장실</p>
											<p class="VisualSlide_badge__HWnUy">모든 모래를 거침없이 살균</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
					<div data-index="11" tabindex="-1" class="slick-slide slick-cloned" aria-hidden="true"
						style="width: 1090px;">
						<div>
							<div><a href="https://www.wadiz.kr/web/wreward/collection/selfdevelopment?order=recommend&amp;endYn=N&amp;_refer_section_st=RMK_5"
									class="VisualSlide_container__1lgSN"
									style="background-image: url(&quot;https://cdn.wadiz.kr/ft/images/green001/2022/0107/20220107170626735_4674.jpg/wadiz/optimize/&quot;);">
									<div class="VisualSlide_wrap__11Qnk">
										<div class="VisualSlide_text__1vRyr">
											<p class="VisualSlide_title__gELf9">새해 자기계발을 위한<br>출판 클래스 기획전</p>
											<p class="VisualSlide_badge__HWnUy">펀딩으로 이루는 새해 계획</p>
										</div>
									</div>
								</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="VisualSlider_wrap__3EXSw">
			<div class="VisualSlider_arrows__1fumY"><button type="button" class="VisualSlider_prev__Pmrvq"><i
						class="icon chevron-left VisualSlider_icon__23oWk" aria-hidden="true"></i></button><button
					type="button" class="VisualSlider_next__3BJKN"><i
						class="icon chevron-right VisualSlider_icon__23oWk" aria-hidden="true"></i></button></div>
			<div class="VisualSlider_active__2izqv">
				<div style="width: 50%;"></div>
			</div>
		</div>
	</div>
	<div class="RewardCategoryCircleList_container__1GDge">
		<div class="CategoryCircleList_container__3fAVd"><button
				class="CategoryCircleList_previous__xJMxg CategoryCircleList_hidden__2fdvp" type="button" data-dir="이전"><i
					class="icon chevron-left CategoryCircleList_icon__13sH8" aria-hidden="true"></i></button>
			<!-- 카테고리 시작지점 -->
			<div class="CategoryCircleList_wrap__3jHrp">
				<div class="CategoryCircleList_list__2YBF3">
					<a class="CategoryCircleList_item__2_QZ3 RewardCategoryCircleList_item__2JEvT"
						href="/web/wreward/category/categorybanner?category_name=%EC%97%B0%ED%9C%B4%20%EC%A0%84%20%EB%B0%B0%EC%86%A1">
						<span class="CategoryCircle_container__2rZ3a">
							<span class="CategoryCircle_circle__3khwj"
								style="background-image: url(&quot;https://www.wadiz.kr/ft/images/green001/2022/0107/20220107113912194_null.jpg&quot;);"></span>
							<span class="CategoryCircle_name__3Ca9T">연휴 전 배송</span>
						</span>
					</a>
				</div>
			</div>
			<!-- 카테고리 끝지점 -->
			<button class="CategoryCircleList_next__1mHyX" type="button" data-dir="다음"><i
					class="icon chevron-right CategoryCircleList_icon__13sH8" aria-hidden="true"></i></button>
		</div>
	</div>
	<div class="RewardProjectListApp_container__1ZYeD">
		<div class="ProjectListHead_container__rpQ37 RewardProjectListHead_container__2FzIj">
			<!-- 검색기능
						<div class="ProjectListHead_bar__2dyHz">
						<form class="ProjectListHead_search__HN3am"><label
								for="search-keyword-4933f540-0608-4b63-9ad6-cccdc2960908"><input class=""
									id="search-keyword-4933f540-0608-4b63-9ad6-cccdc2960908" type="search"
									placeholder="검색" value="">
								<div class="ProjectListHead_right__3_Jo1"><button type="submit"
										class="ProjectListHead_find__3HsFc" aria-label="검색"><i
											class="icon search"></i></button></div>
							</label></form>
						<div
							class="SortingSelect_container__3voSC ProjectListHead_sorting__2n1WY RewardProjectListHead_fundingSorting__2n0MF">
							전체<i class="icon expand-more SortingSelect_icon__khE3_"
								aria-hidden="true"></i><select name="status"
								class="SortingSelect_select__23ANT">
								<option value="ALL">전체</option>
								<option value="N">진행중</option>
								<option value="Y">종료된</option>
							</select></div>
						<div class="SortingSelect_container__3voSC ProjectListHead_sorting__2n1WY">추천순<i
								class="icon expand-more SortingSelect_icon__khE3_"
								aria-hidden="true"></i><select name="order" class="SortingSelect_select__23ANT">
								<option value="recommend">추천순</option>
								<option value="popular">인기순</option>
								<option value="amount">펀딩액순</option>
								<option value="closing">마감임박순</option>
								<option value="recent">최신순</option>
								<option value="support">응원참여자순</option>
							</select></div>
						<div class="ProjectListHead_children__2Y7-F"></div><button
							class="ProjectListHead_cardType__2_YL4"></button>
					</div>-->
			<div class="ProjectListHead_children__2Y7-F"></div>
		</div>
		<div class="ProjectCardList_container__3Y14k">
			<div class="ProjectCardList_list__1YBa2">
			</div>
			<div>
				<div class="ProjectListMoreButton_container__1JFxX ProjectCardList_more__3AbzT"><button type="button"
						class="ProjectListMoreButton_button__27eTb">더보기<i class="icon expand-more"
							aria-hidden="true"></i></button>
					<div class="wz-loader ProjectListMoreButton_loader__1Kcvt"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>