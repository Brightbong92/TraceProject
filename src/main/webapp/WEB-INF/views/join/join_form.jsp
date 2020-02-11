<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp"/>

</head>

<body>
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">회원가입
      <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/">Home</a>
      </li>
      <li class="breadcrumb-item active">Contact</li>
    </ol>

    <!-- 회원가입 Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>회원가입</h3>
        <form name="join_form" id="join_form" method="POST" action="../join/memberJoin.do"novalidate>
        
          <div class="control-group form-group">
            <div class="controls">
              <label>이메일:</label>
              <input type="text" class="form-control" name = "mem_email" id="mem_email" autofocus placeholder="E-mail">
              <p class="help-block"></p>
              <input type="hidden" id="email_duplicate" value="unChecked">
               <div id="msgEmail"></div>
              <!--  <input type="button" name="email_auth_btn" value="이메일인증" onclick="emailAuth(this)"/>-->
            </div>
          </div>
          
         <div class="control-group form-group">
            <div class="controls">
              <label>닉네임:</label>
              <input type="text" class="form-control" name = "mem_nick" id="mem_nick" placeholder="Nickname">
              <p class="help-block"></p>
              <input type="hidden" id="nick_duplicate" value="unChecked">
              <div id="msgNick"></div>
            </div>
          </div>
          
          
          <div class="control-group form-group">
            <div class="controls">
              <label>비밀번호:</label>
              <input type="password" class="form-control" name="mem_pwd" id="mem_pwd" placeholder="Password">
              <div id="msgPwd"></div>
            </div>
          </div>
          
          <div class="control-group form-group">
            <div class="controls">
              <label>비밀번호체크:</label>
              <input type="password" class="form-control" name="mem_pwdCheck" id="mem_pwdCheck" placeholder="Password Check">
              <input type="hidden" id="mem_pwd_check_equal" value="unChecked">
              <div id="msgPwdCheck"></div>
            </div>
          </div>
                    
          <div class="control-group form-group">
            <div class="controls">
            <label>연령대:</label>
          	<select id="selectBox" onchange="categoryChange(this)">
			  <option id = "0" value="0">연령대를 선택해주세요</option>
			  <option id = "15" value="15~19">15-19</option>
			  <option id = "20" value="20~29">20-29</option>
			  <option id = "30" value="30~39">30-39</option>
			  <option id = "40" value="40~49">40-49</option>
			  <option id = "50" value="50~59">50-59</option>
			  <option id = "60" value="60~69">60-69</option>
			  <option id = "70" value="70~79">70-79</option>
			  <option id = "80" value="80~89">80-89</option>
			  <option id = "90" value="90~99">90-99</option>
			</select>
          	</div>
          	<div>*발자취는 만 14세 이상 회원만 이용 가능합니다.</div>
          	<input type="hidden" id="mem_age" name="mem_age" value="">
          </div>
          
           <div class="control-group form-group">
            <div class="controls">
           <label>성별:</label>
          	<input type="radio" name="mem_gender" value="1" /> 남자
  			<input type="radio" name="mem_gender" value="2" /> 여자
			</div>
			</div>

          <!--  <div id="success"></div>-->
          <!-- For success/fail messages -->
          <input type="button" class="btn btn-primary" id="send_btn_join" value="가입" onclick="send()"/>
          <input type="button" class="btn btn-primary" id="cancel_btn_join" value="취소" onclick="cancel()"/>
        </form>
      </div>

    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
  <script>
	  function categoryChange(el){
			opt = $("#selectBox option:selected").val();
			$("#mem_age").val(opt);
	  }
  	
 $(document).ready(function(){
	 var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	 var getPwdCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);

	 
  	  $("#mem_email").keyup(function(){
  		if(!getMail.test($("#mem_email").val())){
  	        $("#msgEmail").css("color","red");
  	        $("#msgEmail").text("이메일 형식에 맞게 입력해주세요");
  	        $("#mem_email").focus();
  			var n = $("#mem_email").val().length;
  			if(n == 0) {
  				$("#msgEmail").text("");
  			}
  	        return false;
  	      }

  		$.ajax({
  			url:"../join/checkEmail.do?mem_email="+$('#mem_email').val(),
  			success: function(data) {
  				if(data == "possible"){
  					$("#msgEmail").css("color","#12e8e3");
  					$("#msgEmail").text("사용가능한 이메일");
  					$("#email_duplicate").val("checked");
  					//alert($("#email_duplicate").val());
  					//document.join_form.email_duplicate.value="checked";
  				}
  				if(data == "impossible"){
  					$("#msgEmail").css("color","red");
  					$("#msgEmail").text("중복된 이메일");
  					$("#email_duplicate").val("unChecked");
  					//alert($("#email_duplicate").val());
  					//document.join_form.email_duplicate.value="unChecked";
  				}
  			}
  		}); 
	  });
	  
	  $("#mem_nick").keyup(function(){
		  var n = $("#mem_nick").val().length;
		  if(n == 0) {
			  $("#msgNick").text("");
		  }else if(n >= 11) {
			  $("#msgNick").css("color","red");
			  $("#msgNick").text("닉네임은 1~10글자 까지가능(한글,영어,특수문자가능)");
			  $("#nick_duplicate").val("unChecked");
		  }else {
			  $.ajax({
		  			url:"../join/checkNick.do?mem_nick="+$('#mem_nick').val(),
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
 
 function check(re, what, message) {
     if(re.test(what.value)) {
         return true;
     }
     alert(message);
     what.value = "";
     what.focus();
     //return false;
 }
 function cancel() {
	 $("#mem_email").val("");
	 $("#msgEmail").text("");
	 $("#msgNick").text("");
	 $("#msgPwd").text("");
	 $("#msgPwdCheck").text("");
	 $("#mem_nick").val("");
	 $("#mem_pwd").val("");
	 $("#mem_pwdCheck").val("");
	 $("#0").val("0").prop("selected", true);
	 $("input[type=radio]").prop("checked", false);
 }
 
 function send() {
	 if($("#mem_email").val() == "") {
		 alert("이메일을 입력하지 않았습니다.")
         document.join_form.mem_email.focus();
         return false;
	 }else if($("#mem_nick").val() == "") {
		 alert("닉네임을 입력하지 않았습니다.")
		 document.join_form.mem_nick.focus();
	 }else if($("#mem_pwd").val() == "") {
         alert("비밀번호를 입력하지 않았습니다.")
         document.join_form.mem_pwd.focus();
         return false;
     }else if($("#mem_pwdCheck").val() == "") {
         alert("비밀번호확인을 입력하지 않았습니다.")
         document.join_form.mem_pwdCheck.focus();
         return false;
     }else if($("#email_duplicate").val() != "checked") {
	   	  alert("아이디 중복체크를 해주세요.");
	   	  document.join_form.mem_email.focus();
	      return false;
     }else if($("#nick_duplicate").val() != "checked") {
	   	  alert("닉네임 중복체크를 해주세요.");
		  document.join_form.mem_nick.focus();
	      return false; 
     }else if($('select option:selected').val() == 0) {
    	  alert("연령대를 선택해주세요.");
    	  return false;
     }else if($("input:radio[name='mem_gender']").is(":checked") == false) {
    	  alert("성별을 선택해주세요.");
    	  return false;
     }
		 join_form.submit();
		 alert("이메일 인증 후 서비스 이용가능합니다.");
 }

 
 
</script>

<%@include file="../footer.jsp"%>
