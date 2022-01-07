<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.notice {
	color: red;
}
</style>
<!-- <script>
let imgList = new Array();
let folder = "member";
	$(function(){
		$("input[name=attach]").on("input", function(e){
			
// 			파일이 선택되지 않은 경우는 차단
			if(!this.files || !this.files[0]) {
				return;
			}
// 			2. 낱개 데이터를 업로드
			var formData = new FormData();
			formData.append("attach", this.files[0]);
			formData.append("folder", "member");
			
			$.ajax({
				url:"${pageContext.request.contextPath}/image/upload",
				type:"post",
				data:formData,
				data:imgList,
				dataType:"text",
				processData:false,
				contentType:false,
				success:function(resp){
					console.log("성공", resp);
					console.log("resp    "+resp);
					var tag = $("<img>").attr("src", "${pageContext.request.contextPath}/image/download?imageNo="+resp+"&folder="+folder)
													.addClass("preview");
					$("#result").append(tag);
					$("input[name=imageList]").val(resp);
					imgList.push(resp);
					console.log(imgList);
				},
				error:function(e){
					console.log("실패", e);
				}
			});
		});
	});
</script> -->
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
	       for(var i in input){
	          $('#img'+i).attr('src', e.target.result[i]);
	    	   
	       }
       }
       reader.readAsDataURL(input.files[0]);
    }
}
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
		function setThumbnail(imagefile) {
			console.log("썸네일    "+imagefile)
            var reader = new FileReader();
            reader.onload = function (imagefile) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                document.querySelector("div#preview").appendChild(img);
            };
            reader.readAsDataURL(event.target.files[0]); }
        
		 
 }); 		
</script>
<script>
function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}
let birth = $("#birth"); 
birth.attr("min",getToday);

$(function(){
	//아이디 중복확인 Ajax
   	$("input[name=email]").on("blur", function(){
   		var input = $("input[name=email]").val();
   		$.ajax({
   			url : "${root}/member/emailcheck",
				type : "get",
				data : {
					email : input
				},
				success : function(resp) {
					if (resp == "YESICAN") {
					} else if (resp == "NONONO") {
						$("input[name=email]").next().text("이미 사용중인 이메일입니다.");
					}
				},
				error : function(err) {
			}
		});
	});
  //닉네임 중복확인 Ajax
   	$("input[name=nick]").on("blur", function(){
   		var input = $("input[name=nick]").val();
   		$.ajax({
   			url : "${root}/member/nickcheck",
				type : "get",
				data : {
					nick : input
				},
				success : function(resp) {
					if (resp == "YESICAN") {
					} else if (resp == "NONONO") {
						$("input[name=nick]").next().text("이미 사용중인 닉네임입니다.");
					}
				},
				error : function(err) {
			}
		});
	});
  //전화번호 중복확인 Ajax
   	$("input[name=phone]").on("blur", function(){
   		var input = $("input[name=phone]").val();
   		$.ajax({
   			url : "${root}/member/phonecheck",
				type : "get",
				data : {
					phone : input
				},
				success : function(resp) {
					if (resp == "YESICAN") {
					} else if (resp == "NONONO") {
						$("input[name=phone]").next().text("이미 사용중인 전화번호입니다.");
					}
				},
				error : function(err) {
			}
		});
	});

});

//이메일 정규표현식
function emailCheck() {
		var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		var input = document.querySelector("input[name=email]");
		var notice = input.nextElementSibling;
		
		if (input.value.length == 0 || regex.test(input.value)) {
			notice.textContent = "";
			return true;
			} else {
			notice.textContent = "이메일 형식이 올바르지 않습니다";
			return false;
		}
	}
//비밀번호 정규표현식
function pwCheck(){
    var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
    var input = document.querySelector("input[name=pw]");
    var notice = input.nextElementSibling;

    if(regex.test(input.value)){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "비밀번호는 8~16자 이내의 영문,숫자,특수문자로 작성하세요";
        return false;
    }
}
//비밀번호 확인
function pw2Check(){
    var pwInput = document.querySelector("input[name=pw]");
    var pw2Input = document.querySelector("input[name=pw2]");
    var notice = pw2Input.nextElementSibling;

   if(pwInput.value.length > 0 && pwInput.value == pw2Input.value){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "비밀번호가 일치하지 않습니다";
        return false;
    }
}	
//닉네임 정규표현식
function nickCheck(){
	var regex = /^[가-힣0-9]{2,10}$/;
	var input = document.querySelector("input[name=nick]");
    var notice = input.nextElementSibling;

   	if(regex.test(input.value)){
         notice.textContent = "";
         return true;
     }
     else{
         notice.textContent = "닉네임은 한글, 숫자 2~10자로 작성하세요";
         return false;
     }
}
//연락처 정규표현식
function phoneCheck(){
    var regex = /^01[016789]-[1-9][0-9]{3}-[0-9]{4}$/;
    var input = document.querySelector("input[name=phone]");
    var notice = input.nextElementSibling;

    if(input.value.length == 0 || regex.test(input.value)){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "전화번호는 -포함 13자리로 작성하세요";
        return false;
    }
} 
//생년월일 정규표현식
function birthCheck(){
  	var regex = /^(19[0-9][0-9]|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	var input = document.querySelector("input[name=birth]");
   	var notice = input.nextElementSibling;

    if(input.value.length > 0 && regex.text(input.value)){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "올바른 날짜를 선택해주세요";
        return false;
    }
}
//정규식들 종합체크
function formCheck(){
    return emailCheck() && pwCheck() && pw2Check() && nickCheck() && birthCheck() && phoneCheck();
}

/* 멀티페이지 */
	$(function(){
  		$(".page").hide();
    	$(".page").eq(0).show();
    	
    	var p = 0;
		
    	$(".next").click(function(e){
        e.preventDefault();
		
        p++;
        console.log(p)
        $(".page").hide();
        $(".page").eq(p).show();
    });
    
  	    $(".prev").click(function(e){
        e.preventDefault();

        p--;
        $(".page").hide();
        $(".page").eq(p).show();
    });
});

/* 카테고리 */
$(function(){
		$(".big").change(function(){
			
		var category = $(this).val();
		$.ajax({
		  url : "${pageContext.request.contextPath}/miles/data/category/child",
  		  type : "post",
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

/* 선택한 카테고리 출력하기 */
$(function(){
	$(".middle").change(function(){
		var div = $("#category-select");
		var big = $("select[name=location] option:selected").val();
		var middle = $(this).val();
		
		var select = $("<input type='text' placeholder=' "+big+""+middle+" '>");
		var select2 = $("<button type='button' class='delete'>x</button>");
		
		div.append(select);
		div.append(select2);
	});
	
		/* 버튼누르면 해당 카테고리 삭제 */
		$(".delete").on("click", function () {
    	$(this).parent().remove();
    });
});

/* 자기소개 글자수 체크 */
function lengCheck() {
	var input = document.querySelector("#intro");
    var output = document.querySelector("#intro-length");
    var len = input.value.length;
    //만약 1000글자가 넘어간다면 넘어간 만큼 글자를 제거
    while(len > 100) {
        input.value = input.value.substring(0,input.value.length-1);
        len--;
    }
    //글자 정리 후 길이 설정
    output.textContent = len;
}
</script>

<form method="post" enctype="multipart/form-data"
	onsubmit="return formCheck();">

	<!-- 1페이지 -->
	<div class="page">
		<div class="container-400 container-center">

			<div class="row center">
				<h1>회원가입</h1>
			</div>
			<div class="row">
				<label>프로필 사진</label> <input type="file" name="attach" multiple>
			</div>
			<div class="row">
				<label>이메일</label> <input type="email" name="email" required
					class="form-input" autocomplete="off" onblur="emailCheck();">
				<div class="notice"></div>
			</div>
			<div class="row">
				<label>비밀번호</label> <input type="password" name="pw" required
					class="form-input" autocomplete="off" onblur="pwCheck();">
				<div class="notice"></div>
			</div>
			<div class="row">
				<label>비밀번호 확인</label> <input type="password" name="pw2" required
					class="form-input" autocomplete="off" onblur="pw2Check();">
				<div class="notice"></div>
			</div>
			<div class="row">
				<label>닉네임</label> <input type="text" name="nick" required
					class="form-input" autocomplete="off" onblur="nickCheck();">
				<div class="notice"></div>
			</div>
			<div class="row">
				<label>연락처</label> <input type="tel" name="phone" class="form-input"
					autocomplete="off" onblur="phoneCheck();"
					placeholder="전화번호 -포함 13자리를 입력해주세요.">
				<div class="notice"></div>
			</div>
			<div class="row">
				<label>생년월일</label> <input type="date" name="birth" id="birth"
					required class="form-input form-inline" autocomplete="off"
					onblur="birthCheck();">
			</div>
			<div class="row">
				<label>성별</label> <select name="gender">
					<option value="남자">남자</option>
					<option value="여자">여자</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div class="row">
				<textarea name="intro" rows="5" cols="50" placeholder="자기소개를 작성해주세요"
					id="intro" oninput="lengCheck();"></textarea>
			</div>
			<div class="row reft">
				<span id="intro-length">0</span> / 100
			</div>
			<div class="row">
				<input type="checkbox" required>[필수]이용약관과 개인정보처리방침에 동의
			</div>

			<div class="row">
				<button type="button" class="form-btn next">다음으로</button>
			</div>
		</div>
	</div>

	<!-- 2페이지 -->
	<div class="page">
		<div class="container-400 container-center">
			<div class="row center">
				<h1>회원가입</h1>
			</div>
			<div class="row">
				<label>관심사 설정</label>
			</div>

			<div class="row">
				<select class="big" name="location">
					<option value="">관심사 선택</option>
					<c:forEach var="category" items="${category}">
						<option value="${category.bigType}">${category.bigType}</option>
					</c:forEach>
				</select> 
				<select class="middle" name="smalltype"></select>
			</div>
			<div id="category-select"></div>

			<div class="row">
				<label>MBTI</label> 
				<br> 
				<select name="mbti">
					<option value="ISTJ">ISTJ</option>
					<option value="ISFJ">ISFJ</option>
					<option value="INFJ">INFJ</option>
					<option value="INTJ">INTJ</option>
					<option value="ISTP">ISTP</option>
					<option value="ISFP">ISFP</option>
					<option value="INFP">INFP</option>
					<option value="INTP">INTP</option>
					<option value="ESTP">ESTP</option>
					<option value="ESFP">ESFP</option>
					<option value="ENFP">ENFP</option>
					<option value="ENTP">ENTP</option>
					<option value="ESTJ">ESTJ</option>
					<option value="ESFJ">ESFJ</option>
					<option value="ENFJ">ENFJ</option>
					<option value="ENTJ">ENTJ</option>
				</select>
			</div>

			<div class="row">
				<label>코로나 백신접종여부</label> <input type="file" name="corona"
					accept="image/*" class="form-input">
			</div>

			<button type="button" class="form-btn prev">이전 단계로</button>
			<div class="row">
				<input type="submit" value="가입" class="form-btn">
			</div>

		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>