<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<script>
	if(${empty sessionScope.loginUser}){
		alert("로그인 후 서비스 이용 가능합니다");
		location.href="../login/login.do";
	}
</script>
<!DOCTYPE html>
<html lang="kor">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>발자취 - 발견하라 자신의 취미를</title>

    <!-- Bootstrap Core CSS -->
    <link href="../resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	
</head>
<body>
    <div id="wrapper">
			<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../admin/charts.do">관리자 페이지</a>
            </div>
            <!-- /.navbar-header -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" id="search_input1" placeholder="회원 검색">
                                <span class="input-group-btn">
                                <button type="submit" class="btn btn-default" id="search_button1">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="../admin/charts.do"><i class="fa fa-bar-chart-o fa-fw"></i> 대시보드</a>
                        </li>
                        <li>
                            <a href="../admin/search.do?cp=1&keyword="><i class="fa fa-table fa-fw"></i> 회원정보</a>
                        </li>
                        <li>
                            <a href="../admin/mentor_info.do"><i class="fa fa-sitemap fa-fw"></i> 멘토정보</a>
                        </li>
                        
                        <li>
                            <a href="../admin/notice_form.do"><i class="fa fa-edit fa-fw"></i> 공지사항 작성</a>
                        </li>
                        <li>
                            <a href="../"><i class="fa fa-edit fa-fw"></i> 메인페이지로</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">공지사항 작성</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Notice Write Form
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form name="input" id="form-id" method="post" action="../admin/notice_write.do">
                                    	<input type='hidden' name='mem_email' value='admin'>
                                        <div class="form-group">
                                        	&nbsp;
                                            <label>제목</label>
                                            <input class="form-control" name="noti_subject" style="width:1100px;" required>
                                        </div>
                                       
                                        <div class="form-group">
                                        	&nbsp;
                                            <label>공지내용</label>
                                            <div class="editor-container">
                                            <textarea class="form-control" id="summernote" name="noti_content" required ></textarea>
                                        </div>
                                        </div>
                                        
                                        <button type="submit" class="btn btn-default" id="btn-world">Submit</button>
                                        <button type="reset" class="btn btn-default" id="button1">Reset</button>
                                    </form>
                                </div>
                                
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <!--<script src="../resources/admin/vendor/jquery/jquery.min.js"></script>  -->

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/admin/dist/js/sb-admin-2.js"></script>
	
	<script>
	$(document).ready(function() {
		$('#search_button1').click(function(){
			var keyword = $('#search_input1').val();
			location.href="../admin/search.do?keyword="+keyword;
		});
		$('#search_input1').keypress(function(event){
		     if ( event.which == 13 ) {
		         $('#search_button1').click();
		         return false;
		     }
		});
		
	});
</script>
<script> 
	  $('#summernote').summernote({
	      tabsize: 2,
	      height: 300,
	      width : 1100,
	      lang: 'ko-KR'
	  });
  
	  $('#summernote').on('summernote.keyup', function(){
		  if($(this).val().length > 300){
			  alert("글자수 제한 300자를 넘었습니다.");
              $(this).val($(this).val().substring(0, 300));
              var btn = document.getElementById('btn-world');
              btn.disabled = "disabled";
		  }else if($(this).val().length <= 300){
			  $(this).val($(this).val().substring(0, 300));
              var btn = document.getElementById('btn-world');
			  btn.disabled = false;
		  }
	  });
	  
	  $("#button1").on("click", function () {
	      $('#summernote').summernote("code", "");
	    });
	  
	  $('#btn-world').on('click', function(e) {
		  if($('#summernote').summernote('isEmpty')) {
		    alert('제목, 내용을 적어주세요');
		    e.preventDefault();
		  }
		  else{
			  return true; 
		  }
	  });
	  </script>
</body>

</html>
