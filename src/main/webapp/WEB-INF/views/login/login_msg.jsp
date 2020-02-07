<%@page contentType="text/html;charset=utf-8" import="tp.login.service.LoginSet"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
if(${requestScope.result} == <%=LoginSet.NO_ID%>){
	   alert("없는 아이디 입니다 ");
	   location.href="./login.do";
}else if(${result} == <%=LoginSet.NO_PWD%> ){
	   alert("잘못된 비밀번호 입니다 ");
	   location.href="./login.do";
}else if(${loginUser.mem_state} == 2 ){
	   location.href="./disabled_mem.do";
}else{
	   alert("환영합니다 ${sessionScope.loginUser.mem_nick} 님");
	   location.href="../";
}
	
</script>
