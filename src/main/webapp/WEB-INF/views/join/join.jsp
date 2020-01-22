<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp"/>


</head>
<body>
	<form class="form-horizontal" action='' method="POST" align="center">
  <fieldset align="center">
  	<br/>
    <div id="legend">
      <legend class="">회원가입</legend>
    </div>
    <div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="username">이메일</label>
      <span class="controls" >
        <input type="text" id="username" name="username" placeholder="Email" class="input-xlarge">
        <p class="help-block">[ 이메일은 아이디로 사용됩니다.]</p>
      </span>
    </div>
 	<br/>
    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="nick">닉네임</label>
      <span class="controls">
        <input type="text" id="nick" name="nick" placeholder="" class="input-xlarge">
        <p class="help-block">[ 특수문자를 제외한 2 ~ 8자 ]</p>
      </span>
    </div>
 	<br/>
    <div class="control-group">
      <!-- Password-->
      <label class="control-label" for="password">비밀번호</label>
      <span class="controls">
        <input type="password" id="password" name="password" placeholder="passward" class="input-xlarge">
        <p class="help-block">[ 영문/숫자/특수문자를 포함하는 6 ~ 15자 ]</p>
      </span>
    </div>
 	<br/>
    <div class="control-group">
      <!-- Password -->
      <label class="control-label"  for="password_confirm">비밀번호 재입력</label>
      <span class="controls">
        <input type="password" id="password_confirm" name="password_confirm" placeholder="passward" class="input-xlarge">
        <p class="help-block"></p>
      </span>
    </div>
 	<br/>
 	
 	<div class="control-group">
      <!-- Gender -->
      <label class="control-label"  for="gernder">성별 </label>
      <span class="controls">
        <input type="password" id="gernder" name="gernder" placeholder="성별" class="input-xlarge" />
        <p class="help-block"></p>
      </span>
    </div>
 	<br/>
 	
 	<div class="input-group">
 	 <!-- profile image -->
 	 	<label class="control-label"  for="file_input">프로필 사진</label>
 	 	<span class="custom-file">
 	 		<input type="file" class="custom-file-input" id="inputGroupFile02">
			<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02" width:100px;>프로필 사진</label>
 	 	</span>
 	 </div>
 	 <br/><br/>
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button class="btn btn-success">Register</button>
      </div>
    </div>
  </fieldset>
</form>
<br/><br/><br/><br/>
<%@include file="../footer.jsp"%>