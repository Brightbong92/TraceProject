<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.MentoringQAVo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../top.jsp" %>

<style>
#pi_name {
  width:135px;
  height:30px;
  font-size:15px;
}
#pi_phone {
	width:135px;
	height:30px;
	font-size:15px;
}
#pointText {
	width:135px;
	height:30px;
	font-size:15px;
}

</style>
<!-- 결제 아임포트API -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">결제
      <small>결제페이지</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#">Home</a>
      </li>
      <li class="breadcrumb-item active"></li>
    </ol>

    <div class="jumbotron">
    <form name="f" method="post" action="../payment/cartPurchaseInfo.do">
    	<b>결제자정보</b>
    	<hr>
    		<div>
    			<b>이름: </b> <input type="text" id="pi_name" name="pi_name" placeholder="구매자이름"/>
    			<br/>
    			<br/>
    			<b>번호: </b> <input type="text" id="pi_phone" name="pi_phone" placeholder="휴대폰번호 -제외" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
    		</div>
    	<hr>
    	<b>주문정보</b>
		<hr>

		<c:forEach items="${listResult.cartPaymentInfoList}" var="list">
			<div>
				<img src="../resources/mentoring_list_images/${list.mtr_profile}" alt="img" width="100px" height="100px">&nbsp;&nbsp;&nbsp;
				<span style="font-size:1.0em" class="badge badge-warning mb-2">${list.mtr_hashtag}</span>&nbsp;&nbsp;<span><b id="pi_products">${list.mtr_subject}</b></span>
			</div>
			<div>
				<hr>
				<span>옵션: <b>${list.mtrdi_stime}~${list.mtrdi_etime}</b></span><span style="float:right;">${list.mtr_price}원</span><br/>
				<input type="hidden" name="ct_seq" value="${list.ct_seq}">
			</div>
			<hr>
		</c:forEach>


		<hr>
		<hr>
		<b>할인</b>
		<hr>
			<div>
				<span>나의 포인트: </span><span id="mem_point" point="${listResult.mem_point}">${listResult.mem_point}</span>P&nbsp;&nbsp;&nbsp;
				<c:if test="${loginUser.mem_point ne 0}">
				<input type="text" id="pointText" placeholder="포인트사용"/>
				<button type="button" style="float:right;" onclick="pointUse();">사용하기</button>
				</c:if>
			</div>
		<hr>
		<b>결제금액</b>
		<hr>
			<div>
				<span id="pi_price">${listResult.sumPaymentPrice}</span>원
				<button id="check_module" type="button" style="float:right;">결제하기</button>
			</div>
			
			<input type="hidden" id="usedPointTot" name="usedPointTot" value="0"/>
			<input type="hidden" id="pi_priceResult" name="pi_price" value=""/>
			<input type="hidden" id="pi_muid" name="pi_muid" value=""/>
			<input type="hidden" id="pi_product" name="pi_product" value=""/>
			<input type="hidden" name="mem_email" value="${loginUser.mem_email}"/>
	</form>
    </div><!-- /.jumbotron -->
	
  </div><!-- /.container -->
<script>
<%--포인트관련로직--%>
$(document).ready(function(){
	
	usedPoint = $("#usedPointTot").val();
	
	$("#pi_phone").on('keyup',function() {
		if($("#pi_phone").val().length > 11) {
			alert("길이가 너무 길어요.");
			$("#pi_phone").val("");
			return false;
		}
	});
	
	$("#pointText").on('keyup', function(){
		this.value=this.value.replace(/[^0-9]/g,'');
		var orign_point = $("#mem_point").text();
		var input_point = $("#pointText").val();
		if(parseInt(orign_point) < parseInt(input_point)){
			alert("보유 포인트보다 높은 포인트입니다.")
			$("#pointText").val("");
			return false;
		}
	});

});
	function pointUse(){//포인트사용
		if($("#pointText").val() != "") {
			
			//할인부분
			var use_point = $("#pointText").val();//사용할 포인트
			var origin_point = $("#mem_point").text();//가지고있는 포인트
			
			if(parseInt(use_point) < parseInt(origin_point)){//사용포인트 < 가지고있는포인트
				var left_point = parseInt(origin_point) - parseInt(use_point);//포인트계산
				$("#mem_point").text(left_point);//남은 포인트
				$("#pointText").val("");//텍스트 초기화

				//결제금액부분
				var origin_pi_price = $("#pi_price").text();
				var sale_pi_price = parseInt(origin_pi_price) - parseInt(use_point);
				if(sale_pi_price <= 0) {
					alert("결제금액이 '-' or 0원이 될 수 없습니다.");
					$("#mem_point").text($("#mem_point").attr("point"));
				}else {
					//포인트사용 누적부분
					usedPoint = parseInt(usedPoint) + parseInt(use_point);//사용되는 포인트계산
					$("#usedPointTot").val(usedPoint);//누적된 사용포인트
					//alert("사용된 포인트누계: " + $("#usedPointTot").val());
					$("#pi_price").text(sale_pi_price);
				}
			}
		}else {
			alert("포인트를 입력 후 누르세요.");
			return false;
		}
	}
</script>

<script>
		$("#check_module").click(function() {
			if($("#pi_name").val() == "" || $("#pi_phone").val() == "") {
				alert("결제자정보를 입력해주세요.");
				return false;
			}
			var productSize = '<c:out value="${listResult.cartPaymentInfoList.size()}"/>';
			var pi_products = "";
			if(productSize == 1) {
				pi_products = $("#pi_products").text();
				//alert("한개");
				console.clear();
			}else {
				pi_products = $("#pi_products").text() + " 외 "+(productSize-1)+"건"
				//alert("여러개");
				console.clear();
			}
			var IMP = window.IMP;
			IMP.init('imp34994796');
			IMP.request_pay({
				pg: 'inicis',
				pay_method: 'card',
				merchant_uid: 'fourP' + new Date().getTime(),
				name: pi_products,
				amount: $("#pi_price").text(),
				buyer_email: '${loginUser.mem_email}',
				buyer_name: $("#pi_name").val(),
				buyer_tel: $("#pi_phone").val(),
				paid_at: new Date().getTime(),
			}, function (rsp) {
						//console.log(rsp);
						if (rsp.success) {
						$("#pi_muid").val(rsp.merchant_uid);
						$("#pi_priceResult").val($("#pi_price").text());
						$("#usedPointTot").val(usedPoint);
						$("#pi_product").val(pi_products);
						alert("결제가 완료되었습니다.");
						f.submit();
						} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
						//alert(msg);
						}
					});
		});
	</script>

<%@include file="../footer.jsp" %>
