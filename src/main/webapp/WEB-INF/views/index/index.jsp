<%@page import="org.springframework.ui.Model"%>
<%@page import="tp.index.service.IndexServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />

  <link href="../css/flexslider.css" rel="stylesheet">
  <script src="../js/jquery.flexslider.js"></script>
  


  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('../index_images/main.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('../index_images/main1.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('../index_images/main2.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

	<br/>
    <!-- Portfolio Section -->
    <div class="alert alert-info" role="alert">
  <strong>이달의 인기 멘토링!</strong>
</div>

    <div class="row">
    <c:forEach items="${bestMentoring.topMentoring}" var="mtr_top">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="../resources/mentoring_list_images/${mtr_top.mtr_profile}" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <p><Heading1>${mtr_top.mtr_subject}</p> </h4>
              <span class="badge badge-warning mb-2">${mtr_top.mtr_hashtag} </span><br/>
             
          	<span class="card-text"><span class="badge badge-primary">지역  :</span>&emsp;${mtr_top.mtr_area}</span> <br/><br/>
          	<span class="card-text"><span class="badge badge-primary">가격  :</span>&emsp;${mtr_top.mtr_price}원</span> <br/><br/>
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
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
					          </div>
					          <a href="#" class = "btn btn-outline-primary">멘토링 참여하기</a>
          </div>
          </div>
          </c:forEach>
        </div>
        
        
      
      
      <div class="alert alert-success" role="alert">
		  <strong>NEW 따끈따끈 새로 나온 취미</strong>
		</div>
     <div class="row">
     <c:forEach items="${bestMentoring.latestArticle}" var="latestArticle">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
        
          <a href="#"><img class="card-img-top" src="../resources/mentoring_list_images/${latestArticle.mtr_profile}" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <p>${latestArticle.mtr_subject}</p>
            </h4>
            <span class="badge badge-warning mb-2">${latestArticle.mtr_hashtag} </span><br/>
          	<span class="card-text"><span class="badge badge-primary">지역  :</span>&emsp;${latestArticle.mtr_area}</span> <br/><br/>
          	<span class="card-text"><span class="badge badge-primary">가격  :</span>&emsp;${latestArticle.mtr_price}원</span> <br/><br/>
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
           <a href="#" class="btn btn-secondary">멘토링 참여하기</a>
           </div>
           </div>
          </c:forEach>
         
      </div>
      
    <!-- /.row -->

    <!-- Features Section -->
    <div class="row">
     <c:forEach items="${bestMentoring.topMentoring}" var="mtr_top" end="0">
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

    <!-- Call to Action Section -->
    <div class="row mb-4" style="text-align:center" align="center">
		<div class="hf-thumb-tit" style="font-size:25px; text-align:center; width:100%">
		<div class="alert alert-warning" role="alert">
		  <strong>취향이 통하는 사람들의 모임 발자취에 멘토로 참여하세요</strong>
		</div>
		</div>
							<br/>
							<p style="text-align:center; width:100%">
							<br/>

							다른 사람과 좋아하는 것을 나누는 일, 생각보다 더 멋지고 신나는 일입니다. <br/><br/>

							눈을 맞추고, 우리안의 이야기에 온전히 집중하는 시간. 이런 순간들을, 우리는 얼마나 기다려 왔던가요? <br/><br/>

							발자취에서는 이런 일들이 실제로 가능합니다. 그리고 그 중심에는 발자취의 멘토가 있습니다. <br/><br/>



							발자취의 멘토는 우리가 좋아하는 것들에 더욱 가까이 다가가기 위해 필요한 경험의 지도를 그리는 사람입니다. <br/><br/>

							내가 가진 것들을 일방적으로 전달하기 보다는 함께 보고 느끼고 즐기며 우리 각자가 자신만의 답을 찾을 수 있도록 돕습니다.<br/> <br/>

							그렇게 우리는 한 시즌 동안 서로를 통해 함께 성장합니다. <br/><br/>



							그러나 선뜻 리더로 나서기에는 망설여지는 것들이 있죠. <br/><br/>

							어떤 것을 주제로, 어떻게 진행해야 하는지, 그리고 사람들은 어떻게 모을 수 있는지. <br/><br/>

							그런 걱정은 잠시 접어두고, 우리는 우리가 가진 것들에만 집중해 봅시다. <br/><br/>

							당신이 가진 이야기와 경험을 들려주세요. 그 밖에 나머지는 발자취가 함께 고민하겠습니다.  </p>
							</div>
      <a class="btn btn-lg btn-secondary btn-block" href="../mentor/mentor_apply.do">멘토 신청하기</a>
    </div>
    
    <hr>
    
    <div class="hf-thumb-wrap">
	<div class="hf-thumb-tit-wrap">
	<div class="hf-thumb-tit" align="center" style="font-size:25px;"><strong>#Find Your Hobby</strong></div>
	<div class="hf-thumb-txt" align="center">후기 사진 모음</div>
	<br/>
	<div>후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 </div>
	<!-- button that opens the modal -->
<!-- the modal -->
	
	<br/>
  </div>
</div>
</div>
  <!-- /.container -->
<%@include file="../footer.jsp"%>

