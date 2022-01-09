$(function() {
	let deadLine = $("#deadLine").val();
	let deadLineDate = new Date(deadLine);
	let now = new Date();
	console.log("deadLineDate    " + deadLineDate);
	dontBuy();

	let diffTime = passed(deadLine);
	console.log("passed의    diffTime  " + diffTime);
	let diffTimeMsg = getDiffMessage(diffTime);
	$(".remaining-day").text(diffTimeMsg);

	$(".quantity").on("change", function() {
		$(".quantity").val($(this).val());
	});
	$(".buyBtn").on("click", function() {
		if (cnt()) {
			$("#buyForm").submit();
		}
	});
	function cnt() {
		let count = $("#buyForm").find("input[name='quantity']").val();
		let left = $("#buyForm").find("input[name='stock']").val();
		if (count == 0 || count==undefined) {
			alert("수량을 선택해주세요.");
			return false;
		}
		if (count > left) {
			alert("구매 가능 수량을 초과했습니다.");
			$("#buyForm").find("input[name='quantity']").val(left);
			return false;
		}
			return true;
	}
	function dontBuy() {
		let stock = $("input[name=stock]").val();
		console.log("stock    " + stock);
		if (stock == 0) {
			$(".buyBtn").attr("disabled", true);
			$(".buyBtn").text("품절");
		} else {
			$(".buyBtn").attr("disabled", false);
		}
	}
	function passed(deadLine) {

		let due = new Date(deadLine);
		let now = new Date();

		let diffTime = due.getTime() - now.getTime();

		if (diffTime < 0) {
			$(".buyBtn").attr("disabled", false);
			$(".buyBtn").text("구매 불가");
		}
		return diffTime;
	}
	function getDiffMessage(diffTime) {
		let diffMessage = "";
		if (diffTime <= 0) {
			return diffMessage = "마감";
		} else {
			let diffDay = Math.floor(diffTime / (1000 * 60 * 60 * 24));
			diffTime -= diffDay * (1000 * 60 * 60 * 24);
			console
					.log("diffTimediffTimediffTimediffTime          "
							+ diffTime);
			let diffHour = Math.floor(diffTime / (1000 * 60 * 60));
			diffTime -= diffHour * (1000 * 60 * 60);

			let diffMin = Math.floor(diffTime / (1000 * 60));
			diffTime -= diffMin * (1000 * 60);

			return diffMessage = diffDay + "일  " + diffHour + " 시간 " + diffMin
					+ " 분 남음";
		}
	}
});