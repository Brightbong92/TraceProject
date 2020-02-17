<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />

	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	<link href="../css/board.css" rel="stylesheet" type="text/css" />
	
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	<style>
		#board_area{
			margin: 0 10% 0 10%;
		}
		#top_side{
			margin-top: 70px;	
		    margin-bottom: 70px;		
		}
		#div1{
			background-color: black;
			padding: 15px;
		}
		#div1_1 button{
			color:white;
		}
		 #div1_2{
		 	position: relative;
            left:250%
        }
        #div1_2_btn{
            margin-left: 5px;
            float: right;
            background-color: black;
            border-color: black;
            color: white;
        }
		
		#div2_1 button{
			color: black;
		}
	</style>
	<title>공지사항</title>
	<style>
    .editor-container {
	  margin: 0 auto;
 	}
    </style>
</head>
<script type="text/javascript">
	function search(e){
		var keyword = document.getElementById('search').value;
		if(event.keyCode == 13) {
			location.href="../notice/search.do?keyword="+keyword;
		}
	}
</script>
<body>
<div id="board_area">
	<h1 class="mt-4 mb-3">공지사항 
    </h1>
	<div id="div1" class="row">
		<div class="form-inline">
			<div id="div1_1">
				<button type="button" onclick="location.href='../notice/list.do?cp=1'"  class="btn btn-link" >공지사항</button>
				<button type="button" onclick="location.href='../notice/qna.do'"  class="btn btn-link" style="color:gray;">자주 묻는 질문</button>
			</div>

			<div id="div1_2"  >
				<input type="text" id="search" class="form-control" onkeydown="search(this)" placeholder="Search" style="width:160pt;" />
			</div>
		</div>
	</div>
	<br/>
	<div class="panel-body">
        <div class="row">
            <div class="col-lg-6">
                <form name="input" method="post" action="../notice/notice_update.do">
                	<input type='hidden' name='noti_seq' value='${notice.noti_seq}'>
                    <div class="form-group">
                    	&nbsp;
                        <label>제목</label>
                        <input class="form-control" name="noti_subject" style="width:1100px;" value="${notice.noti_subject}">
                    </div>
                   
                    <div class="form-group">
                    	&nbsp;
                        <label>공지내용</label>
                        <div class="editor-container">
					       <textarea class="form-control" id="summernote" name="noti_content" required ></textarea>
				       </div>                    
				    </div>
                    <div id="div2_3" class="col" > 
                    <button type="submit" class="btn btn-light" id="btn-world">Submit</button>
                    <button type="reset" class="btn btn-light" onclick="history.back(-1);">Cancel</button>
                	</div>
                </form>
            </div>
            
        </div>
        <!-- /.row (nested) -->
    </div>
    <br/>
    
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
    
	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>  -->
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/paging.js"></script>

<%@include file="../footer.jsp"%>