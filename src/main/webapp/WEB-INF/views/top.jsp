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

  <!-- 검색 자동완성 -->
  <script src="../auto/AutoComplete.js" type="text/javascript"></script>
  <link href="../auto/AutoComplete.css" rel="stylesheet">
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/"><img src="../images/logo.png" width="110" height="50" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</a>
	
		<!-- 검색 -->
	  <div class="autocomplete" style="width:300px;">
      <input type="text" style="width:300px;" id="searchBar" placeholder="하고 싶은 멘토링을 검색해 보세요." onkeyup="find(this)"/><!-- 검색 -->
      </div>
 	  <div id="searchOpt" style="color:red;"></div>
      <input type="hidden" id="findFlag" value="Off">
	  <!--  &nbsp;&nbsp;&nbsp;-->
	  <!--  <button class="btn btn-primary" id="searchBtn" onclick="find()">검색</button>-->
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="../notice/list.do">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../mentor/mentor_apply.do">멘토신청</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../hobbytest/hobby_test.do">취미테스트</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	멘토링수업
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="../mentoring/list1.do">정렬방식 1</a>
              <!--  <a class="dropdown-item" href="../mentoring/list2.do">검색</a>-->
              <a class="dropdown-item" href="../mentoring/mentoring_list.do?sort=99">멘토링리스트</a>
              <a class="dropdown-item" href="../mentoring/list4.do">정렬방식 4</a>
              <a class="dropdown-item" href="../mentoring/list5.do">정렬방식 5</a>
            </div>
          </li>
          
            <!-- 로그인했을 시 나오게끔 -->
	          <c:if test="${!empty loginUser}">
	          <li class="nav-item dropdown">
	          
	          <c:choose>
	          
	          <c:when test="${loginUser.mem_auth == 0}">
		          	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	              		${loginUser.mem_nick} 님
	                </a>
		          </c:when>
		          
	          <c:when test="${loginUser.mem_auth == 1}">
		            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		              	${loginUser.mem_nick} 멘토님
		            </a>
		          </c:when>
		          
		          <c:otherwise>
		            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		              	${loginUser.mem_nick} 님
		            </a>
		          </c:otherwise>
    
	          </c:choose>

	            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
	              <a class="dropdown-item" href="#">마이페이지</a>
	              <a class="dropdown-item" href="#">개인정보 수정</a>
	              <a class="dropdown-item" href="#">수강중인멘토링</a>
	              <c:if test="${loginUser.mem_auth > 0}">
	              <a class="dropdown-item" href="../mentoring/mentoringWriteForm.do">멘토링등록하기</a>
	              </c:if>
	              <a class="dropdown-item" href="../login/logout.do">로그아웃</a>
	            </div>
	          </li>
	          </c:if>
           <!-- 로그인안했을 시 나오게끔 -->
	      <c:if test="${empty loginUser}">
		          <li class="nav-item">
		            <a class="nav-link" href="../login/login.do">로그인</a>
		          </li>
          </c:if>
          <!-- 관리자로그인 했을시 나오게끔 -->
         <c:if test="${loginUser.mem_email eq 'admin'}">
	          <li class="nav-item">
	            <a class="nav-link" href="../admin/dashboard.do" >
	              	관리자 페이지
	            </a>
					
	          </li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav>
<script type="text/javascript">
		function find(e) {
			var word = document.getElementById('searchBar').value;
			if($("#searchBar").val() != "") {
				if(event.keyCode == 13) {
					//alert(word);
					var w =  word.indexOf("#");
					if(w == -1) {//일반검색시
						//alert("#포함안됨" + word)
						location.href="../mentoring/searchList.do?word="+word+"&cp=1";
					}else {//#검색시
						//alert("#포함됨" + word);
						word = word.replace("#",".");
						//alert(word);
						location.href="../mentoring/searchList.do?word="+word+"&cp=1";
					}
					//location.href="../mentoring/searchList.do?word="+word+"&cp=1";
				}
			}else {
				//alert("검색어를 입력해주세요.");
				$("#searchBar").focus();
				return false;
			}
			
		}
		$(document).ready(function(){
			$("#searchBar").mouseover(function(){
				$("#searchOpt").text("해시태그 & 제목 검색가능");
			});
			$("#searchBar").mouseleave(function(){
				$("#searchOpt").text("");
			});
		});
</script>
<script>
<%--
	$(document).ready(function(){
		$("#searchBar").on('keyup', function(){
			if($("#searchBar").val() != ""){
				if($("#searchBar").val().length >= 1) {
					//setTimeout(function() {
						$.ajax({
							type: "POST",
							contentType: "application/json",
							url: "../mentoring/autoSearch.do?word="+$("#searchBar").val(),
							success: function(data){
								//var arr = JSON.stringify(data);
								//alert(data.length);
								var arr = [];
								for(var i = 0; i<data.length; i++){
									arr.push(data[i]);
									//console.log(data[i]);
								}
									str = arr;
									console.log("str: " + str);
									//alert(str);
								//autocomplete(document.getElementById("searchBar"), arr);
							},
							error: function(err) {
								alert("실패");
								console.log(err);
							}
						});
					//}, 3000);
					
				}
				
			}
			
		});
		
	});
--%>
</script>
<script>
var str = ['요가','요리','여행','여가', '와인', '댄스', '필라테스', '디제잉', '가죽', '향수', '가죽공예', '술', '커피', '음료', '헬스', '#요가', '#굿', '#음악'];
autocomplete(document.getElementById("searchBar"), str);
</script>
