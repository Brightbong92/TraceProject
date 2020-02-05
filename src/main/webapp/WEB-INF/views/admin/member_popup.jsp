<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
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
<title>회원 상세정보</title>
</head>
<body onresize="parent.resizeTo(800,300)" onload="parent.resizeTo(800,300)">
<center>
<tr/><tr/><tr/>
<table  width="100%" class="table table-striped table-bordered table-hover" id="">
<thead>
<tr>
		<th>이메일</th>
		<th>닉네임</th>
		<th>나이대</th>
		<th>성별</th>
		<th>포인트</th>
		<th>계정권한</th>
		<th>계정상태</th>
		<th>가입일</th>
		</tr>
</thead>
<tbody>
	<c:forEach items="${memberInfoResult.memberInfo}" var="member">
		<tr class="odd gradeX">
		<td>${member.mem_email}</td>
		
		<td>${member.mem_nick}</td>
		
		<td>${member.mem_age}대</td>
		
		<c:if test="${member.mem_gender eq 1}">
		<td>남성</td>
		</c:if>
		<c:if test="${member.mem_gender eq 2}">
		<td>여성</td>
		</c:if>
		
		<td>${member.mem_point}</td>
		
		<c:if test="${member.mem_auth eq 0}">
		<td>일반회원</td>
		</c:if>
		<c:if test="${member.mem_auth eq 1}">
		<td>멘토</td>
		</c:if>
		<c:if test="${member.mem_auth eq 2}">
		<td>관리자</td>
		</c:if>
		
		<c:if test="${member.mem_state eq 0}">
		<td>활성화</td>
		</c:if>
		<c:if test="${member.mem_state eq 1}">
		<td>활성화 (신고계정)</td>
		</c:if>
		<c:if test="${member.mem_state eq 2}">
		<td>비활성화</td>
		</c:if>
		<c:if test="${member.mem_state eq 3}">
		<td>이메일 인증 전</td>
		</c:if>
		
		<td>${member.mem_rdate}</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<c:forEach items="${memberInfoResult.memberInfo}" var="member">
	<c:if test="${member.mem_state ne 2}">  <!-- 비활성화 상태가 아니면 -->
		<c:if test="${member.mem_auth eq 0}"> <!-- 일반 회원이면 -->
			<a href="../admin/disabled.do?mem_email=${member.mem_email}" onClick="opener.location.reload();" class="btn btn-info">비활성화 하기</a>
		</c:if>
		<c:if test="${member.mem_auth eq 1}"> <!-- 멘토 회원이면 -->
			<a href="../admin/disabled.do?mem_email=${member.mem_email}" onClick="window.close(); opener.location.reload();" class="btn btn-info">비활성화 하기</a>
			<a href="../admin/auth_cancel.do?mem_email=${member.mem_email}" onClick="window.close(); opener.location.reload();" class="btn btn-warning">멘토 권한 취소</a>
		</c:if>
	</c:if>
	
	<c:if test="${member.mem_state eq 2}"> <!-- 비활성화 상태면 -->
		<c:if test="${member.mem_auth eq 1}"> <!-- 멘토 회원이면 -->
			<a href="../admin/auth_cancel.do?mem_email=${member.mem_email}" onClick="window.close(); opener.location.reload();" class="btn btn-warning">멘토 권한 취소</a>
		</c:if>
	</c:if>
</c:forEach>
</center>

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
</body>
</html>