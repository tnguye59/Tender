$(document).ready(function(){
	var socket = io.connect("http://127.0.0.1:8000", {force_connection: true});

	socket.on("welcome", function(response){
		$("#chatbox").append("<p>Has entered chatroom</p>")
	})

	$("#chat-form").submit(function(){
		var info = $("#textbox").val();
		socket.emit("message", {message: info})
		$("#textbox").val("");
		return false;
	})
})

