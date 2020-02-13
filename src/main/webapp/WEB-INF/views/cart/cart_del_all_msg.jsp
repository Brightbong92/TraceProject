<%@page contentType="text/html;charset=utf-8" import="tp.login.service.LoginSet"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	alert("장바구니가 비어졌습니다.");
	location.href="/cart/cart.do?mem_email=${loginUser.mem_email}";
</script>
