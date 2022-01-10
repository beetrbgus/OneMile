$(function () {
		var page = 1;
		var size = 20;

		$(".ProjectListMoreButton_button__27eTb").click(function () {
			loadData(page, size);
			page++;
		});

		$(".ProjectListMoreButton_button__27eTb").click();

		function loadData(page, size, middleName) {

			$.ajax({
				url: "${pageContext.request.contextPath}/cobuy/listdetail",
				type: "get",
				data: {
					page: page,
					size: size
				},
				success: function (resp) {
					if (resp.length < size) {
						$(".more-btn").remove();
					}
					for (var i = 0; i < resp.length; i++) {
						var date = new Date(resp[i].deadLine);
						var dateString = date.getFullYear()+"년 "+date.getMonth()+1+"월 "+date.getDate()+"일 "+date.getHours()+"시 "+date.getMinutes()+"분 "+date.getSeconds()+"초";

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
							"style='background-image: url(${pageContext.request.contextPath}/image/download?imageNo=${CobuyListVO.imgNo}&folder=cobuy)'></span>"+
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
		}
	});