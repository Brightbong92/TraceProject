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
    	<hr>
    	<b>전체선택</b><input type="checkbox" name="chkAll" style="width:20px;height:20px;float:left;"/>
    		<form name="f" method="post" action="/payment/cartListPaymentList.do">			
    		<c:forEach items="${cartListResult.cartInfo}" var="list">
					<hr>
						<input type="checkbox" name="chkbox" ct_seq="${list.ct_seq}" mtr_seq="${list.mtr_seq}" mtrdi_seq="${list.mtrdi_seq}" mtr_price="${list.mtr_price }" value="${list.mtr_price}" onclick="SumPrice(this.form)" style="width:20px;height:20px; float:left; margin-top:50px;">
						<div style="margin-left:50px;">
							<img src="../resources/mentoring_list_images/${list.mtr_profile}" alt="img" width="100px" height="100px">&nbsp;&nbsp;&nbsp;
							<span class="badge badge-warning mb-2" style="font-size:1.0em;">${list.mtr_hashtag}</span>
							<span>${list.mtr_subject}</span>
							<span><button type="button" onclick="location.href='../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}'"style="font-size:15px;float:right;margin-top:37px;">상세보기</button></span>
						</div>
						<div >
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
						<span id="totPrice">0</span>원<button id="purchase" type="button" style="float:right;">결제하기</button>
					</div>
					<input type="hidden" id="sumPaymentPrice" name="sumPaymentPrice" value=""/>
					<input type="hidden" id="cartList" name="cartList" value=""/>
			</form>
		</c:if>
    </div><!-- /.jumbotron -->

  </div><!-- /.container -->

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

	
<script>

cartList = [];

$(document).ready(function(){
	
	$("#purchase").on('click', function(){
		var sumPaymentPrice = $("#totPrice").text();
		if(sumPaymentPrice != 0 & cartList.length != 0) {//alert("결제로직");
			//alert("합계: " + sumPaymentPrice);
			$("#sumPaymentPrice").val(sumPaymentPrice);
			//alert("구매 할 목록: " + cartList);
			$("#cartList").val(cartList);
			f.submit();
		}else {
			alert("결제 목록을 선택해주세요.");
			return false;
		}
	});
	
	$("[name=chkAll]").click(function(){
		allCheckFunc(this);
		totalPriceCal(this);
		totalProductCal(this);
	});
	
	function allCheckFunc(obj) {
		$("[name=chkbox]").prop("checked", $(obj).prop("checked") );
	}
	function totalProductCal(obj){
		console.clear();
		if($('input:checkbox[name=chkbox]:checked').length != 0){//전체선택
			$('input:checkbox[name=chkbox]').each(function() {
					if($(this).prop("checked")){
					    var ct_seq = $(this).attr("ct_seq");
					    cartList.push(ct_seq);
					}
				});
		}else {//전체해제
			var l = cartList.length;
			cartList.splice(0, l);
		}	
	}
	function totalPriceCal(obj){
		console.clear();
		var totPrice = 0;
		if($('input:checkbox[name=chkbox]:checked').length != 0){
			$('input:checkbox[name=chkbox]').each(function(){
				if($(this).prop("checked")){
					totPrice = parseInt(totPrice) + parseInt($(this).attr("mtr_price"));
				}
			});
			$("#totPrice").text(totPrice);
		}else {
			$("#totPrice").text("0");
		}
	}
	
	$("[name=chkbox]").each(function(){
		$(this).click(function(){
			oneCheckFunc(this);
		});
	});
	
	function oneCheckFunc(obj){
		var allObj = $("[name=chkAll]");
		var objName = $(obj).attr("name");
		var ct_seq = $(obj).attr("ct_seq");
			if($(obj).prop("checked")) {
				checkBoxLength = $("[name="+ objName +"]").length;
				checkedLength = $("[name="+ objName +"]:checked").length;
				if( checkBoxLength == checkedLength ) {//alert("각각 체크하다가 전부다 체크 될시");
					cartList.push(ct_seq);
					allObj.prop("checked", true);
				}else {//alert("각각 체크 될 시");
					cartList.push(ct_seq);
					allObj.prop("checked", false);
				}
			}
			else{//alert("체크해제 될 시");
				allObj.prop("checked", false);
				var index = cartList.indexOf(ct_seq);
				if(index > -1) {
					cartList.splice(index, 1);
				}
			}	
	}
	
});

</script>
	
	
<%@include file="../footer.jsp" %>
