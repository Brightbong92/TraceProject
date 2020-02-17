<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp"/>
 
<script>
	if(${empty sessionScope.loginUser}){
		alert("로그인 후 서비스 이용 가능합니다");
		location.href="../login/login.do";
	}
</script>
<script>
	var mem_auth = ${loginUser.mem_auth};
	if(mem_auth == 1){
		alert("멘토회원입니다.");
		history.back(-1);
	}
</script>
<script>
	$(document).ready(function(){
		$("#apply_btn").click(function(){
			$.ajax({
				url:"../mentor/check_apply.do?mem_email="+$("#email").val(),
				success: function(data) {
					if(data == "possible"){
						if ($('#name').val() == "") {
					    	alert("이름을 입력해주세요.");
					    	document.applyForm.ml_name.focus();
					    	return false;
					    }
					    
					   	else if ($('#phone').val() == "") {
					    	alert("전화번호를 입력해주세요.");
					    	document.applyForm.ml_name.focus();
					    	$("#phone").focus();
					    	return false;
					    }
					   	else if ($('#yourself').val() == "") {
					    	alert("자기소개를 입력해주세요.");
					    	document.applyForm.ml_name.focus();
					    	$("#yourself").focus();
					    	return false;
					    }
					   	else if ($("input:radio[name='mtrcg_no']").is(":checked") == false) {
					    	alert("카테고리를 선택해주세요.");
					    	return false;
					    }
					   	else if ($('#file').val() == "") {
					    	alert("첨부파일을 입력해주세요.");
					    	return false;
					    }
					   	else if($('#pAuth').val() == "fail") {
					   		alert("핸드폰 인증을 해주세요.");
					   		return false;
					   	}
						f.submit();
				    	alert("멘토신청이 완료되었습니다. 담당자 확인 후 연락 드리겠습니다.");
						history.back(-1);
					}
					else if(data == "impossible"){
						alert("이미 멘토 신청한 회원입니다.");
						history.back(-1);
					}
				}
			});
		});
	});

</script> 
 
<script>
	$(document).ready(function(){
		document.getElementById("sms").style.display = "none";
		document.getElementById("check").style.display = "none";
	});
</script>
<script> 
	function sendSms() { 
		var receiver = $("#ml_phone").val();
		$.ajax({ 
			url: "${pageContext.request.contextPath}sendSms?receiver="+ receiver, 
			/*data: { 
				receiver: $("#ml_phone").val()
			}, */
			type: "post", 
			success: function(result) { 
				if (result == "true") { 
					console.log(result); 
					document.getElementById("sms").style.display = "inline-block";
					document.getElementById("check").style.display = "inline-block";
					alert("인증번호 전송 성공");
				} else { 
					alert("인증번호 전송 실패"); 
				} 
			} 
		}); 
	}
	function phoneCheck() { 
		$.ajax({ 
			url: "${pageContext.request.contextPath}smsCheck", 
			type: "post", 
			data: { 
				receiver: $("#ml_phone").val(),
				code: $("#sms").val() 
			},
			success: function(result) { 
				if (result == "ok") { 
					$("#ml_phone").attr("readonly",true).attr("disabled",false);
					$("#sms").attr("readonly",true).attr("disabled",false);
					$('#check').attr('disabled',true);
					$('#send').attr('disabled',true);
					$("#pAuth").val("success");
					alert("번호 인증 성공"); 
				} else { 
					alert("번호 인증 실패");
					$("#pAuth").val("fail");
				} 
			} 
		}); 
	}
</script>




  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">멘토 신청 :
      <small>당신의 재능 마음껏 펼치세요</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/">Home</a>
      </li>
      <li class="breadcrumb-item active">Mentor</li>
    </ol>

	<form id="f" name="applyForm" action="../mentor/apply.do" method="post" enctype="multipart/form-data">
		<input type='hidden' id="email" name='mem_email' value="${loginUser.mem_email}" />
		<table class="table table-boardered">
			<tr>
                <th style="width:100px;">이름</th>
                <td><input type="text" id="name" class="form-control" name="ml_name" style="width:500px;" placeholder="이름 입력"></td>        
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" class="form-control" name="ml_phone" id="ml_phone" style="width:500px; float:left" placeholder="'-'를 제외한 휴대폰번호를 입력해주세요.">&nbsp;
                <button type="button" class="btn btn-light" id="send" onclick="sendSms();">인증번호 전송</button> <br/><br/>    
                <input type="text"  class="form-control" name="sms" id="sms" style="width:500px; float:left" placeholder="발송된 인증번호 입력"> &nbsp;
                <button type="button" class="btn btn-light" id="check" onclick="phoneCheck();">인증하기</button>
                <input type="hidden" id="pAuth" value="fail"></td>
            </tr>
            <tr>
                <th>자기소개</th>
                <td><textarea class="form-control" id="yourself" rows="3" name="ml_yourself" style="width:700px; height:250px;" placeholder="간단한 소개와 약력을 입력해 주세요."></textarea></td>
            </tr>
            <tr>
                <th>카테고리 </th>
                <td> <label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="0">운동</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no"  value="1">음악</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no"  value="2">공예</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no"  value="3">요리</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no"  value="4">사진 & 영상</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no"  value="5">뷰티</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no"  value="6">음료</label> </td>
            </tr>
            <tr>
            	<th>첨부자료</th>
            	<td><input type="file" class="input_st iw100" name="ml_ofname" id="file"/><br/><br/>
            	</td>
            </tr>
		</table>
		<div class="board_btn_wrap ac">
		    <input type="button" value="신청하기" id="apply_btn"/>
		    <input type="button" value="취소하기"  onclick='history.back(-1); return false;' />
		</div>
	</form>
	
  </div>
  <!-- /.container -->
	<br/>
	
<%@include file="../footer.jsp"%>
