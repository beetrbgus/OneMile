<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			$
					.ajax({
						url : "http://localhost:8080/onemile/commu/notmap/listdetail",
						type : "get",
						data : {
							middleName : middleName,
							page : page,
							size : size
						},
						success : function(resp) {
							console.log("성공", resp);

							if (resp.length < size) {
								$(".more-btn").remove();
							}
							for (var i = 0; i < resp.length; i++) {
								console.log(i, "번째 실행");
								var commuVo = resp[i];
								var divCol = "<ul>"
										+ "<li>"
										+ "<a class='article' href='detail?boardNo="
										+ resp[i].commuNo
										+ "'>"
										+ "<div class='info'>"
										+ "<div class='thumb' style='background-image: url(https://cdn.wadiz.kr/ft/images/green001/2021/1228/20211228095651665_0.jpg/wadiz/resize/400/format/jpg/quality/80/optimize)'></div>"
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
		<h2 data-middle-name="${param.middleName}" class="title">커뮤니티</h2>
		</div>
			<div class="ui-tabs">
				<ul>
					<li><a href="?middleName=질문" ${param.middleName == "질문" ? "style='color:#00b2b2;'" : ""} >동네질문</a></li>
					<li><a href="?middleName=분실" ${param.middleName == "분실" ? "style='color:#00b2b2;'" : ""}>분실/실종센터</a></li>
					<li><a href="../map/list?middleName=맛집" ${param.middleName == "맛집" ? "style='color:#00b2b2;'" : ""}>동네맛집</a></li>
					<li><a href="../map/list?middleName=사건" ${param.middleName == "사건" ? "style='color:#00b2b2;'" : ""}>동네 사건사고</a></li>
					<li><a href="../map/list?middleName=얌얌" ${param.middleName == "얌얌" ? "style='color:#00b2b2;'" : ""}>얌세권</a></li>
				</ul>
			</div>
		<div class="board-main"></div>
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