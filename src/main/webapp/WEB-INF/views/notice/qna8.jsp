<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />

<!DOCTYPE html>
<html lang="ko">
<head>
		<meta charset="UTF-8">
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
	<title>자주묻는 질문</title>
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
			<div id="div1_1" class="form-group">
				<button type="button" onclick="location.href='../notice/list.do?cp=1'"  class="btn btn-link" style="color:gray;">공지사항</button>
				<button type="button" onclick="location.href='../notice/qna.do'"  class="btn btn-link">자주 묻는 질문</button>
			</div>
			<div id="div1_2" class="form-group">
				<input type="text" id="search" class="form-control" onkeydown="search(this)" placeholder="Search" style="width:160pt;" />
			</div>
		</div>
	</div>
	<div class="board_view_top">
				<p class="tit" style="font-size: 20px;">회원 정보는 어떻게 변경하나요?</p>
				<ul class="info" style="font-size: 15px;">
				<li>작성자 : 관리자</li>
				<li>작성일 : 2019-12-07</li>
				</ul>
				<p class="cl" align="right">조회수 :8</p>
	</div>
	<div class="board_view_middle" style="font-size: 15px;">
		<p style="font-size:15px;">[내 활동] 상단에 있는 설정 아이콘을 클릭하시면 프로필을 수정하실 수 있습니다.</p>
	</div>
</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/paging.js"></script>

</body>
</html>
<%@include file="../footer.jsp"%>