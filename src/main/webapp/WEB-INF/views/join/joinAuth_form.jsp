<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="kor">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--  <meta name="viewport" content="width=device-width, initial-scale=1">
    -->
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>발자취 - 이메일 인증페이지</title>

    <!-- Bootstrap Core CSS -->
    <link href="../resources/loginPage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/loginPage/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/loginPage/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/loginPage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">이메일인증</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" name="joinAuthForm">
                        <input type="hidden" name="mem_email" value="${email_auth.mem_email}">
                            <fieldset>
                            	<div>${email_auth.mem_email}으로 전송된 인증번호를 입력해주세요.</div>
                            	<br/>
                            	<div>이메일 인증 후 서비스 이용가능합니다.</div>
                                <div class="form-group">
                                    <input class="form-control" type="text" name="input_uuid" id="input_uuid" placeholder="인증번호" autofocus>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="button" class="btn btn-lg btn-success btn-block" id="auth_btn" value="인증하기"/>
                                <!--  
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="인증하기"/>
                                -->
                            </fieldset>
                            <br/>
                            <div align="center"><input type="button" class="btn btn-primary" id="reAuth_btn" value="인증번호 재발급"/></div>
                        </form>
						
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery -->
    <script src="../resources/loginPage/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/loginPage/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/loginPage/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/loginPage/dist/js/sb-admin-2.js"></script>
<script>
	$(document).ready(function(){
		$("#auth_btn").click(function(){
			if($("#input_uuid").val().length == 0) {
				alert("인증번호를 입력해주세요.");
			}else {
				$.ajax({
					url:"../join/checkUuid.do?mem_email=${email_auth.mem_email}&email_uuid="+$("#input_uuid").val(),
					success: function(data) {
						if(data == "pass") {
							alert("인증되었습니다. 가입을 축하드립니다.")
							location.href="../login/loginAfterAuth.do?mem_email=${email_auth.mem_email}";
						}
						if(data == "unPass") {
							alert("인증번호가 일치하지 않습니다.");
						}
					}
				});
			}
		});
		$("#reAuth_btn").click(function(){
			$.ajax({
				url:"../join/reAuthIssuance.do?mem_email=${email_auth.mem_email}",
				success: function(data) {
					if(data == "issued") {
						alert("인증번호를 재발송했습니다.");
					}
				}
			});
			
		});
	});
	

</script>

</body>

</html>
