<%@page contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	   alert("${sessionScope.loginUser.mem_nick} 님 질문글 작성완료!!");
	   location.href="../qa/qaList.do?mtr_seq=${mtr_seq}&cp=1";
</script>
