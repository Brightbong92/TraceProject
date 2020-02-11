<%@page contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
	<c:when test="${flag == true}">
		<script>
			alert("${sessionScope.loginUser.mem_nick} 님 좋아요 완료!!");
			location.href="../review/reviewList.do?mtr_seq=${mtr_seq}&cp=${cp}";
		</script>
	</c:when>
	<c:when test="${flag == false}">
		<script>
			alert("이미 좋아요가 반영된 후기입니다.");
			location.href="../review/reviewList.do?mtr_seq=${mtr_seq}&cp=${cp}";
		</script>
	</c:when>
</c:choose>