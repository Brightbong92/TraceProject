<%@page contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	   alert("${sessionScope.loginUser.mem_nick} 님 멘토링글 작성완료!!");
	   location.href="../mentoring/mentoring_list.do?sort=99";
</script>
