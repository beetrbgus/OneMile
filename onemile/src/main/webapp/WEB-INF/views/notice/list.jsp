<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="login" value="${logId != null}"></c:set>
<c:set var="admin" value="${grade == '관리자'}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.more-btn {
	margin-top: 1rem;
	font-size: 15px;
}
</style>
<script>
	$(function() {
		var page = 1;
		var size = 12;
		var category = $("h2").data("middle-name");

		$(".more-btn").click(function() {
			loadData(page, size, category);
			page++;
		});

		$(".more-btn").click();

		function loadData(page, size, middleName) {

			$.ajax({
				url : "${pageContext.request.contextPath}/commu/notmap/listdetail",
				type : "get",
				data : {
					middleName : middleName,
					page : page,
					size : size
				},
				success : function(resp) {

					if (resp.length < size) {
						$(".more-btn").remove();
					}
					for (var i = 0; i < resp.length; i++) {
						var commuVo = resp[i];
						var c = commuVo.imageNo != 0;
						var divCol = "<ul>"
							+ "<li>"
								+ "<a class='article' href='${pageContext.request.contextPath}/notice/detail/"
								+ resp[i].commuNo
								+ "'>"
								+ "<div class='info'>"
								+ "<div class='thumb'>";
						if(c) {
							divCol += "<img src='${pageContext.request.contextPath}/image/download?imageNo="+commuVo.imageNo+"&folder=commu'>";  
							}   
						divCol +="</div>"
								+ "<h3 class='title'>" + commuVo.title
								+ "</h3>" + "<span class='author'>"
								+ commuVo.nick
								+ "</span><span class='created-at'>"
								+ commuVo.regDate + "</span>"
								+ "</div>" + "</a>" + "</li>" + "</ul>";
						$(".board-main").append(divCol);
					}
				},
				error : function(e) {
					console.log("실패", e);
				}
			});
		}
	});
</script>

<div id="page-container">
	<form id="forwardForm" method="get">
		<input type="hidden" id="returnURL" name="returnURL">
	</form>
	<input type="hidden" id="sessionLoginCheck" value="false">

	<main class="board wzui">
		<div class="ui-header">
		<h2 data-middle-name="${parameter}" class="title">운영사항</h2>
		</div>
			<div class="ui-tabs LeadMakerShortcutLinkSection_linkGroup__2XM2N">
				<ul>
					<li><a href="${root}/onemile/notice/list/공지사항" ${parameter == "board" ? "style='color:#00b2b2;'" : ""} >공지사항</a></li>
					<li><a href="${root}/onemile/notice/list/운영규칙" ${parameter == "rule" ? "style='color:#00b2b2;'" : ""}>운영규칙</a></li>
					<li><a href="${root}/onemile/notice/list/자주하는질문" ${parameter == "faq" ? "style='color:#00b2b2;'" : ""}>자주하는질문</a></li>
					<li><a href="${root}/onemile/notice/contact" ${parameter == "contact" ? "style='color:#00b2b2;'" : ""}>1:1문의하기</a></li>
				</ul>
			</div>
		
		<div class="board-main">
			<c:if test="${admin}">
			<div class="board-write" align="right">
				<a href="../write"><button type="button" class="wz button write-btn">글쓰기</button></a>
			</div>
			</c:if>
		</div>
		<div class="board-footer">
			<div class="row mt-3 mb-5">
				<div class="col mt-3">
					<button type="button"
						class="wz button less ProjectList_search_result_btnExpand__aKnyZ more-btn">
						더보기<i class="icon expand-more"></i>
					</button>
				</div>
			</div>
		</div>
	</main>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>