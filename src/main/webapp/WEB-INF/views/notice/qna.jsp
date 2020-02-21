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
	<h1 class="mt-4 mb-3">자주 묻는 질문  </h1>
	<div id="div1" class="row">
		<div class="form-inline">
			<div id="div1_1">
				<button type="button" onclick="location.href='../notice/list.do?cp=1'"  class="btn btn-link" style="color:gray;">공지사항</button>
				<button type="button" onclick="location.href='../notice/qna.do'"  class="btn btn-link">자주 묻는 질문</button>
			</div>

		</div>
	</div>
	
	<div id="div3">
		<table id="div3_1" class="table" style="margin-bottom: 20px">
			<tbody>
				<tr>
					<td style="width:150px"></td>
					<td style="width:700px"><strong>제목</strong></td>
					<td>작성일</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna2.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>결제수단 종류는 어떤 것들이 있나요?</strong></td>
					<td>2020-01-17</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna3.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>신용/체크카드로 결제하고 싶은데 공인인증서가 없으면 어떻게 하나요?</strong></td>
					<td>2020-01-05</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna4.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>쿠폰을 등록했습니다. 어떻게 사용하나요? </strong></td>
					<td>2020-01-02</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna5.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>마일리지가 생겼습니다. 어떻게 사용하나요?</strong></td>
					<td>2019-12-31</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna6.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>호스트는 어떻게 신청하나요?</strong></td>
					<td>2019-12-24</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna7.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>날씨 때문에 취소되면 어떻게 하나요?</strong></td>
					<td>2019-12-19</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna8.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>회원 정보는 어떻게 변경하나요?</strong></td>
					<td>2019-12-07</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna9.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>후기는 어떻게 남기나요?</strong></td>
					<td>2019-11-19</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna10.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>호스트에게 직접 질문도 할 수 있나요?</strong></td>
					<td>2019-11-15</td>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='../notice/qna11.do'">
					<td><button class="btn btn-primary" style="width:80px;"><font size=2>질문</font></button></td>
					<td style="width:700px"><strong>발자취 신청 방법</strong></td>
					<td>2019-11-12</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>


<%@include file="../footer.jsp"%>