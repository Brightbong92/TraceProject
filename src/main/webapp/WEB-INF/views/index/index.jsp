<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('../index_images/와인.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('../index_images/카메라.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('../index_images/와인.jpg')">
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
    <h2>★추천★ 인기있는 취미</h2>

    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">멘토링명</a>
            </h4>
            <p class="card-text">멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 </p> <br/>
          	<span class="card-text">지역명</span> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          	<span class="card-text">20000원</span>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Two</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Three</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
          </div>
        </div>
      </div>
      
     </div>
      
     <h2>NEW 따끈따끈 새로 나온 취미</h2>
     <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">멘토링명</a>
            </h4>
            <p class="card-text">멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 멘토링 소개 </p> <br/>
          	<span class="card-text">지역명</span> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          	<span class="card-text">20000원</span>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Five</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Six</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-6">
        <h2>이달의 멘토링</h2>
        <p>이번 달 가장 인기있는 멘토링을 소개합니다 :</p>
        <ul>
          <li style="font-size:20px;">
            <strong>멘토링 : ${bestMentoring.bestMentoringInfo.mtr_subject}</strong>
          </li>
          <li>멘토 닉네임 : ${bestMentoring.bestMentoringMentor.mem_nick}</li>
          <li>지역 : ${bestMentoring.bestMentoringInfo.mtr_area}</li>
          <li>평점 : ${bestMentoring.bestMentoringInfo.mtr_jumsu}</li>
          <li>${bestMentoring.bestMentoringInfo.mtr_hashtag}</li>
        </ul>
        <p>${bestMentoring.bestMentoringInfo.mtr_content}</p>
      </div>
      <div class="col-lg-6">
        <a href="#"><img class="img-flud" style="width:600px; height:450px;"src="../resources/mentoring_list_images/${bestMentoring.bestMentoringInfo.mtr_profile}" alt=""></a>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <div class="row mb-4">
      <div class="col-md-8">
        <p>멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 멘토 신청 </p>
      </div>
      <div class="col-md-4">
        <a class="btn btn-lg btn-secondary btn-block" href="../mentor/mentor_apply.do">멘토 신청하기</a>
      </div>
    </div>
    
    <hr>
    
    <div class="hf-thumb-wrap">
	<div class="hf-thumb-tit-wrap">
	<div class="hf-thumb-tit" align="center" style="font-size:25px;"><strong>#Find Your Hobby</strong></div>
	<div class="hf-thumb-txt" align="center">후기 사진 모음</div>
	<br/>
	<div>후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 후기 사진 들어가 </div>
	</div>
	
	<br/>
  </div>
</div>
  <!-- /.container -->
<%@include file="../footer.jsp"%>

