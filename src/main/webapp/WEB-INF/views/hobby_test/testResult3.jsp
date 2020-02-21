<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp" />
<!-- 적극적 성향 페이지 -->
<div class="container" align="center">
	<br/><br/>
	<div id="content">
	<div id="result_body" style="display:block">
	
	<div id="cooper_wrap">
	    <div id="cooperation_contents">
	        <h2>취미분석 결과</h2>
	        <p>ABOUT YOU</p>
	        <div style="font-size: 20px;background:#fccfe4; width:70%; height:90px; display: table-cell; text-align:center; vertical-align:middle;"><strong>매번 흥미로운 것에 도전하는 아웃도어형 </strong></div>
	        <br/>
	        <span class="line"></span>
	        <img src="../resources/hobbyTest/아웃도어형.png" style="width:300px; height:300px; margin-left:5px;">
	    </div>
	</div>                
	<div class="txt_wrap">
	    <div class="txt_content">
	        <span>
	            <p><font face="notosanscjkkr"><span style="font-size: 18.6667px; background-color: rgb(255, 255, 255); color: rgb(219, 5, 5);"><b>어쩔 수 없는 상황 때문에 어디에 콕 박혀 친구나 사람들과 어울리지 못하는 자신을 발견하는 것만큼 <br>당신을 더 속상하게 하는 게 없습니다.</b></span></font></p>
	            <p><font face="notosanscjkkr"><span style="font-size: 18.6667px;">
				웃음과 오락, 그리고 새로운 즐거움을 추구하는 곳이라면 어디를 가나 두 팔 벌려 환영받습니다. 당신에게 있어 다른 사람들과 함께 신나게 즐기는 것만큼 유쾌한 일도 없을 테니 말입니다. 당신은 또한 아끼는 사람들과 희로애락을 함께하며 주제와 상관없이 몇 시간이고 수다를 떨기도 합니다. </span></font></p>
	        </span>
	    </div>
	</div>
	<div class="box_wrap" style="border:3px dashed rgb(209,200,0);">
	
	    <div class="box_content">
	        <div class="box_content_txt" style="padding-top:30px;padding-bottom:30px;" >
	            <div><span style="font-family: notosanscjkkr; font-size: 14pt; color: rgb(37, 37, 37);"><b>종종 분위기 메이커 역할을 하기도 하는 이들은 단순한 인생의 즐거움이나 그때그때 상황에서 주는 일시적인 만족이 아닌 <br>타인과 사회적, 정서적으로 깊은 유대 관계를 맺음으로써 행복을 느낍니다.<br></b></span></div><div>
	            <span style="font-family: notosanscjkkr; font-size: 14pt; color: rgb(37, 37, 37);">당신은 인간관계나 사람의 감정, 혹은 생각과 관련하여 이들이 원하는 만족스러운 대답을 찾을 때까지 끊임없이 찾아 헤매고 다닐 것입니다. 그리고 진정 당신이 원하는 답을 찾는 그 날, 당신의 상상력이나 인간애, 그리고 용기는 어마어마한 빛을 발할 것입니다.</span></div><div><br></div>
	            <div><span style="font-family: notosanscjkkr; font-size: 14pt; color: rgb(37, 37, 37);"><b>지금 당장이라도 밖으로 뛰어나갈 준비가 된 당신.<br></b></span></div>
	            <div><span style="font-family: notosanscjkkr; font-size: 14pt; color: rgb(37, 37, 37);">등산, 여행등이 당신에게 적격. 이미 이런 취미를 갖고 있다면 암벽 등반 등 기술 요소를 가미한 레저 또는 스피드를 즐길수 있는 활동적은 스포츠로 전환을 생각해 봄직하다.
				<br/></span></div>
	        </div>
	    </div>
	</div>
	<br/><br/>
	<div style="font-size:20px; float:left; ;border-radius: 10px; background:#8fd2ff "><strong>당신과 비슷한 유형의 유명인</strong></div>
	<br/><br/>
	<div style="display:inline-block">
	<img src="../resources/hobbyTest/손흥민.jpg" style="width:300px; height:300px; margin-left:30px; border-radius: 150px;">
	<img src="../resources/hobbyTest/미하엘 슈마허.jpg" style="width:300px; height:300px;margin-left:30px; border-radius: 150px; ">
	<img src="../resources/hobbyTest/윌스미스.jpeg" style="width:300px; height:300px;margin-left:30px; border-radius: 150px; ">
	<br/><br/>
	<span style="float:left; margin-left:130px;" ><strong> 손흥민(축구선수)</strong></span>
	<span style=" margin-left:80px;" ><strong> 미하엘 슈마허(F1 전 챔피언) </strong></span>
	<span style="margin-left:130px;" ><strong> 윌 스미스(영화배우) </strong></span>
	</div>
	<br/><br/><br/>
	<div style="font-size:20px; float:left; ;border-radius: 10px; background:#ff8293 "><strong> 당신에게 추천하는 취미 </strong></div>
	<br/><br/>
	<div class="row">
	<c:forEach items="${mentoringList}" var="list">
		<div class="col-lg-4 col-sm-6 portfolio-item">
			<div class="card h-100">
	          <a href="#"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" alt=""></a>
	          <div class="card-body">
	            <h4 class="card-title">
	              <p><Heading1>${list.mtr_subject}</p> </h4>
	              <span class="badge badge-warning mb-2">${list.mtr_hashtag}</span><br/>
	             
	          	<span class="card-text"><span class="badge badge-primary">지역  :</span>&emsp;${list.mtr_area}</span> <br/><br/>
	          	<span class="card-text"><span class="badge badge-primary">가격  :</span>&emsp;${list.mtr_price}</span> <br/><br/>
	          			          		
	          		<c:choose>
	          			<c:when test="${list.mtr_jumsu eq 0}">
          				<div class="starRev">
					      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
						</div>	          			
	          			</c:when>
	          			<c:when test="${list.mtr_jumsu eq 1}">
          				<div class="starRev">
					      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
						</div>	          			
	          			</c:when>
	          			<c:when test="${list.mtr_jumsu eq 2}">
          				<div class="starRev">
					      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
						</div>	          			
	          			</c:when>
	          			<c:when test="${list.mtr_jumsu eq 3}">
          				<div class="starRev">
					      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
						</div>	          			
	          			</c:when>
	          			<c:when test="${list.mtr_jumsu eq 4}">
          				<div class="starRev">
					      	 <span class="badge badge-primary">평점:</span>&emsp;
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
						</div>	          			
	          			</c:when>
	          		    <c:when test="${list.mtr_jumsu eq 5}">
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
			          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}" class = "btn btn-outline-primary">멘토링 참여하기</a>
	          </div>
		</div>
	</c:forEach>
		
		
		
		
	</div>
	</div>
	<br/><br/>
	</div>
</div>
<%@include file="../footer.jsp"%>
