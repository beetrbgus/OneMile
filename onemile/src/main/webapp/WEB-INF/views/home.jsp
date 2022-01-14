<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 페이지에서 사용할 JSTL 변수 --%>
<!-- jstl 변수 틀렸음. 수정 필요. -->
<c:set var="login" value="${logId != null}"></c:set>
<c:set var="admin" value="${grade == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${root}/resources/css/9.025b2106.chunk.css">
<link rel="stylesheet" href="${root}/resources/css/common99db3f08.css">
<style>
.main-image{
	width:100%;
	background:whitesmoke;
}
.VisualSlider_container__1pJYR{
	
	border:1px solid black;
	margin-top:50px;
}
.commons_visible__1xTJh{
	background-image: url("${root}/resources/image/commu/${commuList.middleName}.jpg");
}
.RecommendationStore_tableWrap__2rBP7{
	height:275.49px;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div>
	<img src="${root}/resources/image/main-logo.png">
    <div>
        <div class="RecommendationDesktop_container__3RLMb">
            <div class="Main_wrap__2jKMu">
                <div class="RecommendationDesktop_innerGroup__as4jB Main_innerWrap__7-_Vm"></div>
            </div>
            <div class="Main_wrap__2jKMu">
                <div class="RecommendationStore_innerGroup__tYMzy Main_innerWrap__7-_Vm">
                    <div class="RecommendationStore_container__3macz">
                        <div class="RecommendationStore_badgeContainer__33HMF">
                            <div class="RecommendationStore_badge__xCEiV"><span
                                    class="RecommendationStore_storeIcon__DoCqP"></span><span
                                    class="RecommendationStore_text__RmcS7">공동구매</span></div>
                        </div>
                        <div class="RecommendationStore_header__VkYC6">
                            <div class="RecommendationStore_headerText__2_8B0">우리 동네에서 공구!</div>
                        </div>
                        <div class="RecommendationStore_cardList__1FZ5m">
                            <div class="RecommendationStore_tableWrap__2rBP7">
                                <div class="RecommendationStore_tableContent__yUkCF">
                                    <div class="CardTable_container__XsdEp RecommendationStore_cardTable__-AvHK"
                                        style="width: calc(100% - 0px);">
                                        <c:forEach items="${cobuyList}" var="cobuy">
                                        <div aria-hidden="true" class="CardTable_itemContainer__3KZ_w"
                                            style="width: calc((16.6667% - 16px + 2.66667px) - 0.01px);margin-left: 0px;margin-right: 8px;margin-bottom: 0px;">
                                            <a href="/web/store/detail/48?_refer_section_st=storeCurator_0"
                                                class="RecommendationStoreCard_item__3iMMQ">
                                                <div class="RecommendationStoreCard_thumbnailContainer__mghKx">
                                                    <div class="RecommendationStoreCard_thumbnailPlaceholder__3TTOS"
                                                        style="padding-top: calc(100% - 0px);">
                                                        <div class="RecommendationStoreCard_thumbnail__mis5O"
                                                            style="background-image: url(&quot;${root}/image/download?imageNo=${cobuy.imgNo}&folder=cobuy&quot;);">
                                                        </div>
                                                        <div class="RecommendationStoreCard_wadizOnly__zxtNd"></div>
                                                    </div>
                                                </div>
                                                <div class="RecommendationStoreCard_contentContainer__aDF-5">
                                                    <div class="RecommendationStoreCard_projectName__kIgBJ">${cobuy.title}</div>
                                                    <div>
                                                        <div class="RecommendationStoreCard_peopleCount__2AK_E">
                                                            <div class="RecommendationStoreCard_peopleIcon__1RxB1">
                                                            </div><span
                                                                class="RecommendationStoreCard_peopleCountText__15U8g">${cobuy.nick}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a></div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="Main_wrap__2jKMu">
        <div class="Main_innerWrap__7-_Vm">
            <div>
                <div class="EarlybirdDesktop_container__1a_Ne">
                    <div class="EarlybirdDesktop_wrap__3k3bW">
                        <div class="title_titleWrapper__1ggAh">
                            <h1 class="title_title__2rv2M">얼리버드</h1>
                            <p>먼저 참여하는 분들께 드리는 얼리버드 혜택</p>
                        </div>
                    </div>
                    <ul class="EarlybirdDesktop_earlybirdList__3hBAw">
                        <li class="EarlybirdDesktop_listItem__1aZrM"><a
                                href="/web/campaign/detail/132558?_refer_section_st=earlyBird_0" data-ec-id="132558"
                                data-ec-name="[단백질23g, 고작140kcal, 유당0%]찾다 지쳐 내가 만든 프로틴" data-ec-list="earlyBird"
                                data-ec-position="0">
                                <div class="CardType_projectCard__3xhjb CardType_earlybirdCard__1t1n1">
                                    <div
                                        class="commons_thumbnail__3wYGv CardType_thumbnail__2dtTe commons_active__1tjD5">
                                        <span class="commons_img__2UTCA commons_visible__1xTJh"
                                            style="background-image: -webkit-image-set(url(&quot;https://cdn.wadiz.kr/wwwwadiz/green001/2022/0113/20220113135416662_132558.jpg/wadiz/thumbnail/403/format/jpg/quality/95/optimize/&quot;) 1x, url(&quot;https://cdn.wadiz.kr/wwwwadiz/green001/2022/0113/20220113135416662_132558.jpg/wadiz/thumbnail/806/format/jpg/quality/95/optimize/&quot;) 2x);"></span>
                                    </div>
                                    <div class="CardType_cardContent__3UMOr">
                                        <div>
                                            <p class="CardType_type__El7XP">펀딩</p>
                                            <div class="commons_content__2K1SH CardType_content__1Pavj">
                                                <h1 class="commons_title__1yGWm">[단백질23g, 고작140kcal, 유당0%]찾다 지쳐 내가 만든
                                                    프로틴</h1>
                                                <p class="commons_summary__2Ynez"><span
                                                        class="commons_achievementRate__2J-KL">1851%</span>푸드</p>
                                            </div>
                                        </div>
                                        <div class="CardType_earlybirdContent__1b8VN">
                                            <h2 class="CardType_title__2qEmh">[와디즈 한정 혜택] 새해 결심 응원 패키지</h2>
                                            <p class="CardType_description__2BtXk">모두의 단백질 더The23 프로틴 본품 3개 + 나무 스푼 1개
                                                증정</p>
                                            <p class="CardType_subContent__3QETf">67,600원</p>
                                        </div>
                                        <div class="CardType_linkBtn__1QHvM">지금 참여하기<i
                                                class="wz icon chevron-right"></i></div>
                                    </div>
                                </div>
                            </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="Main_wrap__2jKMu">
        <div class="Main_innerWrap__7-_Vm">
            <div class="PlannedDesktop_container__3hnzQ">
                <div>
                    <div class="PlannedDesktop_wrap__gbpbY">
                        <div class="title_titleWrapper__1ggAh">
                            <h1 class="title_title__2rv2M">커뮤니티</h1>
                        </div>
                    </div>
                    <ul class="PlannedDesktop_plannedList__gCt3v">
                        <c:forEach var="commuList" items="${commuDetailVOList}">
                        <li class="PlannedDesktop_listItem__1gYYi">
                            <article class="CardType_projectCard__3xhjb CardType_cardTypePlanned__5H09T"><a
                                    class="CardType_linkThumb__TCaxa" href="/web/wreward/collection/newyearsresolution">
                                    <div
                                        class="commons_thumbnail__3wYGv CardType_keyVisual__LJ58b commons_active__1tjD5">
                                        <span class="commons_img__2UTCA commons_visible__1xTJh"
                                            style="background-image: -webkit-image-set(url(&quot;${root}/resources/image/commu/${commuList.middleName}.jpg&quot;) 1x, url(&quot;${root}/resources/image/commu/${commuList.middleName}.jpg&quot;) 2x);"></span>
                                    </div>
                                </a>
                                <div class="CardType_cardContent__3UMOr">
                                    <h1 class="CardType_title__2qEmh">${commuList.middleName}</h1>
                                    <ul>
                                        <c:forEach var="commuDetailList" items="${commuList.list}">
                                        <li class="CardType_cardList__3AqkY"><a
                                                href="/web/campaign/detail/135443?_refer_section_st=collection-newyearsresolution-0_0">
                                                <div class="CardType_projectCard__3xhjb CardType_projectCardA__33rbP">
                                                    <article>
                                                        <div class="commons_content__2K1SH CardType_content__1Pavj">
                                                            <h1 class="commons_title__1yGWm">${commuDetailList.title}</h1>
                                                            <p class="commons_summary__2Ynez"><span
                                                                    class="commons_achievementRate__2J-KL">${commuDetailList.nick}</span>${commuDetailList.regDate}
                                                            </p>
                                                        </div>
                                                        <div
                                                            class="commons_thumbnail__3wYGv CardType_thumbnail__2dtTe commons_active__1tjD5">
                                                            <span class="commons_img__2UTCA commons_visible__1xTJh"
                                                                style="background-image:url(${root}/image/download?imageNo=${commuDetailList.imageNo}&folder=commu)"></span>
                                                        </div>
                                                    </article>
                                                </div>
                                            </a></li>
                                        </c:forEach>
                                    </ul>
                                </div><a class="CardType_linkBtn__1QHvM"
                                    href="/web/wreward/collection/newyearsresolution">더보기<i
                                        class="wz icon chevron-right"></i></a>
                            </article>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>