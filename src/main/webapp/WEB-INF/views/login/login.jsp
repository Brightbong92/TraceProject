<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp"/>
 
  <!-- Page Content -->
 <script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			var userEmail = $("#userEmail").val();
			var userPwd = $("#userPwd").val();
			if(userEmail == ""){
				alert("이메일을 입력하세요.");
				$('#userEmail').focus();
				return;
			}
			if(userPwd ==""){
				alert("비밀번호를 입력하세요.");
				$("#userPwd").focus();
				return;
			}
			document.form1.action="${path}/login/loginCheck.do"
			document.form1.submit();
		});
	});
</script>
<div class="container">
<br/><br/><br/><br/>
<h1 class="form-heading">로그인페이지</h1>
<div class="login-form">
<div class="main-div">
    <div class="panel">
   <p>이메일과 비밀번호를 입력해주세요.</p>
   </div>
   <br/>
    <form name="form1" method="post">
        <div class="form-group">
            <input type="email" name="userEmail" id="userEmail" placeholder="Email Address">
        </div>
        <div class="form-group">
            <input type="password" name="userPwd" id="userPwd" placeholder="Password">
        </div>
         <br/>
        <button type="button" id="btnLogin">로그인</button>
        	<c:if test="${msg == 'failure'}">
        		<div>
        			이메일 또는 비밀번호가 일치하지 않습니다.
        		</div>
        	</c:if>
        	<c:if test="${msg == 'logout'}">
        		<div>
        			로그아웃 되었습니다
        		</div>
        	</c:if>
        <span>
        	&emsp;&emsp;&emsp;&emsp;&emsp;<strong>아이디가 아직 없으신가요?</strong> <a href="../join/join.do" class="btn btn-info">회원가입</a>
    	</span>
    </form>
     <br/>
    </div>
</div></div></div>
<br/>
  <!-- /.container -->

<%@include file="../footer.jsp"%>
