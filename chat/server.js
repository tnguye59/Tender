
var express = require("express");
var path = require("path");
var app = express();

var server = app.listen(8000, function() {
 console.log("listening on port 8000");
})

var io = require('socket.io').listen(server)

var history = []

io.sockets.on('connection', function (socket) {
  console.log("WE ARE USING SOCKETS!");
  console.log(socket.id);

  io.emit("welcome");
  
  socket.emit("feed", {messageFeed: history})

socket.on("message", function(data){
	history.push({message: data.message});
	io.emit("newMessage", {message: data.message});
	})

})
 