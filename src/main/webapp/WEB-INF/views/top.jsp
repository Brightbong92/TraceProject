<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>발자취 - 발견하라 자신의 취미를</title>
  
  <!-- JQuery사용용도--> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
  <!-- 회원가입 CheckByteLen용도 -->
  <script src="../js/trim.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Custom styles for this template -->
  <link href="../css/modern-business.css" rel="stylesheet">
  <!-- Paging CSS -->
  <link href="../css/paging.css" rel="stylesheet">
  <!-- 평점 CSS -->
  <link href="../css/star.css" rel="stylesheet">

  
  <!-- 버튼/카트 HOVER CSS -->
  <link href="../css/lazy.css" rel="stylesheet">


  <!-- 검색 자동완성-->
  <script src="../auto/AutoComplete.js" type="text/javascript"></script>
  <link href="../auto/AutoComplete.css" rel="stylesheet">
  
  <!-- 폰트적용 -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <!---->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" type="text/css" href="path/to/xeicon/xeicon.min.css">
	  
</head>
<style>
.nav-counter {
 position:relative;
 height: 20px;
 padding: 0 6px;
 font-weight: normal;
 font-size: small;
 color: white;
 text-align: center;
 text-shadow: 0 1px rgba(0, 0, 0, 0.2);
 background: #e23442;
 border: 1px solid #911f28;
 border-radius: 11px;
 background-image: -webkit-linear-gradient(top, #e8616c, #dd202f);
 background-image: -moz-linear-gradient(top, #e8616c, #dd202f);
 background-image: -o-linear-gradient(top, #e8616c, #dd202f);
 background-image: linear-gradient(to bottom, #e8616c, #dd202f);
 -webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
 box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);

}
@font-face {
  font-family: 'Noto Sans KR', sans-serif;
}
body {
  font-family: Noto Sans KR;
}
</style>
<body>
  <div id="socketAlert" class="alert alert-success" role="alert" style="height:50px;display:none;"></div>
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" style="background-color :#ffffff !important; border-bottom:1px solid #dfe1e5;" >  <!-- 머리색 -->
    <div class="container">
    <!-- <div class="container" style="max-width:80% !important;"> -->
      <!-- a class="navbar-brand" href="/" style="margin-left:13%"><img src="../images/로고1.png" width="120" height="50" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
      <a class="navbar-brand" href="/"><img src="../images/hobbyspace-logo.png" width="120" height="70" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</a>
	
	<!-- 검색 onkeyup="find(this)"-->
	<!-- 검색 -->

<style>

.autocomplete .seacrh_Wrap { position:relative;}
.autocomplete .seacrh_Wrap .search_form {width:100%; height: 40px; border-radius:20px; border:0px; padding:3px 11% 3px 5%; border:2px solid #3fb1fc; outline:none;}
.autocomplete .seacrh_Wrap .search_btn {position:absolute; right:0; top:0; width:40px; height:40px;}
.autocomplete .seacrh_Wrap .search_btn .xi { width:100%; height:auto; font-size:28px; line-height:40px; color:#3fb1fc;}
@media (min-width: 992px){
	.top_right_wrap { display:inline-block !important; width:45%; }
	.top_right_wrap > ul {float:right; clear:both;}
	.top_right_wrap > ul > li {display:inline-block !important;}
}

</style>
	  <div class="autocomplete" style=" width:40%; ">
	  	<div class="seacrh_Wrap">
	  	<input name="cur" class="sc-iuJeZd kCAAcw search_form" type="text" style="" id="searchBar" placeholder="멘토링 or 태그 검색" onkeyup="find(this);"/>
	  	<a class="search_btn"><i class="xi-search xi"></i></a>
	  	</div>
		  <div id="searchBarautocomplete-list" class="autocomplete-items" style="width:100%;">
		  </div>
	   
      </div>
      
	  <!--  &nbsp;&nbsp;&nbsp;-->
	  <!--  <button class="btn btn-primary" id="searchBtn" onclick="find()">검색</button>-->
      <button class="navbar-toggler navbar-toggler-right" type="button"  style="background:#3fb1fc" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse top_right_wrap" id="navbarResponsive">
      <c:if test="${empty loginUser}">
        <ul class="navbar-nav ml-auto" style="">
		</c:if>
		<c:if test="${!empty loginUser}">
        <ul class="navbar-nav ml-auto" style="">
		</c:if>

           <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">
	               취미공간
	       </a>
	        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog" >
	        	  <a class="dropdown-item" href="../mentoring/mentoring_list.do?sort=99" >멘토링</a>
	              <a class="dropdown-item" href="../mentor/mentor_apply.do">멘토신청</a>
	        </div>
           </li>

          <li class="nav-item">
            <a class="nav-link" href="../hobbytest/hobby_test.do" style="color:black;">취미테스트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../notice/list.do" style="color:black;">공지사항</a>
          </li>
          
 	<%--
 	      <li class="nav-item">
              <a class="nav-link" href="../mentoring/mentoring_list.do?sort=99" style="color:black;">멘토링</a>
          </li>
          <li class="nav-item">
           	  <a class="nav-link" href="../mentor/mentor_apply.do" style="color:black;">멘토신청</a>
          </li>
 	 --%>
          
            <!-- 로그인했을 시 나오게끔 -->
	          <c:if test="${!empty loginUser}">
	          <li class="nav-item dropdown">
	          
	          <c:choose>
	          
	          <c:when test="${loginUser.mem_auth == 0}">
		          	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">
	              		${loginUser.mem_nick} 님
	                </a>
		          </c:when>
		          
	          <c:when test="${loginUser.mem_auth == 1}">
		            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">
		              	${loginUser.mem_nick} 멘토님
		            </a>
		          </c:when>
		          
		          <c:otherwise>
		            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">
		              	${loginUser.mem_nick} 님
		            </a>
		          </c:otherwise>
    
	          </c:choose>

	            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog" >
	              <a class="dropdown-item" href="../mypage/myInfo.do" >마이페이지</a>
	              <a class="dropdown-item" href="../mypage/myInfo.do">회원정보 수정</a>
	              <a class="dropdown-item" href="../mypage/myActivity.do?mem_email=${loginUser.mem_email}">나의 활동내역</a>
	              <a class="dropdown-item" href="../cart/cart.do?mem_email=${loginUser.mem_email}">장바구니</a>
	              <c:if test="${loginUser.mem_auth > 0}">
	              <a class="dropdown-item" href="../mentoring/mentoringWriteForm.do">멘토링등록하기</a>
	              </c:if>
	              <%-- <a class="dropdown-item" href="../chat/free.do"></a>--%>
	              <!-- 관리자로그인 했을시 나오게끔 -->
		          <c:if test="${loginUser.mem_email eq 'admin'}">
			          <a class="dropdown-item" href="../admin/charts.do">관리자 페이지</a>
		          </c:if>
	              
	              <a class="dropdown-item" href="../login/logout.do">로그아웃</a>
	            </div>
	          </li>
	          <%-- 
	         <!-- 관리자로그인 했을시 나오게끔 -->
	         <c:if test="${loginUser.mem_email eq 'admin'}">
		          <li class="nav-item">
		            <a class="nav-link" href="../admin/charts.do" style="color:black;" >
		              	관리자 페이지
		            </a>
		          </li>
	          </c:if>
	          --%>
	          <!--  <img src="../images/cartImg.jpg" width="30px" height="30px"/>-->
	          <img src="../images/cartImg2.png" width="22px" height="22px" onclick="location.href='../cart/cart.do?mem_email=${loginUser.mem_email}'" style="margin-top:7px; cursor:pointer;"/>
	          	<c:choose>
		          <c:when test="${cartCount ne 0}">
		          	<span id="cart_tot_count" class="nav-counter">${cartCount}</span>
		          </c:when>
		          <c:when test="${cartCount eq 0}">
		          	<span id="cart_tot_count" class="nav-counter" style="display:none;"></span>
		          </c:when>
		        </c:choose>
		    
		    	&emsp;
				<div id="msg_store_dropdown" class="dropdown">
					<img id="msg_store" data-toggle="dropdown" src="../images/bellIcon.jpg" alt="" style="width:22px;height:22px;margin-top:9px;cursor:pointer;">
					
					 
					<c:choose>
						<c:when test="${msgAlarmCount ne 0}">
							<span id="msg_tot_count" class="nav-counter">${msgAlarmCount}</span>
						</c:when>
						<c:when test="${msgAlarmCount eq 0}">
							<span id="msg_tot_count" class="nav-counter" style="display:none;"></span>
						</c:when>
					</c:choose>
					
					
					
					<div id="msg_store_box" class="dropdown-menu">
					<%-- 
					<div id="msg_store_box" class="dropdown-menu" style="display:none;">
						<a class="dropdown-item" href="#">333번 글에 댓글이 달렸습니다.</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">32번 글에 질문이 달렸습니다.</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">222번 글에 후기가 달렸습니다.</a>
						<div class="dropdown-divider"></div>
					--%>
						
					</div>
				</div>

		       </c:if>
           <!-- 로그인안했을 시 나오게끔 -->
	      <c:if test="${empty loginUser}">
		          <li class="nav-item">
		            <a class="nav-link" href="../login/login.do" style="color:black;">로그인</a>
		          </li>
          </c:if>
        </ul>
      </div>
      
    </div>
  </nav>
<script>

$(document).ready(function(){

	$(document).click(function(e){
		if(!$(e.target).is("#msg_store_box")) {
			$("#msg_store_box *").remove();
		}
	});

	$("#msg_store").on('click', function(){
	//var flag = $("#msg_store_box").hasClass('dropdown-menu show');//alert("flag: " + flag);
	var flag = $("#msg_store_dropdown").hasClass('dropdown show');
		if(flag == false) {
			//$("#msg_tot_count").append("<div id='msg_store_box' class='dropdown-menu show'>");
			//$("#msg_store_box").show();
			$.ajax({
				url: "../login/msgCheck.do",
				type:"POST",
				contentType: "application/json",
				dataType:"json",
				success: function(data){
					console.clear();//console.log("data: " + JSON.stringify(data));

					if(data.length == 0) {
						$("#msg_store_box").append("<div class='dropdown-item'>메세지가 없습니다.</div>");
					}
					$.each(data, function(idx, val) {
						$("#msg_store_box").append(val.ms_content);
					});
						//$("#msg_tot_count").css("display", "none");
				},error: function(err) {
					console.clear();
					console.log("실패");
				}
			});
		}else if(flag == true) {
			$("#msg_store_box *").remove();
		}
	});
	
	/*
	$("#msg_store_box").on('mouseleave', function(){
		$("#msg_store_box *").remove();
	});
	*/
	
	
});

</script>
<script type="text/javascript">
String.prototype.replaceAll = function(org, dest) {
    return this.split(org).join(dest);
}
arr = [];
currentFocus = -1;
function find(e) {
	var word = document.getElementById('searchBar').value;
	
	if($("#searchBar").val() == "") {
		$("#searchBarautocomplete-list *").remove();
	}
	
	if($("#searchBar").val() != "") {
		if(event.keyCode == 13) {
			var w =  word.indexOf("#");
			var w2 = word.indexOf("^");
			var w3 = word.indexOf("\\");
	        var w4 = word.indexOf("[");
	        var w5 = word.indexOf("]");

	         if(w2 != -1) {
	            word = word.replaceAll("^", " ");
	         }
	         if(w3 != -1) {
	            word = word.replaceAll("\\", " ");
	         }
	         
	         if(w4 != -1 || w5 != -1) {
	            alert("특수문자 [] 를 제거해주세요.");
	            return false;
	         }

				if(w == -1) {//일반검색시//alert("#포함안됨" + word)
					location.href="../mentoring/searchList.do?word="+word+"&cp=1";
				}
				else {//#검색시
					word = word.replace("#","샵");
					location.href="../mentoring/searchList.do?word="+word+"&cp=1";
				}
			}else if(event.keyCode == 40){				//alert("다운키");
				var x = document.getElementById("searchBarautocomplete-list");
				if (x) x = x.getElementsByTagName("div");
				currentFocus++;
				console.clear();
				console.log(currentFocus);
				addActive(x);
		        $("#searchBar").val($(".autocomplete-active").text());
		        return false;
			}else if(event.keyCode == 38) {				//alert("업키");
				var x = document.getElementById("searchBarautocomplete-list");
				if (x) x = x.getElementsByTagName("div");
				currentFocus--;
				addActive(x);
				$("#searchBar").val($(".autocomplete-active").text());
			}else {
				$.ajax({
					type: "POST",
					contentType: "application/json",
					data: JSON.stringify($("#searchBar").val()),
					url: "../mentoring/autoSearch.do",
					success: function(data) {
						var l = arr.length;
						arr.splice(0, l);
						$("#searchBarautocomplete-list *").remove();
							for(m of data.list) {
								var b = document.createElement("DIV");
								b.setAttribute("class", "click-item");
								//b.innerHTML = "<strong style='color:red'>"+m.substr(0,$("#searchBar").val().length)+"</strong>";
								//b.innerHTML += m.substr($("#searchBar").val().length);
								//b.innerHTML += "<input type='hidden' id = 'bong' value='" + m + "'>";
								b.innerHTML = m;
								$("#searchBarautocomplete-list").append(b);
							}
				              $('.click-item').click(function(e) {
				                  $("#searchBar").val(e.target.innerText);
				                  $("#searchBarautocomplete-list *").remove();
				                  $("#searchBar").focus();
				              });     
					},
					error: function(err) {
						console.log("err: "+err);
					}
				});
			}
	}else {
		//alert("검색어를 입력해주세요.");
		//$("#searchBar").focus();
		return false;
	}
}
</script>
<script>
function addActive(x) {
    if (!x) return false;
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    x[currentFocus].classList.add("autocomplete-active");
  }
function removeActive(x) {
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  
function msCheck(obj){
	   var ms_seq = $(obj).attr("ms_seq");
	   
	   $.ajax({
	      url:"../login/msgCheckUpdate.do?ms_seq="+ms_seq,
	      success:function(data){
	         console.clear();
	         //console.log("메세지상태변경 & 메세지세션변경 성공");
	         
	         //console.log("data: " + data);
	         
	         if(data == 0) {
	            $("#msg_tot_count").css('display', 'none');
	            console.log("data1: " + data);
	         }else {
	              $("#msg_tot_count").text(data);
	              console.log("data2: " + data);
	           }

	      },error:function(err){
	         console.clear();
	         //console.log("메세지상태변경 & 메세지세션변경 실패");
	      }
	   });
	}
</script>
