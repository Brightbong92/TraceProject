<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<script>
	if(${empty sessionScope.loginUser}){
		alert("로그인 후 서비스 이용 가능합니다");
		location.href="../login/login.do";
	}
</script>
<!DOCTYPE html>
<html lang="en">

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
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawRightY);
	
    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages':['corechart']});
    
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {

      // Create the data table.

      var data = new google.visualization.DataTable();
      data.addColumn('string', '성별');
      data.addColumn('number', '사람수');
      data.addRows([
      	['15~19세', ${memAge1519}],
          ['20~29세', ${memAge2029}],
          ['30~39세', ${memAge3039}],
          ['40~49세', ${memAge4049}],
          ['50~59세', ${memAge5059}],
          ['60~69세', ${memAge6069}],
          ['70~79세', ${memAge7079}],
          ['80~89세', ${memAge8089}],
          ['90~99세', ${memAge9099}],
      ]); 

      // Set chart options
        var options = {
              width: '100%',
              height: '100%',
              chartArea: {         
                  left: "3%",
                  top: "3%",
                  height: "100%",
                  width: "100%"
              }
      };
      
      var data1 = new google.visualization.DataTable();
      data1.addColumn('string', '멘토링');
      data1.addColumn('number', '사람수');
      
      data1.addRows([
        ['스포츠', ${sportMTRCG}],
        ['음악', ${musicMTRCG}],
        ['공예', ${craftsMTRCG}],
        ['요리', ${cookMTRCG}],
        ['사진&영상', ${pictureMTRCG}],
        ['뷰티', ${beautyMTRCG}],
        ['음료&사교', ${bevMTRCG}],
        
        
        
      ]);
	  var data2 = google.visualization.arrayToDataTable([
	    ['신규','신규'],
	    ['7day',  ${count7}],
	    ['6day',  ${count6}],
	    ['5day',  ${count5}],
	    ['4day',  ${count4}],
	    ['3day',  ${count3}],
	    ['2day',  ${count2}],
	    ['1day',  ${count1}]
	    
	  ]);

	  var options2 = {
	    title: '최근 1주일 회원 가입현황',
	    hAxis: {title: 'day',  titleTextStyle: {color: '#333'}},
	    vAxis: {minValue: 0}
	  };


      // Set chart options
       var options1 = {
              width: '100%',
              height: '100%',
              chartArea: {         
                  left: "3%",
                  top: "3%",
                  height: "100%",
                  width: "100%"
              }
      };
      
     
      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
      var chart1 = new google.visualization.PieChart(document.getElementById('chart_div1'));
      chart1.draw(data1, options1);
      var chart2 = new google.visualization.AreaChart(document.getElementById('chart_div2'));
  	  chart2.draw(data2, options2);
      
      
    }
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawRightY);
    

    function drawRightY() {
         var data3 = google.visualization.arrayToDataTable([
                ['Gender', ' 남성', '여성'],
                ['남성, 여성', ${mencount}, ${womencount}],
              ]);

              var materialOptions = {
                chart: {
                  title: '성별으로 나눈 페이지 인원 현황',
                  subtitle: 'GENDER RATE'
                },
                hAxis: {
                  title: 'Total Population',
                  minValue: 0,
                },
                vAxis: {
                  title: 'City'
                },
                bars: 'horizontal'
              };
              var materialChart = new google.charts.Bar(document.getElementById('chart_div3'));
              materialChart.draw(data3, materialOptions);
             
         

          var data4 = google.visualization.arrayToDataTable([
        	  ['탈퇴사유', '회원수'],
              ['비싼가격', ${dis_reson1}],
              ['빈도 낮음', ${dis_reson2}],
              ['컨텐츠 부족', ${dis_reson3}],
              ['서비스 불편', ${dis_reson4}],
              ['소통부족', ${dis_reson5}],
              ['기타', ${dis_reson6}]
            ]);

            var options4 = {
              chart: {
                title: '탈퇴',
                subtitle: '탈퇴 사유및 탈퇴(정지)멤버 현황',
              }
            };
            

         	var chart3 = new google.charts.Bar(document.getElementById('columnchart_material'));

            chart3.draw(data4, google.charts.Bar.convertOptions(options4));
         
        }

    
  </script>
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
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">대시보드</h1>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${memberCount}</div>
                                    
                                </div>
                            </div>
                        </div>
                       
                            <div class="panel-footer">
                                <span class="pull-left"><strong>총회원 </strong></span>
                                
                                <div class="clearfix"></div>
                            </div>
                       
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${mentoringCount}</div>
                                    
                                </div>
                            </div>
                        </div>
                      
                            <div class="panel-footer">
                                <span class="pull-left"><strong>총멘토링</strong> </span>
                                
                                <div class="clearfix"></div>
                            </div>
                      
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${mentoCount}</div>
                                    
                                </div>
                            </div>
                        </div>
                    
                            <div class="panel-footer">
                                <span class="pull-left"><strong>총멘토 수</strong></span>
                                
                                <div class="clearfix"></div>
                            </div>
                      
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${reviewList}</div>
                               
                                </div>
                            </div>
                        </div>
                   
                            <div class="panel-footer">
                                <span class="pull-left"><strong>후기수</strong></span>
                                
                                <div class="clearfix"></div>
                            </div>
                     
                    </div>
                </div>
            </div>
                <div class="col-lg-12">
                <!-- 성지형이 넣자고했던 버튼 4개 넣을 부분 -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
                      
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	<strong>멘토링 별 회원수</strong>
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <style>
                        #chart_div text,
                        #chart_div1 text,
                        #chart_div2 text{font-size:16px !important;}
                       
                        </style>
                            <div id="chart_div1"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            	<strong>멤버 나이대별 현황</strong>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                  
                         <div id="chart_div"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
          
                
                <div class="col-lg-6">
                    <div class="panel panel-default">
                    <div class="panel-heading">
                    	
                    	<strong>탈퇴자 현황</strong>
                        </div>
                        <!-- /.panel-heading -->
                      <div class="panel-body">
                      <div id="columnchart_material" style="width: 100%; height: 200px;"></div>
                      
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	<strong>신규회원 증가량</strong>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                   <div id="chart_div3"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	<strong>최근 1주일 회원증가량</strong> 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="chart_div2"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- 남성여성 도넛차트  -->
                <!-- /.col-lg-6 -->
                
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

    <!-- Morris Charts JavaScript -->
    <script src="../resources/admin/vendor/raphael/raphael.min.js"></script>
    <script src="../resources/admin/vendor/morrisjs/morris.min.js"></script>
    <script src="../resources/admin/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/admin/dist/js/sb-admin-2.js"></script>
	
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
		
	});
</script>
</body>

</html>
