<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>

<body>

	<!--  callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다.-->
	<!-- JQuery사용용도 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

	<!-- 네이버로그인 form -->
    <form id='f' name='f' action='/login/naverLoginCheck.do' method='post'>
   		<input type='hidden' name='mem_email' id='mem_email' value='empty'>
   		<input type='hidden' name='mem_nick' id='mem_nick' value='empty'>
   		<input type='hidden' name='mem_profile' id='mem_profile' value='empty'>
   		<input type='hidden' name='mem_age' id='mem_age' value='empty'>
   		<input type='hidden' name='mem_gender' id='mem_gender' value='empty'>
   	</form>
	
	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "I04m6PHk8EtEQNKVz2xz",
				callbackUrl: "http://192.168.0.129:8080/login/naverLoginCallback.do",
				//callbackUrl: "http://127.0.0.1:8080/login/naverLoginCallback.do",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail();
				var name = naverLogin.user.getNickName();
				var profileImage = naverLogin.user.getProfileImage();
				//var birthday = naverLogin.user.getBirthday();			var uniqId = naverLogin.user.getId();
				var age = naverLogin.user.getAge();
				var gender = naverLogin.user.getGender();
				//alert(email);alert(name);alert(profileImage); alert("생일"+birthday);alert(uniqId);alert(age);
				//alert("성별"+gender);
				//info = new Array();
				//info.push(email);info.push(name);info.push(profileImage);info.push(age);info.push(gender);
				$("#mem_email").val(email);$("#mem_nick").val(name);$("#mem_profile").val(profileImage);$("#mem_age").val(age);
				if(gender == "M") {
					$("#mem_gender").val(1);
				}else if(gender == "F"){
					$("#mem_gender").val(2);
				}
			} else {
				console.log("AccessToken이 올바르지 않습니다.");
			}
		});

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					f.submit();//post방식
					//window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/login/naverLoginCheck.do?info="+info);
					//get방식
					
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>
</html>