<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 페이지에서 사용할 JSTL 변수 --%>
<!-- jstl 변수 틀렸음. 수정 필요. -->
<c:set var="login" value="${logId != null}"></c:set>
<c:set var="admin" value="${grade == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
  
<!DOCTYPE html>
<html lang="ko" class="show-footer">

<head>
	 
	<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://bootswatch.com/5/journal/bootstrap.css" type="text/css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${root}/resources/css/10.458392b3.chunk.css">
	<link rel="stylesheet" href="${root}/resources/css/2.680dde46.chunk.css">
	<link rel="stylesheet" href="${root}/resources/css/board.ace40453.css">
	<link rel="stylesheet" href="${root}/resources/css/campaign.30c4c08b.css">
	<link rel="stylesheet" href="${root}/resources/css/commons-w.css">
	<link rel="stylesheet" href="${root}/resources/css/equity-main.4e5c0c27.chunk.css">
	<link rel="stylesheet" href="${root}/resources/css/froala_cust.css">
	<link rel="stylesheet" href="${root}/resources/css/layout-w.css">
	<link rel="stylesheet" href="${root}/resources/css/main.19e53e7f.css">
	<link rel="stylesheet" href="${root}/resources/css/main.3208b694.css">
	<link rel="stylesheet" href="${root}/resources/css/main.d00f8dbd.css">
	<link rel="stylesheet" href="${root}/resources/css/main.e49dc743.css">
	<link rel="stylesheet" href="${root}/resources/css/mobile-w.css">
	<link rel="stylesheet" href="${root}/resources/css/partners.e0da7bd4.css">
	<link rel="stylesheet" href="${root}/resources/css/reset-w.css">
	<link rel="stylesheet" href="${root}/resources/css/reward-main.57e0ec6d.chunk.css">
	<link rel="stylesheet" href="${root}/resources/css/terms.09f05cfa.css">
	<link rel="stylesheet" href="${root}/resources/css/wboard.css">
	<link rel="stylesheet" href="${root}/resources/css/wlayoutfde0.css">
	<link rel="stylesheet" href="${root}/resources/css/wprojectcard.css">
	<link rel="stylesheet" href="${root}/resources/css/wui.css.83f47029.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/7f85a56ba4.css">
</head>
<style>
.dong{
	border:1px solid black;
	border-radius:30px;
	width:80px;
	text-align:center;
}
.dark{
	opacity: 1;
    pointer-events: all;
}
</style>
<script>
$(function () {
    //메뉴 ajax
        $.ajax({
            url: "${pageContext.request.contextPath}/menu/",
            type: "post",
            data: {},
            success: function (resp) {
            
            	for(var i = 0; i<resp.length; i++){
            		var menuDto = resp[i];
            		
            		var divBig =
            			"<div class='MenuList_container__3ofD- MoreMenuDesktop_moreMenuList__11cPX'><h4 class='MenuList_label__qSsts'>"+
            			menuDto.largeName+
            			"</h4>";
            		for(var k =0; k<menuDto.middleDTO.length; k++){
            			var middleDto = menuDto.middleDTO[k];

                		divBig += "<a class='MenuListItem_button__8-ecU' href='${root}"+menuDto.mainPath+middleDto.urlPath+"'>"+
                			middleDto.middleName+"<i class='icon chevron-rigth' aria-hidden='true'></i></a>";
                	}
            			divBig += "</div>"
            			$(".MoreMenuDesktop_innerContainer__xecjO").append(divBig);
                }
            },
            error: function (err) {
            	
            }
        });
    /* if(sessionStorage.getItem("dong")!=null||sessionStorage.getItem("dong")!=undefined||sessionStorage.getItem("dong")!=""){
	    $(".dong").val(sessionStorage.getItem("dong"));
	    
    }  */
    let dongsession = "${dong}";
    $(".dong").val(dongsession);


    $(".GNBDesktop_more__39gyV").click(function(){
    	$(".Backdrop_backDrop__3v5kD").toggleClass("dark")
    	$(".MoreMenuDesktop_container__1I6Al").toggleClass("MoreMenuDesktop_active__3wtR4");
    });
    
	$(".Backdrop_backDrop__3v5kD.Backdrop_dimmed__23l4b.GNBDesktop_backdrop__3h5Cq").click(function(){
		$(this).removeClass("dark"); 
		$(".MoreMenuDesktop_container__1I6Al.MoreMenuDesktop_active__3wtR4").removeClass("MoreMenuDesktop_active__3wtR4");
	});
});
</script>
<body>
	<div id="page-container"> 
		<div class="black-bg-wrap" style="display: none;"></div>
		<div id="wz-header">
			<div class="web-header">
				<div class="web-header-mobile">
					<header class="header-wrapper">
						<div class="header-container">
							<h1 class="wadiz-logo">
								<a href="/onemile" class="onemile-logo"><span class="label">원마일</span>
								 	<img src="${root}/resources/image/OM_logo.jpg" width="48" height="48" viewBox="0 0 85 25">
										<path fill="#1D2129" fill-rule="nonzero"
											d="M58.49 2.23h2.11v21.29H59a1.73 1.73 0 0 1-1.62-1.16 9 9 0 0 1-10.93-.28 7.48 7.48 0 0 1-2.75-6.29 7.65 7.65 0 0 1 12.79-5.07V4.23a2 2 0 0 1 2-2zm-6.3 18.62a4.36 4.36 0 0 0 4.16-4.52 4.19 4.19 0 1 0-8.35 0 4.36 4.36 0 0 0 4.19 4.52zM42 23.52h-1.52a1.73 1.73 0 0 1-1.64-1.16 9 9 0 0 1-10.93-.28 7.48 7.48 0 0 1-2.75-6.29A7.65 7.65 0 0 1 38 10.72a2 2 0 0 1 1.9-1.79H42v14.59zm-8.41-2.67h.02a4.35 4.35 0 0 0 4.15-4.52 4.35 4.35 0 0 0-4.17-4.51 4.35 4.35 0 0 0-4.17 4.51 4.36 4.36 0 0 0 4.17 4.52zM83.47 8.94v2.11l-7.07 9.06h7.06v3.47h-13v-2.1l7.08-9.07h-6.62v-1.47a2 2 0 0 1 2-2h10.55zM65.86 7.3a2.48 2.48 0 1 1 0-4.96 2.48 2.48 0 0 1 0 4.96zM21.21 8.94h4.14l-4.86 14.59h-4.15l-3.21-9.36-3.21 9.36H5.77L.92 8.94h4.13L8 18l2.5-7.74a2 2 0 0 1 1.86-1.34h2.9l3 9.08 2.95-9.06zm42.65 14.59l-.04-12.59a2 2 0 0 1 2-2h2.11v14.59h-4.07z">
										</path>
									</a>
							</h1>
							<ul class="GNBMobile_container__1OTMW">
								<li class="GNBMobile_item__1b4ZL"><a aria-current="page"
										class="GNBMobile_link__t1Y9t GNBMobile_active__3WNf8 GNBMobile_active__3WNf8"
										href="${root}/">
										<div class="GNBMobile_icon__3OOAF GNBMobile_active__3WNf8"
											style="background-image: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEgyNFYyNEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQ3NjggLTE5ODUpIHRyYW5zbGF0ZSg0NzY4IDE5ODUpIi8+CiAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjMjEyNTI5IiBkPSJNMTIgMS41NDJMMS45OCA4LjMxNiAxLjk4IDIxLjYgOS40MzggMjEuNiA5LjQzOCAxMy4yNiAxNC41NjIgMTMuMjYgMTQuNTYyIDIxLjYgMjIuMDIgMjEuNiAyMi4wMiA4LjMxNnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC00NzY4IC0xOTg1KSB0cmFuc2xhdGUoNDc2OCAxOTg1KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K&quot;);">
										</div>
										<span class="GNBMobile_text__2-voS">홈</span>
									</a></li>
								<li class="GNBMobile_item__1b4ZL"><a href="${root}/commu/notmap/list?middleName=동네질문">
										<div class="GNBMobile_icon__3OOAF"
											style="background-image: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEgyNFYyNEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQ5MDggLTE5ODUpIHRyYW5zbGF0ZSg0OTA4IDE5ODUpIi8+CiAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjODY4RTk2IiBkPSJNMTIgMi4yNWMyLjQ4NiAwIDQuNzY4Ljg3NyA2LjU1MyAyLjMzOGwxLjI4LTEuNDc5IDEuMTM0Ljk4Mi0xLjMyNCAxLjUzYzEuNjgyIDEuODQgMi43MDcgNC4yOSAyLjcwNyA2Ljk3OSAwIDUuNzE2LTQuNjM0IDEwLjM1LTEwLjM1IDEwLjM1LTUuNzE2IDAtMTAuMzUtNC42MzQtMTAuMzUtMTAuMzUgMC0yLjY5MiAxLjAyOC01LjE0NCAyLjcxMi02Ljk4NUwzLjAzNSA0LjA5M2wxLjEzLS45ODYgMS4yODcgMS40NzdDNy4yMzYgMy4xMjUgOS41MTYgMi4yNSAxMiAyLjI1em0wIDEuNWMtNC44ODggMC04Ljg1IDMuOTYyLTguODUgOC44NXMzLjk2MiA4Ljg1IDguODUgOC44NSA4Ljg1LTMuOTYyIDguODUtOC44NVMxNi44ODggMy43NSAxMiAzLjc1em0uNzUgMy41NTZ2NC44Nmw0LjM4OSAyLjUyNi0uNzQ4IDEuMy01LjE0MS0yLjk1OFY3LjMwNmgxLjV6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNDkwOCAtMTk4NSkgdHJhbnNsYXRlKDQ5MDggMTk4NSkiLz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==&quot;);">
										</div>
										<span class="GNBMobile_text__2-voS">커뮤니티</span>
									</a></li>
								<li class="GNBMobile_item__1b4ZL"><a class="GNBMobile_link__t1Y9t"
										href="${root}/social">
										<div class="GNBMobile_icon__3OOAF"
											style="background-image: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEgyNFYyNEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQ4MTggLTE5ODUpIHRyYW5zbGF0ZSg0ODE4IDE5ODUpIi8+CiAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjODY4RTk2IiBkPSJNMTQuMzQ1IDIuOTE1Yy45MTYtLjczNyAxLjgyNC0uOTc2IDIuNjg5LS43MTMuNTk2LjE5IDEuMDgxLjYyNyAxLjMzMiAxLjIuMjkuNjM0LjI5IDEuMzY0IDAgMS45OTgtLjIwNi40NDgtLjUyOC44My0uOTMgMS4xMWwtLjEzOC4wOWg0LjcyMnYxNS4wOWgtMS40NFY4LjAyOEgzLjQyVjIxLjY5SDEuOThWNi42aDQuNzIyYy0uNDY3LS4yODUtLjg0LS43MDMtMS4wNjgtMS4yLS4yOTQtLjYyNy0uMzAzLTEuMzUyLS4wMjQtMS45ODYuMjUtLjU3NC43MzUtMS4wMTIgMS4zMzItMS4yLjg2NS0uMjcgMS43NzMtLjAzIDIuNjkuNzEzbC4xMy4xMDkuMjIzLjIwOUMxMC43OTIgNC4wMiAxMS40NzIgNC45MiAxMiA1LjkxYy41Mi0uOTkyIDEuMTkzLTEuODk0IDEuOTkzLTIuNjc2bC4yMjEtLjIxLjEzLS4xMDl6TTEyLjcyIDkuOTQydjExLjY0aC0xLjQ0VjkuOTQyaDEuNDR6TTcuNjU2IDMuMzA2Yy0uMTIgMC0uMjQuMDE4LS4zNTQuMDU0LS4yNjguMDktLjQ4NS4yODgtLjYuNTQ2LS4xMzMuMzI3LS4xMTUuNjk1LjA0OCAxLjAwOC4zNzguODQ2IDEuOTUgMS40MSA0LjIgMS41NDgtLjQ2LS44NTctMS4wNDYtMS42MzgtMS43MzktMi4zMTlMOC45IDMuODQ2Yy0uMzQ0LS4zMS0uNzgtLjUtMS4yNDQtLjU0em05LjAzNi4wMzZsLS4wODktLjAyYy0uMzEyLS4wNTgtLjc3OC0uMDQ0LTEuNDk0LjUzbC0uMTA5LjA5LS4yMDcuMmMtLjY3OC42NzgtMS4yNTEgMS40NTQtMS43MDEgMi4zMDIgMi4yNDQtLjEzOCAzLjgyMi0uNzAyIDQuMi0xLjU0OC4xNDgtLjMyLjE0OC0uNjg4IDAtMS4wMDgtLjExNS0uMjU4LS4zMzItLjQ1Ni0uNi0uNTQ2eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQ4MTggLTE5ODUpIHRyYW5zbGF0ZSg0ODE4IDE5ODUpIi8+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=&quot;);">
										</div>
										<span class="GNBMobile_text__2-voS">소셜링</span>
									</a></li>
								<li class="GNBMobile_item__1b4ZL"><a href="${root}/cobuy"
										class="GNBMobile_link__t1Y9t">
										<div class="MenuBadge_badge__1VGZ2 MenuBadge_new__gus4v"></div>
										<div class="GNBMobile_icon__3OOAF"
											style="background-image: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzg2OEU5NiIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNMjMuMDM1IDMuNmwuMDU5IDMuOTcydjEuNTIyYy0uMDI3IDEuMjkyLS42NDQgMi40MzQtMS41ODQgMy4xNzR2OS40N2gtMS41di04LjcyM2MtLjMwOS4wOC0uNjMxLjEyNi0uOTYyLjEzMWgtLjE0Yy0xLjQyMi4wMjUtMi42OS0uNjY5LTMuNDU1LTEuNzUyLS4xNS4yMTctLjMyMi40Mi0uNTE1LjYwNy0uNzQ2LjcyMi0xLjczNSAxLjEzNS0yLjc0NiAxLjE2MmgtLjE3OWMtMS4wOTkuMDItMi4xNi0uMzk4LTIuOTUtMS4xNjMtLjE5Mi0uMTg2LS4zNjQtLjM4OS0uNTE1LS42MDUtLjczNCAxLjA0NC0xLjkzOCAxLjczLTMuMjg4IDEuNzUxaC0uMTRjLS4zOTEuMDA3LS43Ny0uMDQtMS4xMy0uMTM1djguNzI3aC0xLjV2LTkuNDc1QzEuNTgzIDExLjU0OS45OCAxMC40Ni45MTEgOS4yMmwtLjAwNS0uMTQzVjcuNTYxTC45NjYgMy42aDIyLjA2OXpNMTUuNDcgMTUuNTM3djYuMjAxaC0xLjQ4MnYtNC43MTloLTMuOTc4djQuNzE5SDguNTI5di02LjIwMWg2Ljk0MnpNMTQuNjggNS4xSDkuMzE5bC0uMDE0IDIuNDcxLjAwMS4wMDF2MS40OTVjLjAxLjcuMjk4IDEuMzY4LjgwMSAxLjg1NS41MDMuNDg4IDEuMTguNzU1IDEuOTA2Ljc0Mi43MDEuMDEzIDEuMzc5LS4yNTQgMS44ODMtLjc0Mi40Ny0uNDU0Ljc1My0xLjA2Ny43OTgtMS43MTZsLjAwMi0uMDU4LS4wMDItLjA3VjcuNTcyTDE0LjY4IDUuMXptLTYuODYgMEgyLjQ0M2wtLjAzNyAyLjQ3MnYxLjQ5Yy4wMyAxLjQ1NSAxLjIzMiAyLjYxIDIuNzEzIDIuNTg0IDEuNDEyLjAyNSAyLjU4Ni0xLjA2MiAyLjY4MS0yLjQ0MmwuMDA2LS4xMjZWNy41NzJsLjY2Ni0uMDAxLS42NjYtLjAwM0w3LjgyIDUuMXptMTMuNzM3IDBoLTUuMzc4bC4wMTUgMi40NjgtLjgzNC4wMDRoLjgzNHYxLjUxN2guMDA2bC0uMDAzLjA0Ny4wMDYuMDkzYy4xMTQgMS4zNzUgMS4yOCAyLjQ0MiAyLjcwNCAyLjQxNyAxLjQxMi4wMjUgMi41ODYtMS4wNjIgMi42ODEtMi40NDJsLjAwNi0uMTI2VjcuNTgzTDIxLjU1NyA1LjF6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMzI2LjAwMDAwMCwgLTI3OC4wMDAwMDApIHRyYW5zbGF0ZSg3Ni4wMDAwMDAsIDI3MS4wMDAwMDApIHRyYW5zbGF0ZSgyNTAuMDAwMDAwLCA3LjAwMDAwMCkiLz4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMCAwSDI0VjI0SDB6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMzI2LjAwMDAwMCwgLTI3OC4wMDAwMDApIHRyYW5zbGF0ZSg3Ni4wMDAwMDAsIDI3MS4wMDAwMDApIHRyYW5zbGF0ZSgyNTAuMDAwMDAwLCA3LjAwMDAwMCkiLz4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==&quot;);">
										</div>
										<span class="GNBMobile_text__2-voS">공동구매</span>
									</a></li>
								<li class="GNBMobile_item__1b4ZL confirmbtn">
										<div class="GNBMobile_icon__3OOAF"
											style="background-image: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEgyNFYyNEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTUwODggLTE5ODUpIHRyYW5zbGF0ZSg1MDg4IDE5ODUpIi8+CiAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjODY4RTk2IiBkPSJNMy4zNiA5LjEyYy43NjUtLjAwMiAxLjQ5OS4zMDEgMi4wNC44NDEuNTQyLjU0Ljg0NiAxLjI3NC44NDYgMi4wMzkgMCAxLjU5LTEuMjg4IDIuODc5LTIuODc4IDIuODgtMS41OS4wMDEtMi44OC0xLjI4Ni0yLjg4Mi0yLjg3Ni0uMDAyLTEuNTkgMS4yODQtMi44OCAyLjg3NC0yLjg4NHptMTcuMjggMGMuNzY0IDAgMS40OTYuMzAzIDIuMDM2Ljg0NC41NC41NC44NDQgMS4yNzIuODQ0IDIuMDM2IDAgMS41OS0xLjI5IDIuODgtMi44OCAyLjg4LTEuNTkgMC0yLjg4LTEuMjktMi44OC0yLjg4IDAtMS41OSAxLjI5LTIuODggMi44OC0yLjg4em0tOC41NzQgMGMxLjU5IDAgMi44OCAxLjI5IDIuODggMi44OCAwIDEuNTktMS4yOSAyLjg4LTIuODggMi44OC0xLjU5IDAtMi44OC0xLjI5LTIuODgtMi44OCAwLTEuNTkgMS4yOS0yLjg4IDIuODgtMi44OHpNMy4zNiAxMC41NmMtLjc5NSAwLTEuNDQuNjQ1LTEuNDQgMS40NCAwIC43OTUuNjQ1IDEuNDQgMS40NCAxLjQ0Ljc5NC0uMDAzIDEuNDM3LS42NDYgMS40NC0xLjQ0IDAtLjc5NS0uNjQ1LTEuNDQtMS40NC0xLjQ0em0xNy44MzEuMTFjLS41MzgtLjIyMy0xLjE1Ny0uMS0xLjU3LjMxMi0uNDExLjQxMi0uNTM0IDEuMDMxLS4zMTEgMS41Ny4yMjIuNTM3Ljc0OC44ODggMS4zMy44ODguNzk1IDAgMS40NC0uNjQ1IDEuNDQtMS40NCAwLS41ODItLjM1LTEuMTA4LS44ODktMS4zM3ptLTkuMTI1LS4xMWMtLjc5NSAwLTEuNDQuNjQ1LTEuNDQgMS40NCAwIC43OTUuNjQ1IDEuNDQgMS40NCAxLjQ0Ljc5NC0uMDAzIDEuNDM3LS42NDYgMS40NC0xLjQ0IDAtLjc5NS0uNjQ1LTEuNDQtMS40NC0xLjQ0eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTUwODggLTE5ODUpIHRyYW5zbGF0ZSg1MDg4IDE5ODUpIi8+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=&quot;);">
										</div>
										<span class="GNBMobile_text__2-voS">동네인증</span>
								</li>
							</ul>
							<div class="HeaderMobile_myButton__32Bob">
							<c:choose>
								<c:when test="${login}">
									<a href="${root}/account/mypage">
									<button type="button">
										<i class="icon my" aria-hidden="true"></i>
									</button>
									</a>
								</c:when>
								<c:otherwise>
									<a href="${root}/member/login">
									<button type="button">
										<i class="icon my" aria-hidden="true"></i>
									</button>
									</a>
								</c:otherwise>
								</c:choose>
								<input type="text" value="${dong}" class="dong">
							</div>
						</div>
					</header>
				</div>
				<div class="web-header-large">
					<header class="header-wrapper">
						<div class="header-container">
							<h1 class="wadiz-logo">
								<a class="onemile-logo" href="/onemile"><span class="label">원마일</span>
									<img src="${root}/resources/image/OM_logo.jpg" width="48" height="48" viewBox="0 0 85 25">
										<path fill="#1D2129" fill-rule="nonzero"
											d="M58.49 2.23h2.11v21.29H59a1.73 1.73 0 0 1-1.62-1.16 9 9 0 0 1-10.93-.28 7.48 7.48 0 0 1-2.75-6.29 7.65 7.65 0 0 1 12.79-5.07V4.23a2 2 0 0 1 2-2zm-6.3 18.62a4.36 4.36 0 0 0 4.16-4.52 4.19 4.19 0 1 0-8.35 0 4.36 4.36 0 0 0 4.19 4.52zM42 23.52h-1.52a1.73 1.73 0 0 1-1.64-1.16 9 9 0 0 1-10.93-.28 7.48 7.48 0 0 1-2.75-6.29A7.65 7.65 0 0 1 38 10.72a2 2 0 0 1 1.9-1.79H42v14.59zm-8.41-2.67h.02a4.35 4.35 0 0 0 4.15-4.52 4.35 4.35 0 0 0-4.17-4.51 4.35 4.35 0 0 0-4.17 4.51 4.36 4.36 0 0 0 4.17 4.52zM83.47 8.94v2.11l-7.07 9.06h7.06v3.47h-13v-2.1l7.08-9.07h-6.62v-1.47a2 2 0 0 1 2-2h10.55zM65.86 7.3a2.48 2.48 0 1 1 0-4.96 2.48 2.48 0 0 1 0 4.96zM21.21 8.94h4.14l-4.86 14.59h-4.15l-3.21-9.36-3.21 9.36H5.77L.92 8.94h4.13L8 18l2.5-7.74a2 2 0 0 1 1.86-1.34h2.9l3 9.08 2.95-9.06zm42.65 14.59l-.04-12.59a2 2 0 0 1 2-2h2.11v14.59h-4.07z">
										</path> 
									</a>
							</h1>
							<ul class="GNBDesktop_container__3X3Cg">
								<li class="GNBDesktop_item__H8bay confirmbtn GNBDesktop_link__1AP6q"><span>동네인증</span></li>
								<li class="GNBDesktop_item__H8bay GNBDesktop_link__1AP6q"><input type="text" class="dong"></li>
								<li class="GNBDesktop_item__H8bay">
									<a class="GNBDesktop_link__1AP6q"
										href="${root}/social">
										<span>소셜링</span>
									</a>
								</li>
								<li class="GNBDesktop_item__H8bay">
									<a href="${root}/cobuy"
										class="GNBDesktop_link__1AP6q">
										<span>공동구매</span>
									</a>
								</li>
								<li class="GNBDesktop_item__H8bay">
									<div>
										<button class="GNBDesktop_link__1AP6q GNBDesktop_more__39gyV">
											더보기
											<svg viewBox="0 0 40 40" focusable="false" role="presentation"
												class="withIcon_icon__20lDO GNBDesktop_icon__ZX6B_" aria-hidden="true">
												<path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
											</svg>
										</button>
										<div class="MoreMenuDesktop_container__1I6Al" role="navigation" id="navigation">
											<div class="MoreMenuDesktop_innerContainer__xecjO">
												
											</div>
										</div>
										<div class="Backdrop_backDrop__3v5kD Backdrop_dimmed__23l4b GNBDesktop_backdrop__3h5Cq"></div>
									</div>
								</li>
							</ul>
							<div class="web-header-utils">
								<div class="HeaderDesktop_user__3zGmM">
									<div class="User_container__bqVd2">
									<c:choose>
										<c:when test="${login}">
											<a href="${root}/member/logout">
												<button type="button" class="User_btnSign__1URTs" >
													로그아웃
												</button>
											</a>
												<c:choose>
													<c:when test="${!admin}">
														<button data-event="iam.signup" class="User_btnSign__1URTs" ><a href="${root}/account/mypage">마이페이지</a></button>
													</c:when>
												</c:choose>
										</c:when>
										<c:otherwise>
											<button type="button" class="User_btnSign__1URTs" >
												<a href="${root}/member/login">로그인</a>
											</button>
											<button data-event="iam.signup" class="User_btnSign__1URTs" >
												<a href="${root}/member/join">회원가입</a>
											</button>
										</c:otherwise>
									</c:choose>
									</div>
								</div>
								
								<div class="web-header-funding-open funding-open">
									<div>
										<div>
										<c:choose>
											<c:when test="${login and admin}">
												<a href="${root}/admin/">
												<button class="wz button funding-open-button dense primary-outline"
													aria-label="프로젝트 오픈 신청">관리자 홈</button></a>
											</c:when>
											<c:otherwise>
											<a href="${root}/membership/list">
												<button class="wz button funding-open-button dense primary-outline"
												aria-label="프로젝트 오픈 신청">멤버십 가입</button></a>
											</c:otherwise>
										</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</header>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1cc79c94ac55588eb38ef2801174855&libraries=services" charset="utf-8"></script>
	<script>
		var context = "${pageContext.request.contextPath}";
		var login = ${login};
	</script>
		
   	 	
		<script type="text/javascript"src="${root}/resources/js/navigator.js"></script>
		<section>