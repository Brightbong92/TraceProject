<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />


  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">멘토링 : 
      <small>현재 진행중인 멘토링</small>
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/">Home</a>
      </li>
      <li class="breadcrumb-item active"><a href="../mentoring/mentoring_list.do?sort=99">99전체</a></li>
      <li class="breadcrumb-item active"><a href="../mentoring/mentoring_list.do?sort=0">0운동</a></li>
      <li class="breadcrumb-item active"><a href="../mentoring/mentoring_list.do?sort=1">1음악</a></li>
      <li class="breadcrumb-item active"><a href="../mentoring/mentoring_list.do?sort=2">2공예</a></li>
      <li class="breadcrumb-item active"><a href="../mentoring/mentoring_list.do?sort=3">3요리</a></li>
      <li class="breadcrumb-item active"><a href="../mentoring/mentoring_list.do?sort=4">4사진&영상</a></li>
      <li class="breadcrumb-item active"><a href="../mentoring/mentoring_list.do?sort=5">5뷰티</a></li>
      <li class="breadcrumb-item active"><a href="../mentoring/mentoring_list.do?sort=6">6음료</a></li>
    </ol>
    <!-- 전체 일 경우 -->
		<c:if test="${!empty listResultAll}">
		   	 <div class="row">
		   	 <c:forEach items="${listResultAll.mtr_list}" var="list">
					      <div class="col-lg-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <a href="#"><b>${list.mtr_subject}</b></a>
					            </h4>
					            <p class="card-text"><b>${list.mtr_hashtag}</b></p>
					            <p class="card-text">지역:<b>${list.mtr_area}</b></p>
					            <p class="card-text">금액:<b>${list.mtr_price}</b></p>
					            <p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>
					      		<input type="hidden" id="hidden_id" value="${listResultAll.category_no}">
					          </div>
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
					      <div class="col-lg-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <a href="#"><b>${list.mtr_subject}</b></a>
					            </h4>
					            <p class="card-text"><b>${list.mtr_hashtag}</b></p>
					            <p class="card-text">지역:<b>${list.mtr_area}</b></p>
					            <p class="card-text">금액:<b>${list.mtr_price}</b></p>
					            <p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>
					      		<input type="hidden" id="hidden_id" value="${listResultExercise.category_no}">
					          </div>
					        </div>
					      </div>
			   	 	</c:forEach>
			</div><!--/ .row -->
			<c:if test="${empty listResultExcercise.mtr_list}">
				<div align='center'>찾으시는 멘토링이 없습니다.</div>
			</c:if>
		</c:if>
		<!-- 음악 일 경우 -->
		<c:if test="${!empty listResultMusic}">
		   	 <div class="row">
			   	 	<c:forEach items="${listResultMusic.mtr_list}" var="list">
					      <div class="col-lg-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <a href="#"><b>${list.mtr_subject}</b></a>
					            </h4>
					            <p class="card-text"><b>${list.mtr_hashtag}</b></p>
					            <p class="card-text">지역:<b>${list.mtr_area}</b></p>
					            <p class="card-text">금액:<b>${list.mtr_price}</b></p>
					            <p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>
					      		<input type="hidden" id="hidden_id" value="${listResultMusic.category_no}">
					          </div>
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
					      <div class="col-lg-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <a href="#"><b>${list.mtr_subject}</b></a>
					            </h4>
					            <p class="card-text"><b>${list.mtr_hashtag}</b></p>
					            <p class="card-text">지역:<b>${list.mtr_area}</b></p>
					            <p class="card-text">금액:<b>${list.mtr_price}</b></p>
					            <p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>
					      		<input type="hidden" id="hidden_id" value="${listResultCraft.category_no}">
					          </div>
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
					      <div class="col-lg-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <a href="#"><b>${list.mtr_subject}</b></a>
					            </h4>
					            <p class="card-text"><b>${list.mtr_hashtag}</b></p>
					            <p class="card-text">지역:<b>${list.mtr_area}</b></p>
					            <p class="card-text">금액:<b>${list.mtr_price}</b></p>
					            <p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>
					      		<input type="hidden" id="hidden_id" value="${listResultCooking.category_no}">
					          </div>
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
					      <div class="col-lg-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <a href="#"><b>${list.mtr_subject}</b></a>
					            </h4>
					            <p class="card-text"><b>${list.mtr_hashtag}</b></p>
					            <p class="card-text">지역:<b>${list.mtr_area}</b></p>
					            <p class="card-text">금액:<b>${list.mtr_price}</b></p>
					            <p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>
					      		<input type="hidden" id="hidden_id" value="${listResultMedia.category_no}">
					          </div>
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
					      <div class="col-lg-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <a href="#"><b>${list.mtr_subject}</b></a>
					            </h4>
					            <p class="card-text"><b>${list.mtr_hashtag}</b></p>
					            <p class="card-text">지역:<b>${list.mtr_area}</b></p>
					            <p class="card-text">금액:<b>${list.mtr_price}</b></p>
					            <p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>
					      		<input type="hidden" id="hidden_id" value="${listResultBeauty.category_no}">
					          </div>
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
					      <div class="col-lg-4 col-sm-6 portfolio-item">
					        <div class="card h-100">
					          <a href="${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
					          <div class="card-body">
					            <h4 class="card-title">
					              <a href="#"><b>${list.mtr_subject}</b></a>
					            </h4>
					            <p class="card-text"><b>${list.mtr_hashtag}</b></p>
					            <p class="card-text">지역:<b>${list.mtr_area}</b></p>
					            <p class="card-text">금액:<b>${list.mtr_price}</b></p>
					            <p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>
					      		<input type="hidden" id="hidden_id" value="${listResultBeverage.category_no}">
					          </div>
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
					  $(".row").append("<div class='col-lg-4 col-sm-6 portfolio-item'><div class='card h-100'> <a href='"+m.mtr_seq+"'><img class='card-img-top' src='../resources/mentoring_list_images/"+m.mtr_profile+"' alt=''></a><div class='card-body'><h4 class='card-title'><a href='#'><b>"+m.mtr_subject+"</b></a></h4><p class='card-text'><b>"+m.mtr_hashtag+"</b></p><p class='card-text'>지역:<b>"+m.mtr_area+"</b></p><p class='card-text'>금액:<b>"+m.mtr_price+"</b></p><p class='card-text'>평점:<b>"+m.mtr_jumsu+"</b></p></div></div></div>");  
			  		}
			  },
			  error: function(p1, p2, p3) {
				  console.log("p1: " + p1 + ", p2: " + p2 + ", p3: " + p3);
			  }
          });
        }
    });
  </script>
    
	
    <!-- Pagination 
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
	-->
	
  </div>  <!-- /.container -->
<%@include file="../footer.jsp"%>
