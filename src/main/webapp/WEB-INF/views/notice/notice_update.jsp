<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />

	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	<link href="../css/board.css" rel="stylesheet" type="text/css" />
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
            left:750px
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
				<button type="button" onclick="location.href='../notice/qna.do'"  class="btn btn-link">자주 묻는 질문</button>
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
                        <textarea class="form-control" rows="3" name="noti_content" style="width:1100px; height:300px;">${notice.noti_content}</textarea>
                    </div>
                    <div id="div2_3" class="col" > 
                    <button type="submit" class="btn btn-light">수정</button>
                    <button type="reset" class="btn btn-light">취소</button>
                	</div>
                </form>
            </div>
            
        </div>
        <!-- /.row (nested) -->
    </div>
    <br/>
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/paging.js"></script>

<%@include file="../footer.jsp"%>