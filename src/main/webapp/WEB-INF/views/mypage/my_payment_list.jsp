<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nDate" />


<jsp:include page="../top.jsp" />
<script>
	if(${empty sessionScope.loginUser}){
		alert("로그인 후 서비스 이용 가능합니다");
		location.href="../login/login.do";
	}
</script>
 <script
    src="https://code.jquery.com/jquery-3.3.1.min.js" 
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous">
 </script><!-- jQuery CDN --->
  
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
          <a href="../mypage/myActivity.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:gray;">나의 활동 내역</a>
          <a href="../mypage/myPoint.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:gray;">포인트</a>
          <a href="../mypage/myPaymentInfo.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:white;">구매 &환불 내역 </a>
          <a href="../cart/cart.do?mem_email=${loginUser.mem_email}" class="aaa"  style="background:#f74f76; color:white;">장바구니</a>
        </div>
      </div>
      <br/>
      
      <div class="col-lg-3 mb-4 bora" style="margin-top:-15px;">
      	<div class="list-group bora1" style="font-size:13px;" >
          	<a href="../mypage/myPaymentInfo.do?mem_email=${loginUser.mem_email}" class=bbb style="color:red;">결제 내역</a>
          	<a href="../mypage/myRefundInfo.do?mem_email=${loginUser.mem_email}" class="bbb" style="color:gray;">환불 내역 </a>
      	</div>
      </div>
      
     <table class="table table-boardered">
      	<tr>
      		<td> 번호 </td>
      		<td> 결제번호 </td>
      		<td> 상품명</td>
      		<td> 가격 </td>
      		<td> 결제날짜 </td>
      		<td> 환불가능여부 </td>
     	</tr>
     	<c:if test="${!empty payment_info_list}">
     	<c:forEach items="${payment_info_list}" var = "payment_info" varStatus="status">
     	<tr>
     		<td>${status.count}</td>
     		<td>${payment_info.pi_muid}</td>
     		<td>${payment_info.pi_product}</td>
     		<td>${payment_info.pi_price}원</td>
     		<td><fmt:formatDate value="${payment_info.pi_rdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
     		<fmt:formatDate value="${payment_info.pi_rdate}" pattern="yyyy-MM-dd" var="rdate"/>
     		<c:choose>
     		<c:when test="${rdate eq nDate}">
     		<td><button pi_seq="${payment_info.pi_seq}" pi_muid="${payment_info.pi_muid}" onclick="cancelPay(this)" style="color:white; background:#eb4034; font-size:1em; border-radius:0.5em; padding:5px 20px;">환불하기</button></td>
     		</c:when>
     		<c:otherwise>
     		<td>환불불가</td>
     		</c:otherwise>
     		</c:choose>
     		
     	</tr>
     	</c:forEach>
     	</c:if>
     	
     	<c:if test="${empty payment_info_list}">
     		<tr>
     		<td colspan=6>결제내역이 없습니다.</td>
     		</tr>
     	</c:if>
     	
     	</table>
      
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
<script>
	 function cancelPay(obj) {
	 	var pi_muid = $(obj).attr("pi_muid");
	 	alert(pi_muid);
	 	location.href="../iamport/refund.do?pi_muid="+pi_muid;
 }
</script>

<%@include file="../footer.jsp"%>
