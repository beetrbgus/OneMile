$(function() {

	var socket = null;

	$(document).ready(function() { // 준비가 되면
		connectWs();
	});

	function connectWs() {
		sock = new SockJS("");
		socket = sock;

		sock.onopen = function() {
			console.log('info:connection opened.');
		};

		sock.onmessage = function(evt) {
			var data = evt.data;

			var toastTop = app.toast.create({
				text : "알림 : " + data + "\n",
				closeButton : true,
				debug : false,
				newestOnTop : false,
				progressBar : false,
				positionClass : "toast-top-right",
				preventDuplicates : false,
				onclick : null,
				showDuration : 300,
				hideDuration : 1000,
				timeOut : 5000,
				extendedTimeOut : 1000,
				showEasing : "swing",
				hideEasing : "linear",
				showMethod : "fadeIn",
				hideMethod : "fadeOut"
			});
			toastTop.open();
		};

		sock.onclose = function() {
			console.log('connect close');
		};

		sock.onerror = function(err) {
			console.log('Errors : ', err);
		};

	}
});