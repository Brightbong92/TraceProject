<%@page import="org.springframework.ui.Model"%>
<%@page import="tp.index.service.IndexServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />

  <link href="../css/flexslider.css" rel="stylesheet">

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <br/>
      <div class="carousel-inner" role="listbox" style="width:58%; height:400px; margin-left:21%" >
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="width:100%;height:400px;background-image: url('../index_images/메인8.png')">
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="width:100%;height:400px;background-image: url('../index_images/메인7.png')">
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="width:100%;height:400px;background-image: url('../index_images/메인11.png')">
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
      </div>
     
      
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

	<br/><br/><br/>
    <!-- Portfolio Section -->
    <div style="margin-bottom:10px;">
  <span style="font-size:17px;"><strong>HOT 이달의 인기 멘토링!</strong></span> 
  <a href='../mentoring/mentoring_list.do?sort=99'><span style="font-size:16px; float:right; color:black;">전체보기</span></a>
</div>

    <div class="row">
    <c:forEach items="${indexListResult.topMentoring}" var="mtr_top">
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="../mentoring/mentoringDetail.do?mtr_seq=${mtr_top.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${mtr_top.mtr_profile}" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <p style="font-size:15px;">${mtr_top.mtr_subject}</p> </h4>
              <span class="badge badge-warning mb-2">${mtr_top.mtr_hashtag} </span><br/>
             
          	<span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&emsp;${mtr_top.mtr_area}</span> <br/><br/>
          	<span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&emsp;${mtr_top.mtr_price}원</span> <br/><br/>
          	<c:choose>
          	
					          <c:when test="${mtr_top.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점  :</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
						      	 <span>
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								  </span>
								</div>
						      </c:when>
					          </c:choose>
					          </div>
					          <a href="../mentoring/mentoringDetail.do?mtr_seq=${mtr_top.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
          </div>
          </div>
          </c:forEach>
        </div>
        
        
      <br/><br/>
      <div style="margin-bottom:10px;">
	  <span style="font-size:17px;"><strong>NEW 따끈따끈 새로 나온 취미</strong></span>
	  <a href='../mentoring/mentoring_list.do?sort=99'><span style="font-size:16px; float:right; color:black;">전체보기</span></a>
	</div>
      
     <div class="row">
     <c:forEach items="${indexListResult.latestArticle}" var="latestArticle">
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
        
          <a href="../mentoring/mentoringDetail.do?mtr_seq=${latestArticle.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${latestArticle.mtr_profile}" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <p style="font-size:15px;">${latestArticle.mtr_subject}</p>
            </h4>
            <span class="badge badge-warning mb-2">${latestArticle.mtr_hashtag} </span><br/>
          	<span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&emsp;${latestArticle.mtr_area}</span> <br/><br/>
          	<span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&emsp;${latestArticle.mtr_price}원</span> <br/><br/>
          	<c:choose>
          	
					          <c:when test="${latestArticle.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${latestArticle.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점  :</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${latestArticle.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${latestArticle.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${latestArticle.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${latestArticle.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
          </div>
           <a href="../mentoring/mentoringDetail.do?mtr_seq=${latestArticle.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
           </div>
           </div>
          </c:forEach>
         
      </div>
      <br/><br/>
	  <div style="margin-bottom:10px;">
	  <span style="font-size:17px;"><strong>가볍게 시작하는 취미</strong></span>
	  <a href='../mentoring/mentoring_list.do?sort=99'><span style="font-size:16px; float:right; color:black;">전체보기</span></a>
	  </div> 
	  
	  <div class="row">
     <c:forEach items="${indexListResult.cheapArticle}" var="cheapArticle">
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
        
          <a href="../mentoring/mentoringDetail.do?mtr_seq=${cheapArticle.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${cheapArticle.mtr_profile}" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <p style="font-size:15px;">${cheapArticle.mtr_subject}</p>
            </h4>
            <span class="badge badge-warning mb-2">${cheapArticle.mtr_hashtag} </span><br/>
          	<span class="badge badge-primary">지역  :</span><span class="card-text" style="font-size:14px;">&emsp;${cheapArticle.mtr_area}</span> <br/><br/>
          	<span class="badge badge-primary">가격  :</span><span class="card-text" style="font-size:14px;">&emsp;${cheapArticle.mtr_price}원</span> <br/><br/>
          	<c:choose>
          	
					          <c:when test="${cheapArticle.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${cheapArticle.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점  :</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${cheapArticle.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${cheapArticle.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${cheapArticle.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${cheapArticle.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
          </div>
           <a href="../mentoring/mentoringDetail.do?mtr_seq=${cheapArticle.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
           </div>
           </div>
          </c:forEach>
         
      </div>
    <!-- /.row -->
	<br/><br/>
    <!-- Features Section -->
    <div class="row">
     <c:forEach items="${indexListResult.topMentoring}" var="mtr_top" end="0">
      <div class="col-lg-6">
        <div class="alert alert-danger" role="alert">
		  <strong>이달의 멘토링</strong> /이번 달 가장 인기있는 멘토링을 소개합니다 
		</div>
        <ul>
          <li style="font-size:20px;">
            <strong>멘토링 : ${mtr_top.mtr_subject}</strong>
          </li>
          <li><span class="badge badge-primary">지역  : ${mtr_top.mtr_area}</span></li>
          <li><span class="badge badge-warning mb-2">${mtr_top.mtr_hashtag} </span></li>
          <li><c:choose>
          	
					          <c:when test="${mtr_top.mtr_jumsu eq 0}">
					            <div class="starRev">
					            <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 1}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점  :</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 2}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 3}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 4}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${mtr_top.mtr_jumsu eq 5}">
						      	 <div class="starRev">
						      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose></li>
        </ul>
        <p>${mtr_top.mtr_content}</p>
      </div>
      <div class="col-lg-6">
        <a href="#"><img class="img-flud" style="width:500px; height:400px;"src="../resources/mentoring_list_images/${mtr_top.mtr_profile}" alt=""></a>
      </div>
      </c:forEach>
    </div>
    <!-- /.row -->
    <hr>
    
    <div class="hf-thumb-wrap">
	<div class="hf-thumb-tit-wrap">
	<div class="hf-thumb-tit" align="center" style="font-size:25px;"><strong>#Find Your Hobby</strong></div>
	<div class="hf-thumb-txt" align="center">후기 사진 모음</div>
	<br/>
	<div>
		<c:forEach items="${indexListResult.reviewFiles}" var="files">
			<a href="../review/reviewList.do?mtr_seq=${files.mtr_seq}&cp=1"><img src="../resources/mentoring_review_images/${files.mtrrvf_fname}" style="width:120px; height:120px; margin:5px"  alt=""></a>
		</c:forEach>
	</div>
    </div>
    
    
	<!-- button that opens the modal -->
<!-- the modal -->
	<br/>
  </div>
</div>
  <!-- /.container -->
<%@include file="../footer.jsp"%>

