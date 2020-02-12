<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />


  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <br/><br/>
    <div class="profile-thumb-wrap" align="center">
    	<c:choose>
    		<c:when test="${!empty listResultAll}">
				<a href="../mentoring/mentoring_list.do?sort=99"><img src="../resources/mentoring_list_images/전체.png" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=0"><img src="../resources/mentoring_list_images/스포츠.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=1"><img src="../resources/mentoring_list_images/음악.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=2"><img src="../resources/mentoring_list_images/공예.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=3"><img src="../resources/mentoring_list_images/요리.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=4"><img src="../resources/mentoring_list_images/사진.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=5"><img src="../resources/mentoring_list_images/뷰티.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=6"><img src="../resources/mentoring_list_images/음료술.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
			</c:when>
			<c:when test="${!empty listResultExercise}">
				<a href="../mentoring/mentoring_list.do?sort=99"><img src="../resources/mentoring_list_images/전체.png" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=0"><img src="../resources/mentoring_list_images/스포츠.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=1"><img src="../resources/mentoring_list_images/음악.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=2"><img src="../resources/mentoring_list_images/공예.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=3"><img src="../resources/mentoring_list_images/요리.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=4"><img src="../resources/mentoring_list_images/사진.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=5"><img src="../resources/mentoring_list_images/뷰티.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=6"><img src="../resources/mentoring_list_images/음료술.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
			</c:when>
			<c:when test="${!empty listResultMusic}">
				<a href="../mentoring/mentoring_list.do?sort=99"><img src="../resources/mentoring_list_images/전체.png" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=0"><img src="../resources/mentoring_list_images/스포츠.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=1"><img src="../resources/mentoring_list_images/음악.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=2"><img src="../resources/mentoring_list_images/공예.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=3"><img src="../resources/mentoring_list_images/요리.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=4"><img src="../resources/mentoring_list_images/사진.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=5"><img src="../resources/mentoring_list_images/뷰티.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=6"><img src="../resources/mentoring_list_images/음료술.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
			</c:when>
			<c:when test="${!empty listResultCraft}">
				<a href="../mentoring/mentoring_list.do?sort=99"><img src="../resources/mentoring_list_images/전체.png" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=0"><img src="../resources/mentoring_list_images/스포츠.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=1"><img src="../resources/mentoring_list_images/음악.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=2"><img src="../resources/mentoring_list_images/공예.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=3"><img src="../resources/mentoring_list_images/요리.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=4"><img src="../resources/mentoring_list_images/사진.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=5"><img src="../resources/mentoring_list_images/뷰티.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=6"><img src="../resources/mentoring_list_images/음료술.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
			</c:when>
			<c:when test="${!empty listResultCooking}">
				<a href="../mentoring/mentoring_list.do?sort=99"><img src="../resources/mentoring_list_images/전체.png" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=0"><img src="../resources/mentoring_list_images/스포츠.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=1"><img src="../resources/mentoring_list_images/음악.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=2"><img src="../resources/mentoring_list_images/공예.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=3"><img src="../resources/mentoring_list_images/요리.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=4"><img src="../resources/mentoring_list_images/사진.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=5"><img src="../resources/mentoring_list_images/뷰티.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=6"><img src="../resources/mentoring_list_images/음료술.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
			</c:when>
			<c:when test="${!empty listResultMedia}">
				<a href="../mentoring/mentoring_list.do?sort=99"><img src="../resources/mentoring_list_images/전체.png" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=0"><img src="../resources/mentoring_list_images/스포츠.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=1"><img src="../resources/mentoring_list_images/음악.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=2"><img src="../resources/mentoring_list_images/공예.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=3"><img src="../resources/mentoring_list_images/요리.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=4"><img src="../resources/mentoring_list_images/사진.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=5"><img src="../resources/mentoring_list_images/뷰티.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=6"><img src="../resources/mentoring_list_images/음료술.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
			</c:when>
			<c:when test="${!empty listResultBeauty}">
				<a href="../mentoring/mentoring_list.do?sort=99"><img src="../resources/mentoring_list_images/전체.png" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=0"><img src="../resources/mentoring_list_images/스포츠.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=1"><img src="../resources/mentoring_list_images/음악.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=2"><img src="../resources/mentoring_list_images/공예.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=3"><img src="../resources/mentoring_list_images/요리.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=4"><img src="../resources/mentoring_list_images/사진.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=5"><img src="../resources/mentoring_list_images/뷰티.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
				<a href="../mentoring/mentoring_list.do?sort=6"><img src="../resources/mentoring_list_images/음료술.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
			</c:when>
			<c:when test="${!empty listResultBeverage}">
				<a href="../mentoring/mentoring_list.do?sort=99"><img src="../resources/mentoring_list_images/전체.png" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=0"><img src="../resources/mentoring_list_images/스포츠.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=1"><img src="../resources/mentoring_list_images/음악.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=2"><img src="../resources/mentoring_list_images/공예.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=3"><img src="../resources/mentoring_list_images/요리.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=4"><img src="../resources/mentoring_list_images/사진.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=5"><img src="../resources/mentoring_list_images/뷰티.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;opacity: 0.2" /></a>
				<a href="../mentoring/mentoring_list.do?sort=6"><img src="../resources/mentoring_list_images/음료술.jpg" style="width:90px; height:90px; border-radius: 100px; margin:14px;" /></a>
			</c:when>
		</c:choose>
		<br/>
		<label style="width:118px;">전체</label>
		<label style="width:118px;">운동</label>
		<label style="width:118px;">음악</label>
		<label style="width:118px;">공예</label>
		<label style="width:118px;">음식</label>
		<label style="width:118px;">사진&영상</label>
		<label style="width:118px;">뷰티</label>
		<label style="width:118px;">음료</label>
	</div>
	<br/>
    <!-- 전체 일 경우 -->
		<c:if test="${!empty listResultAll}">
		   	 <div class="row">
		   	 <c:forEach items="${listResultAll.mtr_list}" var="list">
					      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <p style="font-size:15px;">${list.mtr_subject}</p>
					            </h4>
					            <p class="card-text"><span class="badge badge-warning mb-2">${list.mtr_hashtag}</span></p>
					            <span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_area}</p>
					            <span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_price}</p>
					            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					           <!--   <p class="card-text">평점:${list.mtr_jumsu}</p>-->
					      		<input type="hidden" id="hidden_id" value="${listResultAll.category_no}">
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
					        </div>
					      </div>
			</c:forEach>
			</div><!--/ .row -->
			<c:if test="${empty listResultAll.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
		<!-- 운동 일 경우 -->
		<c:if test="${!empty listResultExercise}">
		   	 <div class="row">
			   	 	<c:forEach items="${listResultExercise.mtr_list}" var="list">
					      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <p style="font-size:15px;">${list.mtr_subject}</p>
					            </h4>
					            <p class="card-text"><span class="badge badge-warning mb-2">${list.mtr_hashtag}</span></p>
					            <span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_area}</span><br/><br/>
					            <span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_price}</span><br/><br/>
					            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					           <!--   <p class="card-text">평점:${list.mtr_jumsu}</p>-->
					      		<input type="hidden" id="hidden_id" value="${listResultExercise.category_no}">
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
					        </div>
					        
					      </div>
					      
			   	 	</c:forEach>
			</div><!--/ .row -->
			<c:if test="${empty listResultExercise.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
		<!-- 음악 일 경우 -->
		<c:if test="${!empty listResultMusic}">
		   	 <div class="row">
			   	 	<c:forEach items="${listResultMusic.mtr_list}" var="list">
					      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <p style="font-size:15px;">${list.mtr_subject}</p>
					            </h4>
					            <p class="card-text"><span class="badge badge-warning mb-2">${list.mtr_hashtag}</span></p>
					            <span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_area}</span><br/><br/>
					            <span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_price}</span><br/><br/>
					            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					           <!--   <p class="card-text">평점:${list.mtr_jumsu}</p>-->
					      		<input type="hidden" id="hidden_id" value="${listResultMusic.category_no}">
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
					        </div>
					      </div>
			   	 	</c:forEach>
			</div><!--/ .row -->
			<c:if test="${empty listResultMusic.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
	<!-- 공예 일 경우 -->
			<c:if test="${!empty listResultCraft}">
		   	 <div class="row">
			   	 	<c:forEach items="${listResultCraft.mtr_list}" var="list">
					      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <p style="font-size:15px;">${list.mtr_subject}</p>
					            </h4>
					            <p class="card-text"><span class="badge badge-warning mb-2">${list.mtr_hashtag}</span></p>
					            <span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_area}</span><br/><br/>
					            <span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_price}</span><br/><br/>
					            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					           <!--   <p class="card-text">평점:${list.mtr_jumsu}</p>-->
					      		<input type="hidden" id="hidden_id" value="${listResultCraft.category_no}">
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
					        </div>
					      </div>
			   	 	</c:forEach>
			</div><!--/ .row -->
			<c:if test="${empty listResultCraft.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
		<!-- 요리 일 경우 -->
			<c:if test="${!empty listResultCooking}">
		   	 <div class="row">
			   	 	<c:forEach items="${listResultCooking.mtr_list}" var="list">
					      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <p style="font-size:15px;">${list.mtr_subject}</p>
					            </h4>
					            <p class="card-text"><span class="badge badge-warning mb-2">${list.mtr_hashtag}</span></p>
					            <span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_area}</span><br/><br/>
					            <span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_price}</span><br/><br/>
					            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					           <!--   <p class="card-text">평점:${list.mtr_jumsu}</p>-->
					      		<input type="hidden" id="hidden_id" value="${listResultCooking.category_no}">
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
					        </div>
					      </div>
			   	 	</c:forEach>
			</div><!--/ .row -->
			<c:if test="${empty listResultCooking.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
	<!-- 사진&영상일경우 -->
		<c:if test="${!empty listResultMedia}">
		   	 <div class="row">
			   	 	<c:forEach items="${listResultMedia.mtr_list}" var="list">
					      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <p style="font-size:15px;">${list.mtr_subject}</p>
					            </h4>
					            <p class="card-text"><span class="badge badge-warning mb-2">${list.mtr_hashtag}</span></p>
					            <span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_area}</span><br/><br/>
					            <span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_price}</span><br/><br/>
					            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					           <!--   <p class="card-text">평점:${list.mtr_jumsu}</p>-->
					      		<input type="hidden" id="hidden_id" value="${listResultMedia.category_no}">
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
					        </div>
					      </div>
			   	 	</c:forEach>
			</div><!--/ .row -->
			<c:if test="${empty listResultMedia.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
	<!-- 뷰티일 경우 -->
			<c:if test="${!empty listResultBeauty}">
		   	 <div class="row">
			   	 	<c:forEach items="${listResultBeauty.mtr_list}" var="list">
					      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <p style="font-size:15px;">${list.mtr_subject}</p>
					            </h4>
					            <p class="card-text"><span class="badge badge-warning mb-2">${list.mtr_hashtag}</span></p>
					            <span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_area}</span><br/><br/>
					            <span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_price}</span><br/><br/>
					            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					           <!--   <p class="card-text">평점:${list.mtr_jumsu}</p>-->
					      		<input type="hidden" id="hidden_id" value="${listResultBeauty.category_no}">
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
					        </div>
					      </div>
			   	 	</c:forEach>
			</div><!--/ .row -->
			<c:if test="${empty listResultBeauty.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
		
		<!-- 음료일 경우 -->
			<c:if test="${!empty listResultBeverage}">
		   	 <div class="row">
			   	 	<c:forEach items="${listResultBeverage.mtr_list}" var="list">
					      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
					        <div class="card h-100" style="height: 10px;">
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <p style="font-size:15px;">${list.mtr_subject}</p>
					            </h4>
					            <p class="card-text"><span class="badge badge-warning mb-2">${list.mtr_hashtag}</span></p>
					            <span class="badge badge-primary" >지역  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_area}</span><br/><br/>
					            <span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&nbsp;${list.mtr_price}</span><br/><br/>
					            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary" >평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					           <!--   <p class="card-text">평점:${list.mtr_jumsu}</p>-->
					      		<input type="hidden" id="hidden_id" value="${listResultBeverage.category_no}">
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
					        </div>
					      </div>
			   	 	</c:forEach>
			</div><!--/ .row -->
		    <c:if test="${empty listResultBeverage.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
   <script>
    currentPage = 1;
    sort = document.getElementById('hidden_id').value;
    $(window).scroll(function() {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
          ++currentPage;
          $.ajax({
        	  type:'GET',
        	  contentType:"application/json",
        	  url:'../mentoring/ajaxList.do?cp='+currentPage+'&sort='+sort,
			  success: function(data) {
				  //alert("sort: " + sort);
				  //console.log("data: " + data);
				  //var dataArr = JSON.stringify(data);
				  //alert("dataArr: " + dataArr);
				  //console.log("data.mtr_list: " + data.mtr_list);
				  //var mtr_list = JSON.stringify(data.mtr_list);
				 	for(m of data.mtr_list){
				 		if(m.mtr_jumsu == 0){
				 			 $(".row").append("<div class='col-lg-3 col-md-4 col-sm-6 portfolio-item'><div class='card h-100'> <a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'><img class='card-img-top' src='../resources/mentoring_list_images/"+m.mtr_profile+"' alt=''></a><div class='card-body'><h4 class='card-title'><p style='font-size:15px;'>"+m.mtr_subject+"</p></h4><p class='card-text'><span  class='badge badge-warning mb-2'>"+m.mtr_hashtag+"</span></p><p class='card-text'><span class='badge badge-primary' >지역:</span>"+m.mtr_area+"</p><p class='card-text'><span class='badge badge-primary' >금액:</span>"+m.mtr_price+"</p>"+
									  "<div class='starRev'><span class='badge badge-primary' >평점:</span>&emsp;<span class='starR'>별1</span><span class='starR'>별2</span><span class='starR'>별3</span><span class='starR'>별4</span><span class='starR'>별5</span></div></div><a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'class ='btn btn-outline-primary'>멘토링 참여하기</a>");
				 		}else if(m.mtr_jumsu == 1){
				 			 $(".row").append("<div class='col-lg-3 col-md-4 col-sm-6 portfolio-item'><div class='card h-100'> <a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'><img class='card-img-top' src='../resources/mentoring_list_images/"+m.mtr_profile+"' alt=''></a><div class='card-body'><h4 class='card-title'><p style='font-size:15px;'>"+m.mtr_subject+"</p></h4><p class='card-text'><span  class='badge badge-warning mb-2'>"+m.mtr_hashtag+"</span></p><p class='card-text'><span class='badge badge-primary' >지역:</span>"+m.mtr_area+"</p><p class='card-text'><span class='badge badge-primary' >금액:</span>"+m.mtr_price+"</p>"+
							  "<div class='starRev'><span class='badge badge-primary' >평점:</span>&emsp;<span class='starR on'>별1</span><span class='starR'>별2</span><span class='starR'>별3</span><span class='starR'>별4</span><span class='starR'>별5</span></div></div><a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'class = 'btn btn-outline-primary'>멘토링 참여하기</a>");
				 		}else if(m.mtr_jumsu == 2){
				 			 $(".row").append("<div class='col-lg-3 col-md-4 col-sm-6 portfolio-item'><div class='card h-100'> <a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'><img class='card-img-top' src='../resources/mentoring_list_images/"+m.mtr_profile+"' alt=''></a><div class='card-body'><h4 class='card-title'><p style='font-size:15px;'>"+m.mtr_subject+"</p></h4><p class='card-text'><span  class='badge badge-warning mb-2'>"+m.mtr_hashtag+"</span></p><p class='card-text'><span class='badge badge-primary' >지역:</span>"+m.mtr_area+"</p><p class='card-text'><span class='badge badge-primary' >금액:</span>"+m.mtr_price+"</p>"+
							  "<div class='starRev'><span class='badge badge-primary' >평점:</span>&emsp;<span class='starR on'>별1</span><span class='starR on'>별2</span><span class='starR'>별3</span><span class='starR'>별4</span><span class='starR'>별5</span></div></div><a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'class = 'btn btn-outline-primary'>멘토링 참여하기</a>");
				 		}else if(m.mtr_jumsu == 3){
				 			 $(".row").append("<div class='col-lg-3 col-md-4 col-sm-6 portfolio-item'><div class='card h-100'> <a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'><img class='card-img-top' src='../resources/mentoring_list_images/"+m.mtr_profile+"' alt=''></a><div class='card-body'><h4 class='card-title'><p style='font-size:15px;'>"+m.mtr_subject+"</p></h4><p class='card-text'><span  class='badge badge-warning mb-2'>"+m.mtr_hashtag+"</span></p><p class='card-text'><span class='badge badge-primary' >지역:</span>"+m.mtr_area+"</p><p class='card-text'><span class='badge badge-primary' >금액:</span>"+m.mtr_price+"</p>"+
							  "<div class='starRev'><span class='badge badge-primary' >평점:</span>&emsp;<span class='starR on'>별1</span><span class='starR on'>별2</span><span class='starR on'>별3</span><span class='starR'>별4</span><span class='starR'>별5</span></div></div><a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'class = 'btn btn-outline-primary'>멘토링 참여하기</a>");
				 		}else if(m.mtr_jumsu == 4){
				 			$(".row").append("<div class='col-lg-3 col-md-4 col-sm-6 portfolio-item'><div class='card h-100'> <a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'><img class='card-img-top' src='../resources/mentoring_list_images/"+m.mtr_profile+"' alt=''></a><div class='card-body'><h4 class='card-title'><p style='font-size:15px;'>"+m.mtr_subject+"</p></h4><p class='card-text'><span  class='badge badge-warning mb-2'>"+m.mtr_hashtag+"</span></p><p class='card-text'><span class='badge badge-primary' >지역:</span>"+m.mtr_area+"</p><p class='card-text'><span class='badge badge-primary' >금액:</span>"+m.mtr_price+"</p>"+
							  "<div class='starRev'><span class='badge badge-primary' >평점:</span>&emsp;<span class='starR on'>별1</span><span class='starR on'>별2</span><span class='starR on'>별3</span><span class='starR on'>별4</span><span class='starR'>별5</span></div></div><a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'class = 'btn btn-outline-primary'>멘토링 참여하기</a>");
				 		}else if(m.mtr_jumsu == 5){
				 			$(".row").append("<div class='col-lg-3 col-md-4 col-sm-6 portfolio-item'><div class='card h-100'> <a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'><img class='card-img-top' src='../resources/mentoring_list_images/"+m.mtr_profile+"' alt=''></a><div class='card-body'><h4 class='card-title'><p style='font-size:15px;'>"+m.mtr_subject+"</p></h4><p class='card-text'><span  class='badge badge-warning mb-2'>"+m.mtr_hashtag+"</span></p><p class='card-text'><span class='badge badge-primary' >지역:</span>"+m.mtr_area+"</p><p class='card-text'><span class='badge badge-primary' >금액:</span>"+m.mtr_price+"</p>"+
							  "<div class='starRev'><span class='badge badge-primary' >평점:</span>&emsp;<span class='starR on'>별1</span><span class='starR on'>별2</span><span class='starR on'>별3</span><span class='starR on'>별4</span><span class='starR on'>별5</span></div></div><a href='../mentoring/mentoringDetail.do?mtr_seq="+m.mtr_seq+"'class = 'btn btn-outline-primary'>멘토링 참여하기</a>");
				 		}
			  		}
			  },
			  error: function(p1, p2, p3) {
				  console.log("p1: " + p1 + ", p2: " + p2 + ", p3: " + p3);
			  }
          });
        }
    });
  </script>
    

	
  </div>  <!-- /.container -->
<%@include file="../footer.jsp"%>
