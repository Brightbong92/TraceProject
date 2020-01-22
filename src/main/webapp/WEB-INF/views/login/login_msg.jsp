<%@page contentType="text/html;charset=utf-8" import="tp.login.service.LoginSet"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
if(${requestScope.rCode} == <%=LoginSet.NO_ID%>){
	   alert("없는 아이디 입니다 ");
}else if(${rCode} == <%=LoginSet.NO_PWD%> ){
	   alert("잘못된 비밀번호 입니다 ");
}else{
	   alert("환영합니다 ${sessionScope.loginUser.mem_nickname} 님");
}
	location.href="../index/index.do";
</script>
