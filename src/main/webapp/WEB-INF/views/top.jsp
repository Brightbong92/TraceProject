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
  
 <!-- JQuery사용용도 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Custom styles for this template -->
  <link href="../css/modern-business.css" rel="stylesheet">
  <!-- Paging CSS -->
  <link href="../css/paging.css" rel="stylesheet">  
  
 
</head>
<script type="text/javascript">
		function find(e) {
			var word = document.getElementById('searchBar').value;
			if(event.keyCode == 13) {
				location.href="../mentoring/searchList.do?word="+word;
			}
		}
</script>
<body>

	
	
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/">발견하라</a>
      <input type="text" style="width:300px;" id="searchBar" placeholder="하고 싶은 멘토링을 검색해 보세요." onkeydown="find(this)"/>
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
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	${loginUser.mem_nick} 님
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.html">마이페이지</a>
              <a class="dropdown-item" href="blog-home-2.html">개인정보 수정</a>
              <a class="dropdown-item" href="blog-post.html">수강중인멘토링</a>
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
         
          <li class="nav-item">
            <a class="nav-link" href="../admin/dashboard.do">관리자 페이지</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

