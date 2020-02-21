<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!-- jsp:include page="../top.jsp"/-->

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .btn-profile{
            position: relative;
            overflow: hidden;
        }
        .btn-profile input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }
    </style>
    <script>
    	function start(){
    		document.getElementById("btn1").style.display = "inline-block";
    		document.getElementById("btn2").style.display = "inline-block";
    		document.getElementById("comment1").style.display = "none";
    		document.getElementById("comment2").style.display = "block";
    	}
    </script>
	<script>
		var width = 0;
		var cnt = 1;
		var point = 0;
		
		function pbFunc(i) {
			point = point + i;
			
			//진행 바 
			var newprogress= document.getElementById("pb");
			if(width < 100){
				width += 10;
				newprogress.style.width = width+'%';
				document.getElementById("pb").innerHTML = width+'%';
			}
			//선택된 이미지 크게 띄우기 
			if(i == 0){
				var image1= document.getElementById("img1");
				var image2= document.getElementById("img2");
				var btn1= document.getElementById("btn1");
				var btn2= document.getElementById("btn2");
				image1.style.width = 900;
				image1.style.height = 500;
				btn1.style.width = 920;
				btn1.style.height = 520;
				btn1.disabled = "true";
				btn1.style.opacity = 100;
				document.getElementById("comment2").style.display = "none";
				btn2.style.display = "none"; 
				image2.style.display = "none"; 
				setTimeout(function(){
					document.getElementById("comment2").style.display = "block";
					btn1.disabled = "";
					btn1.style.width = 390;
					btn1.style.height = 390;
					image1.style.width = 370;
					image1.style.height = 370;
					btn2.style.display = "inline-block";
					image2.style.display = "inline-block";
				},1500);
				
			}else if (i == 1){
				var image1= document.getElementById("img1");
				var image2= document.getElementById("img2");
				var btn1= document.getElementById("btn1");
				var btn2= document.getElementById("btn2");
				image2.style.width = 900;
				image2.style.height = 500;
				btn2.style.width = 920;
				btn2.style.height = 520;
				btn2.disabled = "true";
				btn2.style.opacity = 100;
				document.getElementById("comment2").style.display = "none";
				btn1.style.display = "none";
				image1.style.display = "none";
				setTimeout(function(){
					document.getElementById("comment2").style.display = "block";
					btn2.disabled = "";
					btn2.style.width = 390;
					btn2.style.height = 390;
					image2.style.width = 370;
					image2.style.height = 370;
					btn1.style.display = "inline-block";
					image1.style.display = "inline-block";
				},2500);
			}
			//다음 이미지 띄우기 & 결과페이지로 이동하기
			setTimeout(function(){
				
					if(cnt==1){
						img1.src="../resources/hobbyTest/2-1.jpg";
						img2.src="../resources/hobbyTest/2-2.jpg";
					}else if(cnt ==2){
						img1.src="../resources/hobbyTest/3-1.jpg";
						img2.src="../resources/hobbyTest/3-2.jpg";
					}else if(cnt ==3){
						img1.src="../resources/hobbyTest/4-1.jpg";
						img2.src="../resources/hobbyTest/4-2.jpg";
					}else if(cnt ==4){
						img1.src="../resources/hobbyTest/5-1.jpg";
						img2.src="../resources/hobbyTest/5-2.jpg";
					}else if(cnt ==5){
						img1.src="../resources/hobbyTest/6-1.jpg";
						img2.src="../resources/hobbyTest/6-2.jpg";
					}else if(cnt ==6){
						img1.src="../resources/hobbyTest/7-1.jpg";
						img2.src="../resources/hobbyTest/7-2.jpg";
					}else if(cnt ==7){
						img1.src="../resources/hobbyTest/8-1.jpg";
						img2.src="../resources/hobbyTest/8-2.jpg";
					}else if(cnt ==8){
						img1.src="../resources/hobbyTest/9-1.jpg";
						img2.src="../resources/hobbyTest/9-2.jpg";
					}else if(cnt ==9){
						img1.src="../resources/hobbyTest/10-1.jpg";
						img2.src="../resources/hobbyTest/10-2.jpg";
					}else if(cnt ==10){
						//alert("총점 :"+point);
						test();
						setTimeout(function(){
							if(point >= 0 && point <4){
								//alert("소극적");
								location.href="../hobbytest/testResult1.do";
							}else if(point >= 4 && point <8){
								//alert("보통");
								location.href="../hobbytest/testResult2.do";
							}else if(point >= 8){
								//alert("활동적");
								location.href="../hobbytest/testResult3.do";
							}
						},1500);
						
					}
				
					cnt++;
				},1500);
		}
		</script>
		<script>
		
			function test(){
				document.getElementById("load").style.display = "block";
			}
		</script>
</head>
<body>
	
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">취미테스트
      <small>발견하라 자신의 취향!</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/">Home</a>
      </li>
      <li class="breadcrumb-item active">Hobby Test</li>
    </ol>
	<p style="margin-top:80px;font-size:23px;" align="center"><strong> 취미분석 테스트 </strong> </p>
	<br/>
	<pre id="comment1" style="font-size:20px;" > 
		<strong>
		당신의 취미는 무엇입니까?
		취미 분석을 통해 나를 보다 깊게 알아보세요.
		총 검사 시간은 1분 내외 입니다.
		
		-총 10문항-
		</strong>
	</pre>
	<pre align="center" id="comment2" style="display:none;font-size:20px"><strong>두 이미지중 마음에 드는 한가지를 선택하세요.</strong></pre>
	<br/>
	<button class="btn" id="btn1" type="button" onclick="pbFunc(0)" style="margin-left:90px;display:none" ><img class="btn-img" id="img1" src="../resources/hobbyTest/1-1.jpg" style="width:370px; height:370px;"></button>
	<button class="btn" id="btn2" type="button" onclick="pbFunc(1)" style="margin-left:210px;display:none"><img class="btn-img" id="img2" src="../resources/hobbyTest/1-2.jpg" style="width:370px; height:370px;"></button>
	
	<br/><br/><br/><br/><br/>
	<div class="progress">
	  <div class="progress-bar progress-bar-striped active" role="progressbar"
	  aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="pb">
	    0%
	  </div>
	</div>
	<div align="center" style="margin-top:10px;">
	<button onClick="window.location.reload()" style="margin-bottom:50px;color:white; background:#ffa04d; font-size:1em; border-radius:0.5em; padding:5px 20px;">Restart</button>
	<button type="button" class="button" id="start" onClick="start()" style="margin-bottom:50px;color:white; background:#3b67f7; font-size:1em; border-radius:0.5em; padding:5px 20px;">StartNow</button> 
  
  	
  	</div>
  </div>
  <!-- /.container -->
  
  <style type="text/css">

		#load {
		 width: 100%;
		 height: 100%;
		 top: 0;
		 left: 0;
		 position: fixed;
		 display: none;
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
	 <p style="margin-top:480px; font-size:25px; color:#3fb1fc"><strong>당신의 성향에 맞는 취미를 분석중입니다.</strong></p>
	</div>

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
