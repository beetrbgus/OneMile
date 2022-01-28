<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
  .outer2 {
	display: flex;
	justify-content: center;
	margin-top:200px;
}
.iAkHpv main {
    width: 100%;
    padding-left: 3.125rem;
    padding-right: 3.125rem;
}

.iAkHpv main {
    margin-left: auto;
    margin-right: auto;
    padding: 1.5rem;
    width: 1184px;
}

* {
    -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
}

* {
    box-sizing: inherit;
}
사용자 에이전트 스타일시트
main {
    display: block;
}

body, html {
    height: 100%;
    min-height: 100%;
    font-size: 16px;
    box-sizing: border-box;
}

body {
    background-color: rgb(249, 249, 249);
    margin: 0px;
    -webkit-font-smoothing: antialiased;
    font-family: "Noto Sans KR", sans-serif, 나눔고딕, 돋움, Dotum, 굴림, Gulim, "Apple SD Gothic Neo" !important;
}
h1, h2, h3, h4, h5 {
    font-family: inherit;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.ZcoDs {
    padding-top: 1.5rem;
    padding-bottom: 1.5rem;
}
.ZcoDs .name {
    font-size: 1.1rem;
    margin-top: 0.25rem;
    font-weight: 600;
}
.ZcoDs .expense {
    text-align: right;
    margin-top: 0.25rem;
    font-size: 1.1rem;
}
.ZcoDs .date {
    color: rgb(99, 99, 99);
    font-size: 0.9rem;
}
</style>

<div class="outer2" style="margin-top: 70px">
<div style="width: 1000px" style="margin-top: 70px">
<main style="margin-top: 70px">
    <h2 class="wz text display2 page-title">이용내역</h2>
    <div class="PurchaseHistory__Block-wpufov-2 dUCAhU" style="margin-top: 70px">
        <div class="TransactionItem__Block-sc-1naw9lz-0 ZcoDs">
        	<c:forEach var="membershipBuyDTO" items="${list}">
           	<c:if test="${membershipBuyDTO.mspNo ne 1}">
           	<c:set var="buyDate"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${membershipBuyDTO.buyTime}" /></c:set>
           	<c:set var="endDate"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${membershipBuyDTO.buyEndtime}" /></c:set>
	            <div class="date">${buyDate} ~ ${endDate}</div>
	            <div class="name">
	            	<span class="TransactionItem__Name-sc-1naw9lz-1 fba-dEH">${membershipBuyDTO.itemName}</span></div>
	            <div class="expense">
	            	<span class="method">카카오페이</span>
	            	<span class="price">  ${membershipBuyDTO.totalAmount}원</span></div> 
	            <c:if test="${membershipBuyDTO.hiddenYN == 'Y'}">
	            	<div style="float:right">
						<a href="${pageContext.request.contextPath}/pay/regular/disabled?sid=${membershipBuyDTO.sid}"  onclick="produceBtn();">[멤버십 중지]</a>
					</div>
				</c:if>
			</c:if>
            </c:forEach>
        </div>
        <div class="PurchaseHistory__FetchingNext-wpufov-0 guWliA"></div>
    </div>
    
</main>
</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>