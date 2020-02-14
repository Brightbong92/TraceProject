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
<script>
	$(document).ready(function(){
		$("#disabled_btn").click(function(){
			if ($("input:radio[name='dis_reason']").is(":checked") == false) {
		    	alert("탈퇴 사유를 선택해주세요.");
		    	return false;
		    }
			else if ($('#dis_improve').val() == "") {
		    	alert("개선할 점을 입력해주세요.");
		    	document.disalbed_form.dis_improve.focus();
		    	return false;
		    }
			else if ($('#mem_pwd').val() == "") {
		    	alert("비밀번호를 입력해주세요.");
		    	document.disalbed_form.mem_pwd.focus();
		    	return false;
		    }
			
			$.ajax({
				url:"../mypage/check_pwd.do?mem_email="+$("#email").val()+"&mem_pwd="+$("#mem_pwd").val(),
				type:"post",
				success: function(data) {
					if(data == "correct"){
						f.submit();
						alert("탈퇴가 완료되었습니다.");
					}
					else if(data == "incorrect"){
						alert("비밀번호가 일치하지 않습니다.");
						document.disalbed_form.mem_pwd.focus();
						return false;
					}
				}
			});
		});
	});
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
			<form id="form" name="changeProfile" action="../mypage/changeProfile.do" method="post" enctype="multipart/form-data">
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
      	
          	<a href="../mypage/myInfo.do" class=bbb style="color:gray;">회원정보 수정</a>
          	<a href="../mypage/disabled.do" class="bbb" style="color:red;">탈퇴하기 </a>
      	</div>
      </div>
      
     
      <!-- Content Column -->
      <div class="col-lg-9 mb-4 bora0">
      <br/>
        <p><strong>그 동안 발자취를 이용해주셔서 감사합니다</strong></p>
        
        <li style="color:gray;"> 회원 탈퇴 시 보유하고 있던 포인트는 모두 삭제됩니다. </li>
        <li style="color:gray;"> 탈퇴 후 환불은 불가능 합니다. </li>
        </div>
        <br/>
        <p><strong> 탈퇴 사유 </strong></p>
        <form id="f" name="disalbed_form" action="../mypage/mem_disabled.do" method="post">
	        <br/>
	        <input type='hidden' id="email" name='mem_email' value="${loginUser.mem_email}" />
	        <table class="table table-boardered">
		        <tr>
		        	<th style="width:150px; color:gray;">사유 선택</th> 
			        <td><label style="font-size:15px;"><input type="radio" name="dis_reason" value="0">비싼 가격</label> &emsp;&emsp;&emsp;&emsp;&emsp;
			      	<label style="font-size:15px;"><input type="radio" name="dis_reason" value="1">이용빈도 낮음</label>&emsp;&emsp;&emsp;&emsp;&emsp;
			      	<label style="font-size:15px;"><input type="radio" name="dis_reason" value="2">컨텐츠 부족</label>&emsp;&emsp;&emsp;&emsp;&emsp;
			      	<label style="font-size:15px;"><input type="radio" name="dis_reason" value="3">서비스의 불편함</label>&emsp;&emsp;&emsp;&emsp;&emsp;
			      	<label style="font-size:15px;"><input type="radio" name="dis_reason" value="4">소통 부족</label>&emsp;&emsp;&emsp;&emsp;&emsp;
			      	<label style="font-size:15px;"><input type="radio" name="dis_reason" value="5">기타</label></td>
			     </tr> 
			     <tr>
			     	<th style="width:150px; color:gray;">개선할 점</th>
			     	<td><textarea id="dis_improve" name="dis_improve" style="width:700px; height:250px;" placeholder=" 접수된 불편사항은 향후 더 좋은 서비스에 도움이 됩니다. "></textarea></td>
			      </tr>
			      <tr>
			      	<th style="width:150px; color:gray;">비밀번호</th>
			      	<td><input id="mem_pwd" name="mem_pwd" style="width:500px;" placeholder="비밀번호 입력"/> </td>
			      </tr>
		      </table>
		        <br/><br/>
		      <button type="button" class="button" id="disabled_btn" style="color:white; background:gray; font-size:1em; border-radius:0.5em; padding:5px 20px;" align="center">탈퇴하기</button>
        </form>
        
    </div>
    <!-- /.row -->
	<br/>
  </div>
  <!-- /.container -->


<%@include file="../footer.jsp"%>
