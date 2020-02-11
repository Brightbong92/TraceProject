<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!--jsp:include page="../top.jsp" /-->

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
    		
    	}
    </script>
	<script>
		var width = 0;
		var cnt = 1;
		var point = 0;
		function pbFunc(i) {
			point = point + i;
			var newprogress= document.getElementById("pb");
			if(width < 100){
				width += 10;
				newprogress.style.width = width+'%';
				document.getElementById("pb").innerHTML = width+'%';
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
					alert("총점 :"+point);
				}
			
				cnt++;
			}
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
	<p align="center" id="comment">두 이미지중 마음에 드는 한가지를 선택하세요.</p>
	<br/>
	<button class="btn" id="btn" type="button" onclick="pbFunc(0)" style="margin-left:90px;display:none" ><img class="btn-img" id="img1" src="../resources/hobbyTest/1-1.jpg" style="width:370px; height:370px;"></button>
	<button class="btn" id="btn" type="button" onclick="pbFunc(1)" style="margin-left:210px;display:none"><img class="btn-img" id="img2" src="../resources/hobbyTest/1-2.jpg" style="width:370px; height:370px;"></button>
	
	<br/><br/><br/><br/><br/>
	<div class="progress">
	  <div class="progress-bar progress-bar-striped active" role="progressbar"
	  aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="pb">
	    0%
	  </div>
	</div>
	<div align="center" style="margin-top:10px;">
	<button type="button" class="button" id="start" onClick="start()" style="margin-bottom:50px;color:white; background:#3b67f7; font-size:1em; border-radius:0.5em; padding:5px 20px;">StartNow</button>
  	<button onClick="window.location.reload()" style="margin-bottom:50px;color:white; background:pink; font-size:1em; border-radius:0.5em; padding:5px 20px;">Restart</button>
  	
  	</div>
  </div>
  <!-- /.container -->

<%@include file="../footer.jsp"%>
