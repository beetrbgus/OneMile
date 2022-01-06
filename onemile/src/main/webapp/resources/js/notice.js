function fn_noticeWrite(){
	var subject = $("#title").val();
	var name = $("#nt_writer").val();
	var content = $("#cont").val();
	
	$.ajax({
		type : "POST",
		url : "/notice/write",
		data : {title : title, nt_writer : nt_writer, cont : cont},
		success: function(data){
			if(data == "Y"){
				alert("글 등록이 완료되었습니다.");
				location.href = "/notice/list";		
			}
		},
		error: function(data){
			alert("실패");
			console.log(data);
		}
	});
};