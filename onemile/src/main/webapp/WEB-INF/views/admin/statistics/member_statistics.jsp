<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%-- 페이지에서 사용할 JSTL 변수 --%>
<!-- jstl 변수 틀렸음. 수정 필요. -->
<c:set var="login" value="${logId != null}"></c:set>
<c:set var="admin" value="${grade == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
	$(function(){
		//바로 차트관련 자료를 불러옴
		$.ajax({
			url :"${pageContext.request.contextPath}/admin/statistics/member_statistics",
			type : "post",
			dataType : "json",
			success:function(resp){
				console.log("회원수 차트 불러오기 성공")
				draw("#myChart", resp);
			},
			error:function(e){
				console.log("회원수 차트 에러남");
			}
		});
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/statistics/age_distribution_statistics",
			type : "post",
			dataType : "json",
			success:function(resp){
				console.log("분포도차트 불러오기 성공")
				drawAgeDis("#myChart2", resp);
			},
			error:function(e){
				console.log("분포도 차트 에러남");
			}
		});
		
		$.ajax({
			url :"${pageContext.request.contextPath}/admin/statistics/location_statistics",
			type : "post",
			dataType : "json",
			success:function(resp){
				console.log("지역분포 차트 불러오기 성공")
				drawLoaction("#myChart3", resp);
			},
			error:function(e){
				console.log("지역분포 차트 에러남");
			}
		});
		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/statistics/membership_statistics",
			type : "post",
			dataType : "json",
			success:function(resp){
				console.log("멤버쉽 가입여부 차트 불러오기 성공")
				drawMembership("#myChart4", resp);
			}
		});
	});
	
	function draw(selector, data){
		var ctx = $(selector)[0].getContext("2d");
		
		var nameArray = [];
		var countArray = [];
		
		for(var i = 0; i < data.length; i++){
			nameArray.push(data[i].text);
			countArray.push(data[i].count);
		}
		
		var myChart = new Chart(ctx, {
		    type: 'bar',//차트의 유형
		    data: {//차트 데이터
		    	//차트 제목
		    	label : '회원 수 관련 차트',
		    	//하단 제목
		        labels: nameArray,
		        datasets: [{
		            label: '회원수(명)',//차트 범례
		            data: countArray,//실제 데이터(하단 제목과 개수가 일치하도록 구성)
		            backgroundColor: [//배경색상
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)'
		            ],
		            borderColor: [//테두리색상(하단 제목과 개수가 일치하도록 구성)
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)'
		            ],
		            borderWidth: 1 //테두리 두께
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
	}
		function drawAgeDis(selector, data){
			var ctx = $(selector)[0].getContext("2d");
			
			var nameArray = [];
			var countArray = [];
			
			for(var i = 0; i < data.length; i++){
				nameArray.push(data[i].text);
				countArray.push(data[i].count);
			}
			
			var myChart = new Chart(ctx, {
			    type: 'bar',//차트의 유형
			    data: {//차트 데이터
			    	//제목
			    	label : '연령대 분포 차트',
			    	//하단 제목
			        labels: nameArray,
			        datasets: [{
			            label: '연령대(세)',//차트 범례
			            data: countArray,//실제 데이터(하단 제목과 개수가 일치하도록 구성)
			            backgroundColor: [//배경색상
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [//테두리색상(하단 제목과 개수가 일치하도록 구성)
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1 //테두리 두께
			        }]
			    },
			    options: {
			        scales: {
			            y: {
			                beginAtZero: true
			            }
			        }
			    }
			});
		
	}
	function drawMembership(selector, data){
		var ctx = $(selector)[0].getContext("2d");
	
		var nameArray = [];
		var countArray = [];
		
		for(var i = 0; i < data.length; i++){
			nameArray.push(data[i].text);
			countArray.push(data[i].count);
		}
		
		var myChart = new Chart(ctx, {
		    type: 'pie',//차트의 유형
		    data: {//차트 데이터
		    	//차트 제목
		    	label : '멤버쉽 가입여부 관련 차트',
		    	//하단 제목
		        labels: nameArray,
		        datasets: [{
		            label: '회원수(명)',//차트 범례
		            data: countArray,//실제 데이터(하단 제목과 개수가 일치하도록 구성)
		            backgroundColor: [//배경색상
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		            ],
		            borderColor: [//테두리색상(하단 제목과 개수가 일치하도록 구성)
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		            ],
		            borderWidth: 1 //테두리 두께
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
	}
	function drawLoaction(selector, data){
		var ctx = $(selector)[0].getContext("2d");
		
		var nameArray = [];
		var countArray = [];
		
		for(var i = 0; i < data.length; i++){
			nameArray.push(data[i].text);
			countArray.push(data[i].count);
		}
		
		var myChart = new Chart(ctx, {
		    type: 'bar',//차트의 유형
		    data: {//차트 데이터
		    	//차트 제목
		    	label : '지역분포 관련 차트',
		    	//하단 제목
		        labels: nameArray,
		        datasets: [{
		            label: '지역분포도(명)',//차트 범례
		            data: countArray,//실제 데이터(하단 제목과 개수가 일치하도록 구성)
		            backgroundColor: [//배경색상
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(32, 162, 235, 0.2)',
		                'rgba(25, 75, 86, 0.2)',
		                'rgba(13, 192, 192, 0.2)',
		                'rgba(195, 162, 235, 0.2)',
		                'rgba(158, 206, 86, 0.2)',
		                'rgba(142, 235, 75, 0.2)',
		                'rgba(121, 162, 235, 0.2)',
		                'rgba(235, 75, 86, 0.2)',
		                'rgba(220, 235, 192, 0.2)',
		                'rgba(200, 162, 235, 0.2)',
		                'rgba(90, 206, 86, 0.2)'
		            ],
		            borderColor: [//테두리색상(하단 제목과 개수가 일치하도록 구성)
		            	'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(32, 162, 235, 0.2)',
		                'rgba(25, 75, 86, 0.2)',
		                'rgba(13, 192, 192, 0.2)',
		                'rgba(195, 162, 235, 0.2)',
		                'rgba(158, 206, 86, 0.2)',
		                'rgba(142, 235, 75, 0.2)',
		                'rgba(121, 162, 235, 0.2)',
		                'rgba(235, 75, 86, 0.2)',
		                'rgba(220, 235, 192, 0.2)',
		                'rgba(200, 162, 235, 0.2)',
		                'rgba(90, 206, 86, 0.2)'
		            ],
		            borderWidth: 1 //테두리 두께
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
	}
</script>
<style>
.wrap{
	width:900px;
	text-align:center;
	heigth:auto;
	margin:0 auto;
}
</style>
<div class="board wzui">
	<div class="ui-header">
		<h2 class="title">회원 성별 분포</h2>
	</div>
	<div class="wrap">
		<!--차트가 그려질 부분-->
		<canvas id="myChart"></canvas>
	</div>
	<div class="ui-header">
		<h2 class="title">회원 연령 분포</h2>
	</div>
	<div class="wrap">
		<!--차트가 그려질 부분-->
		<canvas id="myChart2"></canvas>
	</div>
	<div class="ui-header">
		<h2 class="title">소셜링 지역 분포</h2>
	</div>
	<div class="wrap">
		<!--차트가 그려질 부분-->
		<canvas id="myChart3"></canvas>
	</div>
	<div class="ui-header">
		<h2 class="title">멤버십 가입 비율</h2>
	</div>
	<div class="wrap">
		<!--차트가 그려질 부분-->
		<canvas id="myChart4"></canvas>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>