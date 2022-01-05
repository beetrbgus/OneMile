<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.more-btn{
	margin-top:1rem;
	font-size:15px;
}
</style>
<script>
	$(function() {
		var page = 1;
		var size = 12;

		$(".more-btn").click(function() {
			loadData(page, size, '질문');
			page++;
		});
		
		$(".more-btn").click();
		
		function loadData(page, size, middleName) {

			$.ajax({
						url : "http://localhost:8080/onemile/commu/questions/listdetail", 
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
								console.log(i,"번째 실행");
								var commuVo = resp[i];
								var divCol = "<ul>" + "<li>"
										+ "<a class='article' href='detail?boardNo="+resp[i].commuNo+"'>"
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
			<h2 class="title">동네질문</h2>
		</div>
		<div class="board-main">
			
		</div>
		<div class="board-footer">
			<div class="row mt-3 mb-5">
				<div class="col mt-3">
					<button type="button" class="wz button less ProjectList_search_result_btnExpand__aKnyZ more-btn">더보기<i class="icon expand-more"></i></button>
				</div>
			</div>
		</div>
	</main>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>