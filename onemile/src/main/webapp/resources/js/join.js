$(function(){
	// 아이디 중복확인 Ajax
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
   	
  // 닉네임 중복확인 Ajax
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
   	
  // 전화번호 중복확인 Ajax
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

// 이메일 정규표현식
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
// 비밀번호 정규표현식
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
// 비밀번호 확인
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
// 닉네임 정규표현식
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
// 연락처 정규표현식
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
// 생년월일 정규표현식
function birthCheck(){
    // 입력이 되어있는지만 확인
    var input = document.querySelector("input[name=birth]");
    var notice = input.nextElementSibling;

    if(input.value.length > 0){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "생년월일을 선택하세요";
        return false;
    }
}

// 정규식들 종합체크
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

//자기소개 글자수
function lengCheck() {
 
    var input = document.querySelector("#intro");
    var output = document.querySelector("#intro-length");

    var len = input.value.length;
    
    // 만약 1000글자가 넘어간다면 넘어간 만큼 글자를 제거
    while(len > 100) {
        input.value = input.value.substring(0,input.value.length-1);
        len--;
    }

    // 글자 정리 후 길이 설정
    output.textContent = len;
}