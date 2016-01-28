// $(document).ready(function(){
// 	var socket = io.connect("http://127.0.0.1:8000", {force_connection: true});

// 	alert($("#chat-id").val());
// 	socket.on("welcome", function(){
// 		$("#chatbox").append("<p>Has entered chatroom</p>")
// 	})

// 	$("#chat-form").submit(function(){
// 		var info = $("#textbox").val();
// 		var name = $("#name").val();
// 		var message = name + " says: " + info;
// 		socket.emit("message", {message: message})
// 		$("#textbox").val("");
// 		return false;
// 	})

// 	socket.on("newMessage", function(response){
// 		$("#chatbox").append("<p>" response.message + "</p>");
// 	})

// 		socket.on("feed", function(response){
// 		for(var i = 0; i < response.messageFeed.length; i++) {
//  			$("#chatbox").append("<p><span class='user'>" + response.messageFeed[i].user.slice(1)+ "</span>: " + response.messageFeed[i].message + "</p>")
//  		}
// 	})
// })

