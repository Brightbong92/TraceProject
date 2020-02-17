<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../top.jsp" %>
<script>
	if(${empty sessionScope.loginUser}){
		alert("로그인 후 서비스 이용 가능합니다");
		location.href="../login/login.do";
	}
</script>

	<div style="width:1200px;height:1000px;">
		<div id="msgContents">
		</div>
	</div>
	<div align='center'>
	<input type="text" name="txt" id="msg"/>
	<button type="button" name="btn" id="sendMsg">send</button>
	</div>
<script>
var socket = null;
$(document).ready(function(){
	connectWS();
	
	$('#sendMsg').on('click', function(evt) {
		  evt.preventDefault();
		if (socket.readyState !== 1) return;
			  let msg = $('#msg').val();
			  socket.send(msg);
			  $('#msg').val("");
		});
	function connectWS() {
		var ws = new WebSocket("ws://127.0.0.1:8080/freeEcho");
		socket = ws;
		ws.onopen = function () {
		    console.log('Info: connection opened.');
		};
		ws.onmessage = function (event) {
		    console.log("ReceiveMessage: ", event.data+'\n');
		    
		    $("#msgContents").append(event.data);
		};
		ws.onclose = function (event) { 
			console.log('Info: connection closed.');
	   		//setTimeout( function(){ connect(); }, 1000); // retry connection!!
		};
		ws.onerror = function (err) { console.log('Error', err); };	
	}
});
</script>
<%@include file="../footer.jsp" %>

