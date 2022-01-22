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
.CardTable_itemContainer__3KZ_w{
	display: inline-block;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div>
	<img class="main-image" src="${root}/resources/image/main-logo.png">
    <div>
        <div class="RecommendationDesktop_container__3RLMb">
            <div class="Main_wrap__2jKMu">
                <div class="RecommendationDesktop_innerGroup__as4jB Main_innerWrap__7-_Vm"></div>
            </div>
            <div class="Main_wrap__2jKMu">
        <div class="Main_innerWrap__7-_Vm">
            <div>
                <div class="EarlybirdDesktop_container__1a_Ne">
                    <div class="EarlybirdDesktop_wrap__3k3bW">
                        <div class="title_titleWrapper__1ggAh">
                            <h1 class="title_title__2rv2M">소셜링</h1>
                            <p>서로의 관심사를 함께 즐기는 모임, 소셜링</p>
                        </div>
                    </div>
                    <ul class="EarlybirdDesktop_earlybirdList__3hBAw">
                    	<c:forEach var="SocialIndexVO" items="${socialIndexVOList}">
                        <li class="EarlybirdDesktop_listItem__1aZrM"><a
                                href="${pageContext.request.contextPath}/social/detail/${SocialIndexVO.socialNo}">
                                <div class="CardType_projectCard__3xhjb CardType_earlybirdCard__1t1n1">
                                    <div
                                        class="commons_thumbnail__3wYGv CardType_thumbnail__2dtTe commons_active__1tjD5">
                                        <span class="commons_img__2UTCA commons_visible__1xTJh"
                                            style='background-image: url("${pageContext.request.contextPath}/image/download?imageNo=${SocialIndexVO.imageNo}&folder=social")'></span>
                                    </div>
                                    <div class="CardType_cardContent__3UMOr">
                                        <div>
                                            <p class="CardType_type__El7XP">${SocialIndexVO.bigType}</p>
                                            <div class="commons_content__2K1SH CardType_content__1Pavj">
                                                <h1 class="commons_title__1yGWm">${SocialIndexVO.title}</h1>
                                                <p class="commons_summary__2Ynez"><span
                                                        class="commons_achievementRate__2J-KL">${SocialIndexVO.nick}</span>${SocialIndexVO.smallType}</p>
                                            </div>
                                        </div>
                                        <div class="CardType_earlybirdContent__1b8VN">
                                            <h2 class="CardType_title__2qEmh">${SocialIndexVO.startDate} - ${SocialIndexVO.endDate}</h2>
                                            <p class="CardType_description__2BtXk">${SocialIndexVO.detailAddress}</p>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/social/detail/${SocialIndexVO.socialNo}">
                                        <div class="CardType_linkBtn__1QHvM">지금 참여하기<i
                                                class="wz icon chevron-right"></i></div></a>
                                    </div>
                                </div>
                            </a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
        </div>
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
                                            <a href="${pageContext.request.contextPath}/cobuy/detail/${cobuy.cobuyNo}"
                                                class="RecommendationStoreCard_item__3iMMQ">
                                                <div class="RecommendationStoreCard_thumbnailContainer__mghKx">
                                                    <div class="RecommendationStoreCard_thumbnailPlaceholder__3TTOS"
                                                        style="padding-top: calc(100% - 0px);">
                                                        <div class="RecommendationStoreCard_thumbnail__mis5O"
                                                            style="background-image: url(&quot;${root}/image/download?imageNo=${cobuy.imageNo}&folder=cobuy&quot;);">
                                                        </div>
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
                                    class="CardType_linkThumb__TCaxa" href="${root}/commu/map/list?middleName=${commuList.middleName}">
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
                                                href="${root}/commu/map/list?middleName=${commuList.middleName}">
                                                <div class="CardType_projectCard__3xhjb CardType_projectCardA__33rbP">
                                                    <article>
                                                    	<a href="${root}/commu/map/detail?boardNo=${commuDetailList.commuNo}">
	                                                        <div class="commons_content__2K1SH CardType_content__1Pavj">
	                                                            <h1 class="commons_title__1yGWm">${commuDetailList.title}</h1>
	                                                            <p class="commons_summary__2Ynez"><span
	                                                                    class="commons_achievementRate__2J-KL">${commuDetailList.nick}</span>${commuDetailList.regDate}
	                                                            </p>
	                                                        </div>
                                                        </a>
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
                                    href="${root}/commu/map/list?middleName=${commuList.middleName}">더보기<i
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