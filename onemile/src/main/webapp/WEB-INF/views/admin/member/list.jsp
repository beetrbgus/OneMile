<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.memberT{
	padding-top:1rem;
}
table, th, td{
	margin-left:auto;
	margin-right:auto;
	text-align:center;
	border: 1px solid #bcbcbc;
}
table{
	margin-top:1rem;
	width:1200px;
	overflow:auto;
}
.intro{
	width:400px;
	overflow: hidden;
}
.a:hover{
	color:black;
}
.input-form{
	font-size:20px;
	border: 1px solid #00c4c4;
	padding-top:0.07em;
	width:350px;
}
.search-box{
	margin-left:auto;
	margin-right:auto;
	width:50%;
	text-align:center;
	overflow:auto;
}
</style>
<script>
$(function () {
	var page = 2;
	var size = 20;
	
	$(".ProjectListMoreButton_button__27eTb").click(function () {
		loadData(page, size, search, keyword);
		page++;
	});
	
	if(cnt() <10){ 
		$(".ProjectListMoreButton_button__27eTb").remove(); 
	}
	
	function cnt(){
		let a = $(".ProjectCardList_item__1owJa");
		return a.length;
	}
	function loadData(page, size, keyword, search) {

		$.ajax({
			url: "${pageContext.request.contextPath}/admin/member/list",
			type: "get",
			data: {
				page: page,
				size: size,
				keyword: keyword,
				search: search
			},
			success: function (resp) {
				if (resp.length < size) {
					$("#moreBtn").remove();
				}
				for (var i = 0; i < resp.length; i++) {
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

<div class="board wzui">
	<div class="ui-header">
		<h2 class="title">회원 목록</h2>
	</div>
	<div class="ui-tabs">
		<ul>
			<li><a href="${root}/onemile/admin/member/list">회원목록</a></li>
			<li><a href="${root}/onemile/admin/member/hidden">탈퇴회원목록</a></li>
		</ul>
	</div>
</div>
<div class="search-box">
	<form method="get">
		<select name="search">
			<option value="email">이메일</option>
			<option value="nick">닉네임</option>
		</select>
		<input type="text" name="keyword" class="input-form">
		<input type="submit" value="검색" class="wz button primary">
	</form>
</div>
<div class="memberT">
	<table>
		<thead>
		<tr>
			<th>이메일</th>
			<th>닉네임</th>
			<th>핸드폰</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>등급</th>
			<th>가입일</th>
			<th>자기소개</th>
			<th>닉네임변경일</th>
			<th>정보변경</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.email}</td>
				<td>${list.nick}</td>
				<td>${list.phone}</td>
				<td>${list.gender}</td>
				<td>${list.birth}</td>
				<td>${list.grade}</td>
				<td>${list.joinDate}</td>
				<td class="intro">${list.intro}</td>
				<td>${list.nickModi}</td>
				<td><a class="a" href="#">수정</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>