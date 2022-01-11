<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.d-block{
	width:100%;
	height:300px;
}
img{
	object-fit: cover;
}
.b{
	color:black;
}
.w{
	color:white;
}
</style>

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
							"style='background-image: url(${pageContext.request.contextPath}/image/download?imageNo="+CobuyListVO.imgNo+"&folder=cobuy)'></span>"+
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
		};
	});
</script>

<div class="RewardMainWrapper_container__2HR7Y">
	
	<ul class="RewardMainTab_container__geHTr">
		<li><a aria-current="page" class="RewardMainTab_link___1r2a RewardMainTab_active__1zRir" href="/web/wreward/main"><span>공동구매 홈</span></a>
	</ul>
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-bs-interval="3000">
	     <a href="${root}/cobuy/list/${category}">
	      <img src="${root}/resources/image/beauty.jpg" class="d-block w-100">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="b">[공동구매율 1위]</h3>
	        <p class="b">정말 좋은 제품만 다같이 나누니까.</p>
	      </div>
	      </a>
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	     <a href="${root}/cobuy/list">
	      <img src="${root}/resources/image/fashion.jpg" class="d-block w-100">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="w">해외직구 어려워서 고민이었다면.</h3>
	        <p class="w">내가 찾던 그 옷 여기 있었네?</p>
	      </div>
	      </a>
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	     <a href="${root}/cobuy/list">
	      <img src="${root}/resources/image/food.jpg" class="d-block w-100">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="w">자취 필수품 모음전</h3>
	        <p class="w">혼자 먹기엔 많고 비싸잖아요~</p>
	      </div>
	      </a>
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	     <a href="${root}/cobuy/list">
	      <img src="${root}/resources/image/kids.jpg" class="d-block w-100">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="w">[육아9단 PICK!]</h3>
	        <p class="W">아이의 몸에도, 환경에도 좋은 것만 모았어요.</p>
	      </div>
	      </a>
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	     <a href="${root}/cobuy/list">
	      <img src="${root}/resources/image/living.jpg" class="d-block w-100">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="b">겨울철 나만의 따듯함을 위해.</h3>
	        <p class="b">따듯한 나만의 공간에서 맛있는 귤이라도 먹어요, 우리</p>
	      </div>
	      </a>
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	     <a href="${root}/cobuy/list">
	      <img src="${root}/resources/image/pet.jpg" class="d-block w-100">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="w">루비도 좋아하는 모래</h3>
	        <p class="w">집사님들의 생생후기도 모았습니다!</p>
	      </div>
	      </a>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	<div class="RewardCategoryCircleList_container__1GDge">
		<div class="CategoryCircleList_container__3fAVd"><button
				class="CategoryCircleList_previous__xJMxg CategoryCircleList_hidden__2fdvp" type="button" data-dir="이전"><i
					class="icon chevron-left CategoryCircleList_icon__13sH8" aria-hidden="true"></i></button>
			<!-- 카테고리 시작지점 -->
			
				<div class="CategoryCircleList_wrap__3jHrp">
				<div class="CategoryCircleList_list__2YBF3">
				<c:forEach var="cobuyCatVO" items="${category}">
					<a class="CategoryCircleList_item__2_QZ3 RewardCategoryCircleList_item__2JEvT"
						href="${root}/cobuy${cobuyCatVO.urlPath}">
						<span class="CategoryCircle_container__2rZ3a">
							<span class="CategoryCircle_circle__3khwj"
								style="background-image: url(${root}/resources/image/cobuy/${cobuyCatVO.middleName}.jpg);"></span>
							<span class="CategoryCircle_name__3Ca9T">${cobuyCatVO.middleName}</span>
						</span>
					</a>
					</c:forEach>
				</div>
				</div>
			<!-- 카테고리 끝지점 -->
			<c:if test="${category} > 10">
			<button class="CategoryCircleList_next__1mHyX" type="button" data-dir="다음">
			<i class="icon chevron-right CategoryCircleList_icon__13sH8" aria-hidden="true"></i>
			</button>
			</c:if>
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