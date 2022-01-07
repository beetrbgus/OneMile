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


function fn_boardUpdate(){
	var seq = $("#seq").val();
	var subject = $("#subject").val();
	var name = $("#name").val();
	var content = $("#content").val();

	$.ajax({
		type : "POST",
		url : "/board/update",
		data : {seq: seq, subject : subject, name : name, content : content},
		success: function(data){
			if(data == "Y"){
				alert("글 수정이 완료되었습니다.");
				fn_goView(seq);
			}else{
				alert("글 수정이 실패되었습니다.");
			}
		},
		error: function(data){
			alert("실패");
			console.log(data);
		}
	});
}

function fn_noticeDelete(seq){
	$.ajax({
		type : "POST",
		url : "/notice/delete",
		data : {seq: seq},
		success: function(data){
			if(data == "Y"){
				alert("글 삭제 완료되었습니다.");
				location.href = "/notice/list";		
			}
		},
		error: function(data){
			alert("실패");
			console.log(data);
		}
	});
}

function fn_goView(seq){
	$("#seq").val(seq);

	var f = $("#frm");
	f.attr("action", "/notice/view");
	f.attr("method", "POST");
	f.submit();
};

function fn_goEditView(seq){
	$("#seq").val(seq);

	var f = $("#frm");
	f.attr("action", "/notice/goEditView");
	f.attr("method", "POST");
	f.submit();
};