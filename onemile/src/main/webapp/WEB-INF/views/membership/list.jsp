<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.elaFmh {
	position: relative;
	padding: 1.5rem;
	border-radius: 0.25rem;
	width: 36.25rem;
	background: white;
	border: 1px solid rgb(238, 238, 238);
	color: rgb(18, 18, 18);
}

.elaFmh h2 {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	margin: 0px;
	line-height: 1.5;
	font-size: 1.5rem;
}

.huLQLR:hover {
	background: rgb(217, 211, 255);
}

.huLQLR {
	width: 100%;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	border-radius: 4px;
	cursor: pointer;
	transition: all 0.08s ease-in 0s;
	font-size: 1.125rem;
	letter-spacing: -0.05rem;
	background: rgb(240, 237, 255);
	color: rgb(129, 107, 255);
	font-weight: bold;
	height: 3.5rem;
}
.PSOwf svg {
	width: 1.5rem;
	margin-right: 0.25rem;
	color: rgb(129, 107, 255);
}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
.outer2 {
  display: flex;
  justify-content: center;
}
</style>
<script>
	$(function() {
		$("input[name='isselect']:radio").change(function() {
			//라디오 버튼 값을 가져온다.
			var no = this.value;
			$("#productNo").val(no);
		});
		$("#submitBtn").on("click", function() {

			$("#submitForm").submit();
		});
	});
</script>
<h2 class="wz text display2 page-title" style="text-align: center;margin-top: 30px;">멤버십 목록</h2>
<c:forEach var="MembershipListVO" items="${list}" >
	
	<div class="outer2" style="margin-top: 20px;">
	<div class="MembershipProductCard__Card-sc-12c6erg-0 elaFmh" >
	<input class="productNo" name="isselect" type="radio" value="${MembershipListVO.mspNo}">
		<h2>${MembershipListVO.mspProduct}</h2>
		<div class="price">
			<span class="">가격 : ${MembershipListVO.mspPrice}원</span>
		</div>
		<div class="descriptions">
				<div
				class="MembershipProductCard__DescriptionLine-sc-12c6erg-1 PSOwf">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
					xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd"
						d="M18.576 7.23c.487.364.566 1.026.176 1.48l-6.782 7.895c-.201.234-.5.377-.82.393a1.178 1.178 0 01-.862-.306L6.33 13.008a1.002 1.002 0 010-1.49 1.19 1.19 0 011.599 0l3.063 2.853 5.994-6.976c.39-.454 1.101-.527 1.589-.164z"
						fill="currentColor"></path>
                </svg>
				<span>소셜생성갯수 : ${MembershipListVO.SRegCnt}개</span>
			</div>
			<div
				class="MembershipProductCard__DescriptionLine-sc-12c6erg-1 PSOwf">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
					xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd"
						d="M18.576 7.23c.487.364.566 1.026.176 1.48l-6.782 7.895c-.201.234-.5.377-.82.393a1.178 1.178 0 01-.862-.306L6.33 13.008a1.002 1.002 0 010-1.49 1.19 1.19 0 011.599 0l3.063 2.853 5.994-6.976c.39-.454 1.101-.527 1.589-.164z"
						fill="currentColor"></path>
                </svg>
				<span>소셜최대인원 : ${MembershipListVO.SMaxCnt}명</span>
			</div>
			<div
				class="MembershipProductCard__DescriptionLine-sc-12c6erg-1 PSOwf">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
					xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd"
						d="M18.576 7.23c.487.364.566 1.026.176 1.48l-6.782 7.895c-.201.234-.5.377-.82.393a1.178 1.178 0 01-.862-.306L6.33 13.008a1.002 1.002 0 010-1.49 1.19 1.19 0 011.599 0l3.063 2.853 5.994-6.976c.39-.454 1.101-.527 1.589-.164z"
						fill="currentColor"></path>
                </svg>
			<span>닉네임 변경가능 : ${MembershipListVO.NModTime}일</span>
		</div>
	</div>
	</div>
	</div>
</c:forEach>
<div class="outer2">
<button id="submitBtn" type="button" class="Button__StyledButton-sc-1o33g42-0 huLQLR" style="width:580px;height:50px">시작하기</button>
</div>
<form id="submitForm" action="${pageContext.request.contextPath}/membership/confirm" method="get">
	<input id="productNo" type="hidden" name="productNo" value="">
	<input name="quantity" type="hidden" value="1">
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>