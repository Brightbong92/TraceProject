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
$(document).ready(function(){
	document.getElementById("load").style.display = "none";
});

</script>

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