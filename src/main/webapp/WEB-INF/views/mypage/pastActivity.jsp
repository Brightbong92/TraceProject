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
			<img src="../resources/profileImage/${loginUser.mem_profile}" onError="this.src='../resources/profileImage/TraceDefaultProfile.jpg'" class="thumb-profile" alt="프로필사진" style="width:120px; height:120px; border-radius: 100px;" />
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
          <a href="../mypage/myInfo.do" class="aaa" style="color:gray;">내 정보 관리</a>
          <a href="../mypage/myActivity.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:white;">나의 활동 내역</a>
          <a href="../mypage/myPoint.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:gray;">포인트</a>
          <a href="../mypage/myPayment.do" class="aaa" style="color:gray;">구매 &환불 내역 </a>
          <a href="../cart/cart.do?mem_email=${loginUser.mem_email}" class="aaa"  style="background:#f74f76; color:white;">장바구니</a>
        </div>
      </div>
      <br/>
      <div class="col-lg-3 mb-4 bora" style="margin-top:-15px;">
      	<div class="list-group bora1" style="font-size:13px;" >
          	<a href="../mypage/myActivity.do" class=bbb style="color:gray;">신청한 멘토링</a>
          	<a href="../mypage/pastActivity.do" class="bbb" style="color:red;">지난 멘토링 </a>
      	</div>
      </div>
       <table class="table table-boardered">
      	<tr>
      		<td><strong> 번호</strong></td>
      		<td><strong> 멘토링 명</strong></td>
      		<td><strong> 종료시간 </strong></td>
      		<td><strong> 결제날짜</strong> </td>
      		<td><strong> 후기</strong> </td>
     	</tr>
     	<tr>
     		<td>2</td>
     		<td>서핑</td>
     		<td>20/02/04 17:00</td>
     		<td>20/02/01 17:35</td>
     		<td><button style="color:white; background:#3b67f7; font-size:1em; border-radius:0.5em; padding:5px 20px;">후기 작성하기</button></td>
     	</tr>
     	</table>
     
      <!-- Content Column -->
      <div class="col-lg-9 mb-4 bora0">
        
        
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->


<%@include file="../footer.jsp"%>
