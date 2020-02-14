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
			<div id="div1_1" class="form-group">
				<button type="button" onclick="location.href='../notice/list.do?cp=1'"  class="btn btn-link" >공지사항</button>
				<button type="button" onclick="location.href='../notice/qna.do'"  class="btn btn-link" style="color:gray;">자주 묻는 질문</button>
			</div>

			<div id="div1_2" class="form-group" >
				<input type="text" id="search" class="form-control" onkeydown="search(this)" placeholder="Search" style="width:160pt;" />
			</div>
		</div>
	</div>
                   
		<div class="board_view_top" >
			<p class="tit" style="font-size: 20px;">${noticeContentList.content_list.noti_subject}</p>
			<ul class="info" style="font-size: 15px;">
	    	<li >작성자 : 관리자</li>
	        <li>작성일 : ${noticeContentList.content_list.noti_rdate}</li>
	    	</ul>
	    	
	    	<p class="cl" align="right">조회수 : ${noticeContentList.content_list.noti_readcnt}</p>
		</div>	
		<div class="board_view_middle" style="font-size: 15px;">
			${noticeContentList.content_list.noti_content}
		</div>
			<br/>
		<div class="board_view_bottom" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="board_st view" > 
	      <col class="w_form_tit"/>
	      <col class="w_auto" />
	      
	      <tr>
	        <th><i class="xi xi-angle-right-min"></i> 다음글</th>
	        <td style="font-size: 13px;"><a href="content.do?noti_seq=${noticeContentList.next_content.noti_seq}">${noticeContentList.next_content.noti_subject}</a></td>
	      </tr>
	      <tr>
	        <th><i class="xi xi-angle-left-min"></i> 이전글</th>
	        <td style="font-size: 13px;"><a href="content.do?noti_seq=${noticeContentList.pre_content.noti_seq}">${noticeContentList.pre_content.noti_subject}</a></td>
	      </tr>
	    </table>
	</div> 
	<br/>
		<div id="div2_3" class="col" align="center"> 
			<c:if test="${loginUser.mem_email eq 'admin'}">		
				<button type="button"  class="btn btn-light"><a href="update_form.do?noti_seq=${noticeContentList.content_list.noti_seq}">수정</a></button>
				<button type="button"  class="btn btn-light"><a href="delete.do?noti_seq=${noticeContentList.content_list.noti_seq}">삭제</a></button>
			</c:if>
			<button type="button"  class="btn btn-light"><a href="list.do" >목록</a></button>
		</div>
		<br/>
		
</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/paging.js"></script>
	    
</body>
</html>
 <%@include file="../footer.jsp"%> 
