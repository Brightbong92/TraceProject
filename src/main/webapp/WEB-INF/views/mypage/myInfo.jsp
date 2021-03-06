<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />
<script>
	if(${empty sessionScope.loginUser}){
		alert("로그인 후 서비스 이용 가능합니다");
		location.href="../login/login.do";
	}
</script>
<head>
    <style>
        .btn-profile{
            position: relative;
            overflow: hidden;
        }
        .btn-profile input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }
    </style>
	
</head>
<body>
	<script>

function setImg() {
    form.submit();
    alert("프로필이 변경되었습니다.");
}
</script>
  <!-- Page Content -->
  <div class="container">
	
	<br/><br/>
    <div class="my-summary-wrap">
		<div class="profile-wrap">
			<div class="profile-thumb-wrap" align="center">
			<img src="../resources/profileImage/${loginUser.mem_profile}" onError="this.src='../resources/profileImage/기본프로필사진.jpg'" class="thumb-profile" alt="프로필사진" style="width:120px; height:120px; border-radius: 100px;" />
			</div>
			<div class="profile-info-wrap" align="center" style="margin-top:15px;">
				안녕하세요.
			<span class="profile-name cut-txt" align="center">${loginUser.mem_nick} 님</span>
			<br/>
			<label class="btn btn-primary btn-file" style="margin-top:20px;">프로필 사진 편집
			<form id="form" name="changeProfile" action="../mypage/changeProfile.do?fname=${loginUser.mem_profile}" method="post" enctype="multipart/form-data">
       		 <input type='hidden' id="email" name='mem_email' value="${loginUser.mem_email}" />
       		 <input type="file" style="display: none;" name="mem_profile" onchange="setImg()" >
       		 </form>
    		</label>
			</div>
		</div>
	</div>
	
<style>
.bora, .bora0 {flex: 0 0 100% !important; max-width:100% !important; overflow:hidden;}
.bora .bora1 {display:block !important;}
.bora .aaa {width:20%; float:left; text-align:center; background: #000; color: #fff; padding: 20px 0;}
.bora .bbb {width:20%; height:10px; float:left; text-align:center; background: #fff; color: #fff; padding: 20px 0;}


</style>	
	<br/>
    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4 bora">
        <div class="list-group bora1" style="font-size:16px;" >
          <a href="../mypage/myInfo.do" class="aaa" style="color:white;">내 정보 관리</a>
          <a href="../mypage/myActivity.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:gray;">나의 활동 내역</a>
          <a href="../mypage/myPoint.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:gray;">포인트</a>
          <a href="../mypage/myPaymentInfo.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:gray;">구매 &환불 내역 </a>
          <a href="../cart/cart.do?mem_email=${loginUser.mem_email}" class="aaa"  style="background:#f74f76; color:white;">장바구니</a>
        </div>
      </div>
      <br/>
      <div class="col-lg-3 mb-4 bora" style="margin-top:-15px;">
      	<div class="list-group bora1" style="font-size:13px;" >
          	<a href="../mypage/myInfo.do" class=bbb style="color:red;">회원정보 수정</a>
          	<a href="../mypage/disabled.do" class="bbb" style="color:gray;">탈퇴하기 </a>
      	</div>
      </div>
     
      <!-- Content Column -->
      <form id="f" name="applyForm" action="../mentor/apply.do" method="post" enctype="multipart/form-data" class="col-lg-9 mb-4 bora0">
      <!--  <div class="col-lg-9 mb-4 bora0">-->
      	<table class="table table-boardered">
        <tr> 
        	<th style="width:200px;color:gray;" >이메일 </th>
        	<td>${loginUser.mem_email}<td>
        </tr>
        <tr> 
        	<th style="width:200px;color:gray;">닉네임 </th>
        	<td><input id="mem_nick" value="${loginUser.mem_nick}" /><td>
        	<td><span id="msgNick"></span></td>
        	<td><input type="hidden" id="nick_duplicate" value="unChecked"></td>
        </tr>
        <tr> 
        	<th style="width:200px;color:gray;">비밀번호 </th>
        	<td><input type="password" id="mem_pwd"/><td>
        	<td><span id="msgPwd"></span></td>
        </tr>
        <tr> 
        	<th style="width:200px;color:gray;">비밀번호확인 </th>
        	<td><input type="password" id="mem_pwdCheck"/><td>     
            <td><span id="msgPwdCheck"></span></td>
            <td><input type="hidden" id="mem_pwd_check_equal" value="unChecked"></td>
        </tr>
       
        
      </table>
       <button type="button" onclick="send()"class="submit" style="color: white; background:gray; font-size:1em; border-radius:0.5em; padding:5px 20px;" align="center">수정하기</button>
      </form>
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
  
  <script>
  $(document).ready(function(){
	  
	  $("#mem_nick").on('keyup', function(){
		  var n = $("#mem_nick").val().length;
		  if(n == 0) {
			  $("#msgNick").text("");
		  }else if(n >= 11) {
			  $("#msgNick").css("color","red");
			  $("#msgNick").text("닉네임은 1~10글자 까지가능(한글,영어,특수문자가능)");
			  $("#nick_duplicate").val("unChecked");
		  }else { 
			  $.ajax({
				  url: "../mypage/nickCheck.do?mem_nick="+$('#mem_nick').val(),
		  			success: function(data) {
		  				if(data == "possible"){
		  					$("#msgNick").css("color","#12e8e3");
		  					$("#msgNick").text("사용가능한 닉네임");
		  					$("#nick_duplicate").val("checked");
		  				}
		  				if(data == "impossible"){
		  					$("#msgNick").css("color","red");
		  					$("#msgNick").text("중복된 닉네임");
		  					$("#nick_duplicate").val("unChecked");
		  				}
		  			  }
			 	 });
		   	   }
 			});
	
	  $("#mem_pwd").keyup(function(){
		  var n = $("#mem_pwd").val().length;
		  if(n == 0) {
			  $("#msgPwd").text("");
		  }else if(n >= 16) {
			  $("#msgPwd").css("color","red");
			  $("#msgPwd").text("비밀번호는 1~15글자 까지가능");
		  }else {
			  $("#msgPwd").text("");
		  }
		  var pwd = $("#mem_pwd").val();
		  var pwdC = $("#mem_pwdCheck").val();
		  var n2 = $("#mem_pwdCheck").val().length;
		  if(n2 != 0) {
			  if(pwd == pwdC) {
				  $("#msgPwdCheck").css("color","#12e8e3");
				  $("#msgPwdCheck").text("비밀번호가 일치합니다.") 
			  }else if(pwd != pwdC) {
				  $("#msgPwdCheck").css("color","red");
				  $("#msgPwdCheck").text("비밀번호가 일치하지 않습니다.")
			  }
		  }
		  
	  });
	  
	  $("#mem_pwdCheck").keyup(function(){
		  var pwd = $("#mem_pwd").val();
		  var pwdC = $("#mem_pwdCheck").val();
		  var n = $("#mem_pwdCheck").val().length;
		  if(n == 0) {
			  $("#msgPwdCheck").text("");
		  }else if(pwd == pwdC) {
			  $("#msgPwdCheck").css("color","#12e8e3");
			  $("#msgPwdCheck").text("비밀번호가 일치합니다.")
		  }else if(pwd != pwdC) {
			  $("#msgPwdCheck").css("color","red");
			  $("#msgPwdCheck").text("비밀번호가 일치하지 않습니다.")
		  }
	  });
 });
  </script>
 <script>
 function send() {
	 if($("#mem_nick").val() == "") {
		 alert("닉네임을 입력하지 않았습니다.")
		 $("#mem_nick").focus();
	 }else if($("#mem_pwd").val() == "") {
         alert("비밀번호를 입력하지 않았습니다.")
         $("#mem_pwd").focus();
         return false;
     }else if($("#mem_pwdCheck").val() == "") {
         alert("비밀번호확인을 입력하지 않았습니다.")
         $("#mem_pwdCheck").focus();
         return false;
     }else if($("#mem_pwdCheck").val() != $("#mem_pwd").val()){
    	 alert("비밀번호가 같지 않습니다.");
    	 $("#mem_pwdCheck").focus();
    	 return false;
     }else if($("#nick_duplicate").val() != "checked") {
	   	  alert("닉네임 중복체크를 해주세요.");
		  $("#mem_nick").focus();
	      return false; 
     }else {
    	 var data  = {mem_nick : $("#mem_nick").val(), 
                	  mem_pwd  : $("#mem_pwd").val()
                	 };
    	 
    	 $.ajax({
    		 url: "../mypage/myInfoEdit.do",
    		 type: "POST",
    		 data: JSON.stringify(data),
    		 contentType: "application/json",
    		 success: function(data){
    			 if(data == "modifyOk"){
    				alert("정보가 수정되었습니다.");
    			 }
    		 },error: function(err) {
    			 alert("정보수정 실패");
    		 }
    		 
    		 
    	 });
     }
	 
     }
 
 </script>


<%@include file="../footer.jsp"%>
