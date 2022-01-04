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

		};

		sock.onclose = function() {
			console.log('connect close');
		};

		sock.onerror = function(err) {
			console.log('Errors : ', err);
		};

	}
});