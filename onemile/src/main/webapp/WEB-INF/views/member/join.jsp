<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.notice {
	color: red;
}
.outer2 {
	display: flex;
	justify-content: center;
}
</style>

<script>
/* let imgList = new Array();
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
  
		function setThumbnail(imagefile) {
			console.log("썸네일    "+imagefile)
            var reader = new FileReader();
            reader.onload = function (imagefile) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                document.querySelector("div#preview").appendChild(img);
            };
            reader.readAsDataURL(event.target.files[0]); } */
        
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

<script>
//기본 날짜 설정
function getToday(){
    var date = new Date();
    var year = date.getFullYear()-20;
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    date = year+'-'+month+'-'+day;
    $("#birth").val(date);
	$("#birth").attr("value",date);
	$("#birth").attr("max",date);
    return date;
  } 

$(function(){
	$("#birth").attr("value");
	$("#birth").attr("max",getToday);
	
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
onsubmit="return formCheck();" name="frm_join" id="frm_join"
class="wz form" novalidate="novalidate">

<div class="page">
<div class="outer2">
	<div class="wz container form-container" style="width: 500px">
		<h2 class="wz text display2 page-title">회원가입</h2>
		<p class="page-description">고객님의 회원가입을 환영합니다!</p>
		
			<div class="field name-field ">
				<label>프로필 사진<br>
				[최대 3장, 5MB까지 등록 가능합니다]</label> 
				<input type="file" name="attach" multiple accept=".jpg, .png">
			</div>
			<!-- 미리보기  -->
			<div id="result" style="width: 5px"></div>
		
			<div class="field name-field ">
				<label class="label">이메일</label>
				<div class="wz input">
					<input id="nickName" class="input text block large" type="email"
						placeholder="이메일 입력" name="email" required aria-required="true"
						autocomplete="off" onblur="emailCheck();">
						<div class="notice"></div>
				</div>
			</div>
			
			<div class="field password-field group">
				<div class="field">
					<label class="label">비밀번호</label>
					<div class="wz input">
						<input id="pwd1" type="password" name="pw" class="input large"
							placeholder="비밀번호" required aria-required="true"
							autocomplete="off" onblur="pwCheck();">
							<div class="notice"></div>
					</div>
				</div>
				<div class="field">
					<div class="wz input">
						<input id="pwd2" type="password" name="pw2" class="input large"
							placeholder="비밀번호 확인" required aria-required="true"
							autocomplete="off" onblur="pw2Check();">
							<div class="notice"></div>
					</div>
				</div>
			</div>
			
			<div class="field password-field group">
				<label class="label">닉네임</label>
				<div class="wz input">
					<input id="nickName" class="input text block large" type="text"
						placeholder="닉네임 입력" name="nick" required aria-required="true"
						autocomplete="off" onblur="nickCheck();">
						<div class="notice"></div>
				</div>
			</div>
			
			<div class="field password-field group">
				<label class="label">연락처</label>
				<div class="wz input">
					<input id="nickName" class="input text block large" type="tel"
						placeholder="-포함 13자리를 입력해주세요." name="phone" required
						aria-required="true" autocomplete="off" onblur="phoneCheck();">
						<div class="notice"></div>
				</div>
			</div>
			
			<div class="field password-field group">
				<label class="label">생년월일</label>
				<div class="wz input">
					<input id="birth" class="input text block large" type="date"
						name="birth"  required aria-required="true">
						<div class="notice"></div>
				</div>
			</div>
			
			<div class="field password-field group">
				<div class="wz input">
					<label class="label">성별</label> <select name="gender">
						<option value="남자">남자</option>
						<option value="여자">여자</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>
			
			<button type="button" id="btnJoin" class="wz button primary block next">다음으로</button>
		</div>
	</div>
</div>	
			
<!-- 2페이지 -->
<div class="page">
	<div class="outer2">
		<div class="wz container form-container" style="width: 500px">
		<h2 class="wz text display2 page-title">회원가입</h2>
		<p class="page-description">고객님의 회원가입을 환영합니다!</p>
			
			<div class="field password-field group" style="margin-top: 70px">
				<label class="label">자기소개</label>
				<div class="wz input">
				<textarea name="intro" rows="5" cols="50"
						placeholder="자기소개를 작성해주세요" id="intro" oninput="lengCheck();"
						class="input text block large"></textarea>
				</div>
			</div>
			<div class="field password-field group">
				<div class="wz input">
					<label>관심사 설정</label>
			<div class="row">
				<select class="big" name="like">
					<option value="">관심사 선택</option>
					<c:forEach var="category" items="${category}">
						<option value="${category.bigType}">${category.bigType}</option>
					</c:forEach>
				</select> 
				<select class="middle" name="smalltype"></select>
			</div>
			<div id="category-select"></div>
			</div>
			</div>
			
			<div class="field password-field group">
				<div class="wz input">
				<label>MBTI</label> 
				<br> 
				<select name="mbti">
					<option value="선택안함">없음</option>
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
			</div>
			<div class="terms-check-all">
				<label class="wz checkbox"> <input type="checkbox"
					id="agreeAllCheckPage" name="agreeAllCheckPage" value="Y"
					style="padding-right: 15px;" required> <span
					class="wz text subtext1">전체동의<br> <span
						class="wz text caption1"> 원마일·회원 서비스(필수), KH정보교육원 서비스 (필수),
						파이널프로젝트 서비스 (필수)</span>
				</span> <em class="helper error"></em>
				</label>
			</div>
			<div class="field password-field group">
				<div class="wz input">
			<button type="button" id="btnJoin" class="wz button primary block prev">이전 단계로</button>
			</div>
			</div>
			<input type="submit" id="btnJoin" class="wz button primary block" onclick="formCheck();" value="가입하기">
			
		</div>
	</div>
</div>
		
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>