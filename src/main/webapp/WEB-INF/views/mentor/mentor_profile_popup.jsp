<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>멘토 프로필 페이지</title>

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/modern-business.css" rel="stylesheet">

</head>

<body>


  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${mProfile.mentor_member_info.mem_nick}
      <small>멘토님 정보입니다</small>
    </h1>

    <!-- Blog Post -->
    <div class="card mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-6">
            <a href="#">
              <img class="img-fluid rounded" src="../resources/profileImage/${mProfile.mentor_member_info.mem_profile}" alt="">
            </a>
          </div>
          <div class="col-lg-6">
            <h2 class="card-title">자기소개</h2>
            <p class="card-text">${mProfile.mentor_list_info.ml_yourself}</p>
            <a href="#" class="btn btn-primary">채팅하기 </a><!-- &rarr; -->
          </div>
        </div>
      </div>
      <div class="card-footer text-muted">
        	가입일: ${mProfile.mentor_member_info.mem_rdate}
      </div>
    </div>

    
</div>
  <!-- /.container -->
  
</body>

</html>
