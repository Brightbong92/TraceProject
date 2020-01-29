<%@page contentType="text/html;charset=utf-8" import="tp.login.service.LoginSet"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	   alert("${sessionScope.loginUser.mem_nick} 님 글 작성완료!!");
	   location.href="../";
</script>
