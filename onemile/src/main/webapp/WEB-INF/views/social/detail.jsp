<%@ page language="java" contentType="text/html  charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
	<h2>  멤버가 참가한 갯수 해서 참가 불가능하게 만들기. </h2>
	<h2>  공동구매 수정 </h2> 
	<h2>  내 위치 기반으로 만들기 </h2> 
	<h2>  차트 물어보기. </h2> 
	<h2>  신고 기능 </h2> 
	<h2>  관리자 페이지. </h2> 
	
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
	${parti.profileNo} /
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
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>