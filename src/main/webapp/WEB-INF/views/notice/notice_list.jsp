<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />

<!DOCTYPE html>
<html lang="ko">
<head>
		<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
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

	<div id="div3">
		<table id="div3_1" class="table" style="margin-bottom: 20px">
			<tbody>
				<tr>
					<td style="width:150px"></td>
					<td style="width:700px"><strong>제목</strong></td>
					<td><strong>작성자</strong></td>
					<td><strong>조회수</strong></td>
					<td><strong>작성일</strong></td>
				</tr>
				<c:forEach items="${listResult.list}" var= "notice">
				<tr style="cursor:pointer;" onclick="location.href='content.do?noti_seq=${notice.noti_seq}'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>공지사항</font></button></td>
					<td><font size=3>${notice.noti_subject}</font></td>
					<td><font size=3>관리자</font></td>
					<td><font size=3>${notice.noti_readcnt}</font></td>
					<td><font size=3>${notice.noti_rdate}</font></td>
					
				</tr>
				</c:forEach>
			</tbody>
		</table>
			<div class="board_paging" align="center" style="margin-bottom: 20px">
				
				<button  onclick="javascript:location.href='../notice/list.do?cp=1'">&#x000AB;</button>
				<c:if test="${listResult.page ne 1}">
				<button  onclick="javascript:location.href='../notice/list.do?cp=${listResult.page-1}'">&#x02039;</button>
				</c:if>
				<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
						<c:choose>
							<c:when test="${i==listResult.page}">
								<button onclick="javascript:location.href='../notice/list.do?cp=${i}'" class="on"><strong>${i}</strong></button>
							</c:when>
						<c:otherwise>
							 <button onclick="javascript:location.href='../notice/list.do?cp=${i}'">${i}</button>
						</c:otherwise>
						</c:choose>
				</c:forEach>
				<c:if test="${listResult.page ne listResult.totalPageCount}">
				<button  onclick="javascript:location.href='../notice/list.do?cp=${listResult.page+1}'">&#x0203A;</button>
				</c:if>
				<button  onclick="javascript:location.href='../notice/list.do?cp=${listResult.totalPageCount}'">&#x000BB;</button>
			</div>
			
	</div>
</div>
									
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>
<%@include file="../footer.jsp"%>

