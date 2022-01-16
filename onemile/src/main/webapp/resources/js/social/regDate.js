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
	
});