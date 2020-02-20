<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.MemberListResult"%>
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

    <!-- DataTables CSS -->
    <link href="../resources/admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../resources/admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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
                    <h1 class="page-header">회원정보</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	member information
                        </div>
                          
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="">
							<select id="psId" name="ps" onchange="f(this)" style="float:left">
								<c:choose>
						           <c:when test="${memberListResult.pageSize == 10}">
								  	   <option value="10" selected>10</option>
								       <option value="30">30</option>
								       <option value="50">50</option>
							       </c:when>
							       <c:when test="${memberListResult.pageSize == 30}">
								  	   <option value="10">10</option>
								       <option value="30" selected>30</option>
								       <option value="50">50</option>
							       </c:when>
							       <c:when test="${memberListResult.pageSize == 50}">
								  	   <option value="10">10</option>
								       <option value="30">30</option>
								       <option value="50" selected>50</option>
							       </c:when>
						       </c:choose>
						    </select>
                            	개씩 보기
                            	<script language="javascript">
							       function f(select){
							           var el = document.getElementById("psId");
							           var ps = el.value;
							           location.href="../admin/search.do?ps="+ps+"&keyword=";
							       }
							    </script>
							    
							    <div class="input-group custom-search-form" style="width:220px; float:right">
	                                <input type="text" class="form-control" id="search_input2" placeholder="회원 검색">
	                                <span class="input-group-btn">
	                                <button type="submit" class="btn btn-default" id="search_button2" ">
	                                    <i class="fa fa-search"></i>
	                                </button>
	                            </span>
	                            </div>
	                            
	                            <tr/>
	                            
                                <thead>
                                    <tr>
                                        <th>닉네임</th>
                                        <th>이메일</th>
                                        <th>계정권한</th>
                                        <th>계정상태</th>
                                        <th>가입일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${memberListResult.member_list}" var="list">
                                	
                                    <tr class="odd gradeX" style = "cursor:pointer;" 
                                    onclick="window.open('../admin/popup.do?mem_email=${list.mem_email}','팝업이름','width=500px,height=500px,left=100px,top=100px');">
                                        <td>${list.mem_nick}</td>
                                        <td>${list.mem_email}</td>
                                        <c:choose>
                                        	<c:when test="${list.mem_auth eq 0}">
                                        		<td>일반회원</td>
                                        	</c:when>
                                        	<c:when test="${list.mem_auth eq 1}">
                                        		<td>멘토</td>
                                        	</c:when>
                                        	<c:when test="${list.mem_auth eq 2}">
                                        		<td>관리자</td>
                                        	</c:when>
                                        </c:choose>
                                        <c:choose>
	                                        <c:when test="${list.mem_state eq 0}">
	                                        <td class="center">O</td>
	                                        </c:when>
	                                        <c:when test="${list.mem_state eq 1}">
	                                        <td class="center">O(신고)</td>
	                                        </c:when>
	                                        <c:when test="${list.mem_state eq 2}">
	                                        <td class="center">X</td>
	                                        </c:when>
                                        </c:choose>
                                        <td class="center">${list.mem_rdate}</td>
                                    </tr>
                                    
                                    </c:forEach>
                                </tbody>
                            </table>
<%
		MemberListResult ml = (MemberListResult)request.getAttribute("memberListResult");
%>                       
                            	발자취 총 회원 수 : ${memberListResult.totalCount} 명
                             <div class="board_paging" align="center">
									<button  onclick="javascript:location.href='../admin/search.do?cp=1&keyword=<%=ml.getKeyword()%>'">&#x000AB;</button>
									<c:if test="${memberListResult.currentPage ne 1}">
									<button  onclick="javascript:location.href='../admin/search.do?cp=${memberListResult.currentPage-1}&keyword=<%=ml.getKeyword()%>'">&#x02039;</button>
									</c:if>
									<c:forEach begin="1" end="${memberListResult.totalPageCount}" var="i">
											<c:choose>
												<c:when test="${i==memberListResult.currentPage}">
													<button onclick="javascript:location.href='../admin/search.do?cp=${i}&keyword=<%=ml.getKeyword()%>'" class="on"><strong>${i}</strong></button>
												</c:when>
											<c:otherwise>
												 <button onclick="javascript:location.href='../admin/search.do?cp=${i}&keyword=<%=ml.getKeyword()%>'">${i}</button>
											</c:otherwise>
											</c:choose>
									</c:forEach>
									<c:if test="${memberListResult.currentPage ne memberListResult.totalPageCount}">
									<button  onclick="javascript:location.href='../admin/search.do?cp=${memberListResult.currentPage+1}&keyword=<%=ml.getKeyword()%>'">&#x0203A;</button>
									</c:if>
									<button  onclick="javascript:location.href='../admin/search.do?cp=${memberListResult.totalPageCount}&keyword=<%=ml.getKeyword()%>'">&#x000BB;</button>
								</div>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            vip 회원
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr class="success">
                                            <th>#</th>
                                            <th>닉네임</th>
                                            <th>이메일</th>
                                            <th>수강한 멘토링 수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${memberListResult.vip_list}" var="list" varStatus="status">
	                                        <tr class="success">
	                                            <td>${status.count}</td>
	                                            <td>${list.mem_nick}</td>
	                                            <td>${list.mem_email}</td>
	                                            <td>${list.cnt}</td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	후기 순
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr class="info">
                                            <th>#</th>
                                            <th>닉네임</th>
                                            <th>이메일</th>
                                            <th>작성한 후기 수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${memberListResult.review_list}" var="list" varStatus="status">
	                                        <tr class="info">
	                                            <td>${status.count}</td>
	                                            <td>${list.mem_nick}</td>
	                                            <td>${list.mem_email}</td>
	                                            <td>${list.cnt}</td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           	 포인트순
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr class="warning">
                                            <th>#</th>
                                            <th>닉네임</th>
                                            <th>이메일</th>
                                            <th>보유한 포인트</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${memberListResult.point_list}" var="list" varStatus="status">
                                        <tr class="warning">
                                            <td>${status.count}</td>
                                            <td>${list.mem_nick}</td>
                                            <td>${list.mem_email}</td>
                                            <td>${list.mem_point}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            최근 가입한 회원
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive table-bordered">
                                <table class="table">
                                    <thead>
                                        <tr class="danger">
                                            <th>#</th>
                                            <th>닉네임</th>
                                            <th>이메일</th>
                                            <th>가입한 날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${memberListResult.new_list}" var="list" varStatus="status">
	                                        <tr class="danger">
	                                            <td>${status.count}</td>
	                                            <td>${list.mem_nick}</td>
	                                            <td>${list.mem_email}</td>
	                                            <td>${list.mem_rdate}</td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
           
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../resources/admin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../resources/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../resources/admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../resources/admin/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/admin/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
	<script>
	$(document).ready(function() {
		$('#search_button1').click(function(){
			var keyword = $('#search_input1').val();
			location.href="../admin/search.do?cp=1&keyword="+keyword;
		});
		$('#search_input1').keypress(function(event){
		     if ( event.which == 13 ) {
		         $('#search_button1').click();
		         return false;
		     }
		});
		
		$('#search_button2').click(function(){
			var keyword = $('#search_input2').val();
			location.href="../admin/search.do?cp=1&keyword="+keyword;
		});
		$('#search_input2').keypress(function(event){
		     if ( event.which == 13 ) {
		         $('#search_button2').click();
		         return false;
		     }
		});
	});
</script>
</body>

</html>
