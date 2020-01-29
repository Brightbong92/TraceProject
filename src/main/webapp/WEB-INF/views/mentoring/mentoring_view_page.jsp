<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />

<body>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${listResult.mtr_subject} : 
      <small>상품페이지</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Portfolio Item</li>
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-8">
        <!--  <img class="img-fluid" src="http://placehold.it/750x500" alt="">-->
        <img class="img-fluid" src="../resources/mentoring_list_images/${listResult.mtr_profile}" alt="">
      </div>

      <div class="col-md-4">
        <h3 class="my-3">멘토링 타임</h3>
        <c:forEach items="${listResult.detail_Info_List}" var="timelist">
        	<span>시작시간: ${timelist.mtrdi_stime}</span><br/>
        	<span>종료시간: ${timelist.mtrdi_etime}</span><br/>
        	<span>최대인원: ${timelist.mtrdi_max_pcnt}</span>&nbsp;
        	<span>현재인원: ${timelist.mtrdi_now_pcnt}</span><br/><br/>
        </c:forEach>
         
        <h3 class="my-3">결제 / 장바구니</h3>
        <ul>
          <li>Lorem Ipsum</li>
          <li>Dolor Sit Amet</li>
          <li>Consectetur</li>
          <li>Adipiscing Elit</li>
        </ul>
      </div>

    </div>
    <!-- /.row -->
    
    
    <!-- 멘토 프로필 -->
    <h3 class="my-4"><b>멘토 프로필</b></h3>
    <div style="color:blue;" onclick="window.open('../mentor/popup.do?mem_email=${listResult.mem_email}','멘토정보','width=500px,height=500px,left=100px,top=100px');">프로필보기</div>
    
     <!-- 멘토링 내용-->
     <h3 class="my-4"><b>내용</b></h3>
     <div>
     	${listResult.mtr_content}
     </div>
    
    
    
    
    
    
    
    
    
    <!-- Related Projects Row -->
    <h3 class="my-4"><b>관련된 멘토링</b></h3>

    <div class="row">
	<c:if test="${empty listResult.relative_mtr_list}">
			<div>관련된 멘토링이 없습니다.</div>
	</c:if>
	
	<c:if test="${!empty listResult.relative_mtr_list}">
	<c:forEach items="${listResult.relative_mtr_list}" var="relative_list">
      <div class="col-md-3 col-sm-6 mb-4">
        <a href="../mentoring/mentoringDetail.do?mtr_seq=${relative_list.mtr_seq}">
          <img class="img-fluid" src="../resources/mentoring_list_images/${relative_list.mtr_profile}" alt="">
	   		<b>${relative_list.mtr_subject}</b>
        </a>
        	<b style="color:green;">${relative_list.mtr_hashtag}</b>
      </div>
    </c:forEach>
	</c:if>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

<%@include file="../footer.jsp"%>
