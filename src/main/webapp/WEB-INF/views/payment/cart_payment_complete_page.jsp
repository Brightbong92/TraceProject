<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.MentoringQAVo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../top.jsp" %>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">결제
      <small>결제완료</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#">Home</a>
      </li>
      <li class="breadcrumb-item active"></li>
    </ol>

    <div class="jumbotron">

    	<b>결제자정보</b>
    	<hr>
    		<div>
    			<b>이름: </b><span>${cartPurchaseVo.pi_name}</span>
    			<br/>
    			<br/>
    			<b>번호: </b><span>${cartPurchaseVo.pi_phone}</span>
    		</div>
    	<hr>
    	<b>주문정보: ${cartPurchaseVo.pi_muid}</b>
		<hr>
		
		<c:forEach items="${listResult.cart_order_list}" var="order_list">
			<div>
				<img src="../resources/mentoring_list_images/${order_list.mtr_profile}" alt="img" width="100px" height="100px">&nbsp;&nbsp;&nbsp;
				<span style="font-size:1.0em" class="badge badge-warning mb-2">${order_list.mtr_hashtag}</span>&nbsp;&nbsp;<span><b>${order_list.mtr_subject}</b></span>
			</div>
					<div>
						<hr>
						<span>옵션: <b>${order_list.mtrdi_stime}~${order_list.mtrdi_etime}</b>
						</span><span style="float:right;">${order_list.mtr_price}원</span><br/>
					</div>
					<hr>
		</c:forEach>
		
		<hr>
		<hr>
		<b>할인</b>
		<hr>
			<div>
				<span>사용 포인트: </span><span>${cartPurchaseVo.usedPointTot}</span>P&nbsp;&nbsp;&nbsp;
			</div>
		<hr>
		<b>결제금액</b>
		<hr>
			<div>
				<span id="pi_price">${cartPurchaseVo.pi_price}</span>원
			</div>

    </div><!-- /.jumbotron -->
	
  </div><!-- /.container -->


<%@include file="../footer.jsp" %>
