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


  <!-- 검색 자동완성 -->
  <script src="../auto/AutoComplete.js" type="text/javascript"></script>
  <link href="../auto/AutoComplete.css" rel="stylesheet">

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

</style>
<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" style="background-color :#ffffff !important" >  <!-- 머리색 -->
    <div class="container" style="max-width:80% !important;">
      <a class="navbar-brand" href="/"><img src="../images/로고1.png" width="120" height="50" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</a>
	
		<!-- 검색 -->
	  <div class="autocomplete" style="width:300px;">
      <input type="text" style="width:600px;" id="searchBar" placeholder="하고 싶은 멘토링을 검색해 보세요." onkeyup="find(this)"/><!-- 검색 -->
      </div>
 	  <div id="searchOpt" style="color:red;"></div>
      <input type="hidden" id="findFlag" value="Off">
	  <!--  &nbsp;&nbsp;&nbsp;-->
	  <!--  <button class="btn btn-primary" id="searchBtn" onclick="find()">검색</button>-->
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto" >
          <li class="nav-item">
              <a class="nav-link" href="../mentoring/mentoring_list.do?sort=99" style="color:black;">멘토링</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../mentor/mentor_apply.do" style="color:black;">멘토신청</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../hobbytest/hobby_test.do" style="color:black;">취미테스트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../notice/list.do" style="color:black;">공지사항</a>
          </li>
          
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
	              <a class="dropdown-item" href="../login/logout.do">로그아웃</a>
	            </div>
	          </li>
	          
	         <!-- 관리자로그인 했을시 나오게끔 -->
	         <c:if test="${loginUser.mem_email eq 'admin'}">
		          <li class="nav-item">
		            <a class="nav-link" href="../admin/search.do?cp=1&keyword=" style="color:black;" >
		              	관리자 페이지
		            </a>
		          </li>
	          </c:if>
	          <!--  <img src="../images/cartImg.jpg" width="30px" height="30px"/>-->
	          <img src="../images/cartImg2.png" width="22px" height="22px" onclick="location.href='../cart/cart.do?mem_email=${loginUser.mem_email}'" style="margin-top:7px"/>
		          <c:if test="${cartCount ne 0}">
		          	<span class="nav-counter">${cartCount}</span>
		          </c:if>
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
<script type="text/javascript">
		function find(e) {
			var word = document.getElementById('searchBar').value;
			if($("#searchBar").val() != "") {
				if(event.keyCode == 13) {
					//alert(word);
					var w =  word.indexOf("#");
					var gugsae = word.indexOf("^");
					var rSlash = word.indexOf("\\");
					
					if(gugsae != -1 || rSlash != -1){
						alert("검색에 형식에 어긋나는 문자가 있습니다.");
						$("#searchBar").val("");
						$("#searchBar").focus();
						return false;
					}
						if(w == -1) {//일반검색시
							//alert("#포함안됨" + word)
							location.href="../mentoring/searchList.do?word="+word+"&cp=1";
						}else {//#검색시
							//alert("#포함됨" + word);
							word = word.replace("#",".");
							//alert(word);
							location.href="../mentoring/searchList.do?word="+word+"&cp=1";
						}
					}
					//location.href="../mentoring/searchList.do?word="+word+"&cp=1";
				
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
var str = ['요가','요리','여행','여가', '와인', '댄스', '필라테스', '디제잉', '가죽', '향수', '가죽공예', '술', '커피', '음료', '헬스', '보드', '주짓수', '말', '승마', '스쿼시', '펜싱', '아카펠라', '스윙댄스', '스윙', '자수', '베이킹', '바텐더', '유튜브', '피아노', '방송댄스', '케이스', '키링', '초콜렛', '건강', '발레', '#발레', '#키링', '#베이킹', '#빵', '#유튜브', '#방송댄스', '#댄스', '#사진', '사진', '공예', '#공예', '스키', '#스키', '인스타그램', '#인스타그램','눈썹','프랑스자수','자수','반지', '손수건','마카롱','테니스','네일','아트'];
autocomplete(document.getElementById("searchBar"), str);
</script>
