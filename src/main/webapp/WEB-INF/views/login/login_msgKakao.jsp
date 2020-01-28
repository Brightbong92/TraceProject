<%@page contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	   alert("카카오로그인 했습니다. 환영합니다 ${sessionScope.loginUser.mem_nick} 님");
	   location.href="../";
</script>
