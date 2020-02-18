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

    <title>발자취 - 로그인 페이지</title>

    <!-- Bootstrap Core CSS -->
    <link href="../resources/loginPage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/loginPage/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/loginPage/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/loginPage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 카카오로그인 사용 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- 네이버로그인 사용 -->
 	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" name="loginForm" action="../login/loginCheck.do" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" type="email" name="mem_email" id="mem_email" placeholder="E-mail" autofocus>
                                </div>
                                <div class="form-group">
                                <input class="form-control" type="password" name="mem_pwd" id="mem_pwd" placeholder="Password" onkeydown="enter(this)">  
                                </div>
                               	
                                <!-- Change this to a button or input when using this as a form -->
                                <a class="btn btn-info" style="width:100%; " id="btnLogin">Login</a><!-- 일반 -->
                                <br/><br/><br/>
                                	<p class="panel-title" style="color:gray;" >간편 로그인</p> 
                                	<br/>
                                <a id="custom-login-btn" href="javascript:loginWithKakao()"><!-- 카카오 -->
                                <img src="../resources/images/kakao.png" width="100%" height="70"/>
								</a>
								<br/>
								
								<div id="naverIdLogin" align="center"></div>
                            </fieldset>
                            <br/>
                            <!--  
                            <div align='center'>
                            <a class="btn btn-info" href="../">돌아가기</a>
                            </div>
                            -->
                            <br/><br/>
                            <p align="center">회원이 아니시라면 </p>
                            <p style="text-align: center;">
                            <a  href="../join/join.do">회원가입</a>
                            </p>
                        </form>
						
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- 카카오로그인 form -->
    <form id='f' name='f' action='../login/kakaoLoginCheck.do' method='post'>
   		<input name='kakao' type='hidden' id='kakao' value='empty'>
   	</form>
    <!-- jQuery -->
    <script src="../resources/loginPage/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/loginPage/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/loginPage/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/loginPage/dist/js/sb-admin-2.js"></script>

<!-- 네이버 로그인 -->
<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "I04m6PHk8EtEQNKVz2xz",
			//callbackUrl: "http://127.0.0.1:8080/login/naverLoginCallback.do",
			callbackUrl: "http://192.168.0.129:8080/login/naverLoginCallback.do",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 65} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->


<!-- 카카오 로그인 -->
<script type='text/javascript'>
	  //<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('cfc6adb56776563ea749406a6c619d30');
	    function loginWithKakao() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.login({
	        success: function(authObj) {
	          //alert(JSON.stringify(authObj));
	          d = JSON.stringify(authObj);
	          //alert(authObj.access_token);
	          accessToken = authObj.access_token;
	           Kakao.API.request({
                url: '/v2/user/me',
                success: function(res) {
                      //alert(res.properties['nickname'] + '님 로그인!!');
                      document.getElementById("kakao").setAttribute("value", JSON.stringify(res));
                      f.submit();
                    }
                  })
	        },
	        fail: function(err) {
	        	console.log(JSON.stringify(err));
	          //alert(JSON.stringify(err));
	        }
	      });
	    };
	  //]]>
</script>


<!-- 일반 로그인 -->
 <script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			var mem_email = $("#mem_email").val();
			var mem_pwd = $("#mem_pwd").val();
			if(mem_email == ""){
				alert("이메일을 입력하세요.");
				$('#mem_email').focus();
				return;
			}
			if(mem_pwd ==""){
				alert("비밀번호를 입력하세요.");
				$("#mem_pwd").focus();
				return;
			}
			document.loginForm.submit();
		});
	});
	
	function enter(e){
		if(event.keyCode == 13){
			var mem_email = $("#mem_email").val();
			var mem_pwd = $("#mem_pwd").val();
			if(mem_email == ""){
				alert("이메일을 입력하세요.");
				$('#mem_email').focus();
				return;
			}
			if(mem_pwd ==""){
				alert("비밀번호를 입력하세요.");
				$("#mem_pwd").focus();
				return;
			}
			document.loginForm.submit();
		}
	}
</script>

</body>

</html>
