	$(function(){
		let startArr = new Array(2);
		let endArr = new Array(2);
		
		$("#startDay").on("input",function(){
			startArr[0] = $(this).val();
			console.log(startArr[0]);
		});
		$("#startTime").on("input",function(){
			startArr[1] = $(this).val();
			console.log(startArr[1]);
		});
		$("#endDay").on("input",function(){
			endArr[0] = $(this).val();
			console.log(endArr[0]);
		});
		$("#endTime").on("input",function(){
			endArr[1] = $(this).val();
			console.log(endArr[1]);
			
		});
		//입력 값 Vaidate
		// 이미지
		function imgValid(){
			let imgVal = $("input[name=attach]").val();
			let valid = false;
			console.log("이미지 파일 갯수 :  "+$("input[name=attach]")[0].files.length);
			if(imgVal==""||imgVal==undefined){
				alert("이미지를 입력해주세요.");
				valid=false;
				return valid;
			}
			else{
		    	valid=true;
		    	return valid; 
			}
			return valid;
		} 
		// 제목 
		function titleValid(){
			let titleVal = $("input[name=title]").val();
			if(titleVal==""||titleVal==undefined){
				alert("제목을 입력해주세요.");
				return false;
			}
			else{
				return true;
			}
		} 
		// 관심 카테고리
		function cateValid(){
			let bigCateVal = $(".big").val();
			let middleCateVal = $(".middle").val();
			if((bigCateVal==""||bigCateVal==undefined) 
					&&(middleCateVal==""||middleCateVal==undefined)){
				alert("카테고리를 설정해주세요.");
				return false;
			}
			else{
				return true;
			}
		}
		// 모임 설명 
		function contextValid(){
			let contextVal = $("textarea[name=context]").val();
			if(contextVal==""||contextVal==undefined){
				alert("내용을 입력해주세요.");
				return false;
			}
			else{
				return true;
			}
		}
		// 지도   
		function mapValid(){
			let latVal = $("input[name=lat]").val();
			let lngVal = $("input[name=lng]").val();
			
			if((latVal!=""||latVal!=undefined)&&
				(lngVal!=""||lngVal!=undefined)){
				return true;
			}
			else{
				alert("위치를 선택해주세요.");
				return false;
			}
		}
		// 시작일  & 종료일 입력
		function startEndValid(){
			if(startArr[0]==undefined||startArr[1]==undefined){
				alert("시작시간을 입력하세요.");
				return false;
			}
			if(endArr[0]==undefined||endArr[1]==undefined){
				alert("종료시간을 입력하세요.");
				console.log(endVal);
				return false;
			}
			return true;
		}
		//시작일 종료일 비교
		function startEndCompare(){
			if(startArr[0]>endArr[0]){
				alert("시작일과 종료일을 확인해주세요.");
				return false;
			}
			else{
				if(startArr[0]==endArr[0]&&startArr[1]>endArr[1]){
					alert("시작시간과 종료시간을 확인해주세요.");
					return false;
				}
				return true;
			}
			return true;
		}
		function inputDate(day,time){
			let formdate = day + " "+time+":00";
				return formdate;
		}
		$("#submitBtn").on("click",function(){
			let startDate = inputDate($("#startDay").val(),$("#startTime").val());
			let endDate = inputDate($("#endDay").val(),$("#endTime").val());
			console.log("지도      상세주소   "+$("#location").val());
			$("input[name=endDate]").val(endArr[0]+" "+endArr[1]+":00");
			$("input[name=startDate]").val(startArr[0]+" "+startArr[1]+":00");
			
			console.log("startDate      :"+ $("input[name=startDate]").val());
			console.log("EndDate      :"+ $("input[name=endDate]").val());

			console.log();
			
			if(titleValid() &&contextValid()&&imgValid() && cateValid()  &&
				contextValid() && mapValid() &&startEndValid()&&startEndCompare()){
				$("#regForm").submit();
			}
		});

	});