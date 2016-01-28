$(document).ready(function(){
	var socket = io.connect("http://127.0.0.1:8000", {force_connection: true});

	socket.on("welcome", function(){
		$("#chatbox").append("<p>Has entered chatroom</p>")
	})
})

