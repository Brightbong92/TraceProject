<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>

<style type="text/css">

	#load {
	 width: 100%;
	 height: 100%;
	 top: 0;
	 left: 0;
	 position: fixed;
	 display: block;
	 opacity: 0.8;
	 background: white;
	 z-index: 99;
	 text-align: center;
	}
	
	 
	
	#load > img {
	 position: absolute;
	 top: 40%;
	 left: 30%;
	 z-index: 100;
	}
	
	</style>
<div id="load">

 <img src="../resources/images/loading14.gif" alt="loading">

</div>
<script>
var socket = null;
$(document).ready(function(){
	
	<%--
	if("${loginUser.mem_email}" != "") {//로그인되었을 시 웹소켓 연결
		console.clear();
		//console.log("${loginUser.mem_email}");
		connectWS();//소켓연결
	}
	--%>	
	document.getElementById("load").style.display = "none";
	
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
<%--
<script>
$(document).ready(function (){
	connect();
	
	$('#sendMsg').on('click', function(evt) {
		  evt.preventDefault();
		if (socket.readyState !== 1) return;
			  let msg = $('#message').val();
			  socket.send(msg);
		});
});
</script>
--%>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 발자취 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>