<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail-socialing.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/grid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reboot.css">

<script type="text/javascript"src="${root}/onemile/resources/js/social/regDate.js"></script>
<script type="text/javascript"src="${root}/onemile/resources/js/social/regValidate.js"></script>
<script>
/* 카테고리 */
$(function(){
	$(".big").on("input",function(){
		var root = $("#rrr").val();
		console.log("root  "+root);
		var category = $(this).val();
	
		$.ajax({ 
			url : '${pageContext.request.contextPath}/miles/data/category/child',
			type : "post",
			async : false,
			data : { 
				categorySuper : category
			},
			success : function(resp) {
				console.log("성공", resp);
					
				var middle = $(".middle");
				middle.find("option").remove();
				for (var dto of resp) { 
					var middleOption = $("<option>");
					middleOption.val(dto.smallType);
					middleOption.text(dto.smallType);
					middle.append(middleOption);
				}
		  	},
	 		error : function(e) {
			  console.log("실패", e);
 		  	}
 		});
	});
});

//파일 갯수 제한
$(function () {
	//파일이 선택되면 3개 이상인지 확인해서 차단
	$("input[name=attach]").on("input", function () {
    console.log(this.files);
    console.log("event " +event.target);
    console.log(this.files);
    if (this.files.length > 3) {
      	alert("파일은 3개까지만 선택이 가능합니다");
      	$(this).val(""); //선택취소
      	return;
      }
      setThumbnail($(this).files);
      //선택한 파일을 읽어서 전송 가능하도록 보관
      //파일이 몇갠지 모르니까 배열에 보관한다
      fileList = this.files;
      console.log(fileList);  
     });
});	
      						
//이미지 미리보기
 var sel_files = [];
 $(document).ready(function(){
     $("input[name=attach]").on("change", handleImgsFilesSelect);
 });
 function handleImgsFilesSelect(e) {
     sel_files = [];
     $("#result").empty();
     var files = e.target.files;
     var filesArr = Array.prototype.slice.call(files);
     var index = 0;
     filesArr.forEach(function(f){
         if(!f.type.match("image.*")){
             alert("확장자는 이미지 확장자만 가능합니다.");
             return;
         }
         sel_files.push(f);
         var reader = new FileReader();
         reader.onload = function(e) {
             var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' width='150px' height='150px'></a>";
             $("#result").append(html);
             index++;
           }
            reader.readAsDataURL(f);
            });
        }
function deleteImageAction(index){
	  console.log("index : " + index);
	  sel_files.splice();
		
	  var img_id = "#img_id_" + index;
	  var del = $(img_id).remove();
	  if(del){
		  $("input[name=attach]").val("");
		  $("#result").empty();
	  }
	  console.log(sel_files);
}
</script>
<!-- CSS 테스트중 -->
<form id="regForm" action="./reg" method="post" enctype="multipart/form-data">
	<input type="hidden" name="lat" required>
	<input type="hidden" name="lng" required>
	<div class="container detail">
	    <div class="detail-wrapper">
	        <div class="detail_info">
	            <p class="detail_name"><input type="text" name="title" required placeholder="제목을 입력해주세요."></p>
	            <div class="detail_info_container">
	                <div>
	                    <div>
	                        <p class="sub">장소</p>
	                    </div>
	                    <p class="detail_startDate">
	                    	<input type="text" id="location" name="location" required readonly>
	                   	</p>
	                </div>
	                <div>
	                    <div>
	                        <p class="socialing_startDate sub">관심카테고리</p>
	                    </div>
	                    <p class="summary-sub">
	                		<select class="big" required > 
								<option value="">카테고리선택</option>
								<c:forEach var="category" items="${bigCategory}">
									<c:if test="${category.bigType !='전체'}">
										<option value="${category.bigType}">${category.bigType}</option>
									</c:if>
								</c:forEach>
							</select>
							<select class="middle" name="smalltype" required></select>
	                    </p>
					 </div>
	                <div>
	                    <div>
	                        <p class="sub">소셜링 이미지[최대 3장, 5MB 등록 가능]</p>
	                    </div>
	                    <p class="detail_startDate"><input type="file" name="attach" multiple></p>
	                </div>
	            </div>
	        </div>
	        <div class="detail_carousel_row no_padding row">
	            <div class="col-12">
	                <div id="detail_main_carousel" class="carousel slide" data-ride="carousel">
	                    <div class="carousel-inner" id="cover_carousel_inner">
	          				<!--올린 이미지 미리보기  -->
							<div id="result" style="width:500px;height:400px;margin-left:200px;"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	   	</div>
	    <div class="detail_floating_zone" style="position: absolute; top: 380px; width: 412px; right: 350px;">
	        <!-- 카카오 지도 -->
	        <div class="detail_buttons_row floating row">
	            <div id="map" style="width:412px;height:400px;top: 10px;right: 20px;"></div>
	        </div>
	    </div>
	    <div id="info_row" class="detail_content_row row">
	        <div class="col-12">
	            <h3 class="sub_title"> 인원 및 날짜 설정 </h3>
	        </div>
	        <div class="col-12">
	            <div class="info_row no_padding row">
	                <div class="col-auto"></div>
	                <div class="col info_people">
	                	시작일 :
						<input type="hidden" name="startDate">
						<input type="date" id="startDay" required>
						<input type="time" id="startTime" required></div>
	            </div>
	            <div class="info_row no_padding row">
	                <div class="col-auto">  </div>
	                <div class="col info_datetime">
	                	종료일 :
						<input type="hidden" name="endDate">
						<input type="date" id="endDay" required>
						<input type="time" id="endTime" required>
					</div>
		        </div>
	            <div class="info_row no_padding row">
	                <div class="col-auto">  </div>
	                <div class="col info_location">최소인원 :
						<input type="number" name="minpeople" min="2" value="2" required>
					</div>
	            </div>
	            <div class="info_row no_padding row">
	                <div class="col-auto">  </div>
	                <div class="col info_location">최대인원 : 
						<input type="number" name="maxpeople" min="2" max="${AD}" value="2" required>
					</div>
	            </div>
	            <div class="info_price_row info_row no_padding row" style="display: none;">
	                <div class="col-auto"></div>
	                <div class="col info_price"></div>
	            </div>
	        </div>
	    </div>
	    <!-- 모임 설명 부분 -->
	    <div id="introduce_row" class="detail_content_row row">
	        <div class="col-12 p-20"> </div>
	        <div class="col-12" id="introduce">
	       		<textarea name="context" placeholder="모임을 설명해주세요." required cols="50" rows="10" style="resize: none; border: 0.5px solid black;"></textarea>
	        </div>
	    </div>
	    <button type="button" id="submitBtn">등록하기</button>
	</div>
</form> 

<script type="text/javascript"src="${root}/onemile/resources/js/social/regMap.js"></script>
<script>
$(function(){
	$("select[name=type]").on("change",function(){
		var category = $(this).val();
		var root = "${pageContext.request.contextPath}"; 

		$.ajax({
		  url : root+'/miles/data/category/child',
  		  type : "post",
  		  data : {
  			  categorySuper : category
  		  },
	  		  success : function(resp) {
  			console.log("성공", resp);
  			
  			var middle = $(".middle");
  			middle.children().remove();
  			for (var dto of resp) {
				var middleOption = $("<option>");
				middleOption.val(dto.smallType);
				middleOption.text(dto.smallType);
				middle.append(middleOption);
			}
  		  },
  		  error : function(e) {
			  console.log("실패", e);
  		  }
  		});
	}); 
});
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>