<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.MentoringQAVo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../top.jsp" %>
<script>
	if(${empty sessionScope.loginUser}){
		alert("로그인 후 서비스 이용 가능합니다");
		location.href="../login/login.do";
	}
</script>
<style>


</style>
<!-- 결제 아임포트API -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">장바구니
      <small>선택페이지</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/">Home</a>
      </li>
      <li class="breadcrumb-item active">cart</li>
    </ol>

    <div class="jumbotron">
    	<c:if test="${empty cartListResult.cartInfo}">
    		장바구니에 담긴 상품이 없습니다.
    	</c:if>
    	<c:if test="${!empty cartListResult.cartInfo}">
    	<b>장바구니 정보</b>
    		<form name="form">
    		<c:forEach items="${cartListResult.cartInfo}" var="list">
					<hr style="color:black;">
						<input type="checkbox" name="chkbox" value="${list.mtr_price}" onclick="SumPrice(this.form)" style="width:20px;height:20px; float:left; margin-top:50px;">
						<div style="margin-left:50px;">
							<img src="../resources/mentoring_list_images/${list.mtr_profile}" alt="img" width="100px" height="100px">&nbsp;&nbsp;&nbsp;
							<span class="badge badge-warning mb-2" style="font-size:1.0em;">${list.mtr_hashtag}</span>
							<span>${list.mtr_subject}</span>
							<input type="hidden" name=mtr_seq value="${list.mtr_seq}">
							<span><button type="button" onclick="location.href='../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}'"style="font-size:15px;float:right;margin-top:37px;">상세보기</button></span>
						</div>
						<div >
							<input type="hidden" name=mtrdi_seq value="${list.mtrdi_seq}">
							<span style="margin-left:50px;">(${list.mtrdi_stime}~${list.mtrdi_etime})</span>
							<span><button type="button" style="font-size:15px;float:right;" onclick="location.href='../cart/deleteCart.do?mem_email=${loginUser.mem_email}&ct_seq=${list.ct_seq}'">삭제</button></span>  
							<span style="float:right;">${list.mtr_price}원</span>
							<br/>
						</div>
					<hr>
			</c:forEach>
				<b>합계</b>
				<hr>
					<div>
						<span id="totPrice">0</span>원<button id="check_module" type="button" style="float:right;">결제하기</button>
					</div>
			</form>
		</c:if>
    </div><!-- /.jumbotron -->

  </div><!-- /.container -->
  
  <%-- <button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>--%>
<script>
		$("#check_module").click(function() {
			var IMP = window.IMP;
			IMP.init('imp34994796');
			IMP.request_pay({
				pg: 'inicis',
				
				pay_method: 'card',
				
				merchant_uid: 'fourP' + new Date().getTime(),
				
				name: '4P팀결제테스트',
				
				amount: 1000,
				
				buyer_email: 'wkdgusqhd080@naver.com',
				buyer_name: '쟝현봉',
				buyer_tel: '010-2173-5831',
				//buyer_addr: '서울특별시 서대문구 홍제동',
				buyer_postcode: '123-456',
				paid_at: new Date().getTime(),
				//m_redirect_url: 'https://www.yourdomain.com/payments/complete'
				
				
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				});
			
		});
	</script>
	<script>
		function SumPrice(frm){
			var sum = 0;
			var count = frm.chkbox.length;
			if (count==undefined) {    //체크박스 한개일때 인식 못하는 예외처리
				if(frm.chkbox.checked == true){
					sum += parseInt(frm.chkbox.value);
				}
			}
			else{
				for(var i=0; i < count; i++ ){
			       if( frm.chkbox[i].checked == true ){
				    sum += parseInt(frm.chkbox[i].value);
			       }
		   		}
			}
		   $("#totPrice").text(sum);
		}
	</script>
<%@include file="../footer.jsp" %>
