<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.MentoringQAVo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../top.jsp" %>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <p style="font-size:25px;margin-top:40px;" class="mt-4 mb-3"><a href="../mentoring/mentoringDetail.do?mtr_seq=${listResult.mtr_seq}">${listResult.mtr_subject}</a> - 후기
    </p>
    <%-- 
    <button class="btn btn-info" onclick="goReviewWriteForm()">리뷰하기</button>
    --%>
    <br/>

    
<%-- 
    <div>
    <button onclick="location.href='../review/reviewWriteForm.do?mtr_seq=${listResult.mtr_seq}'">후기소켓통신테스트</button>
    </div>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#">Home</a>
      </li>
      <li class="breadcrumb-item">
      	<input type="hidden" id="mtrseq" value="${listResult.mtr_seq}"/>
        <a href="../mentoring/mentoringDetail.do?mtr_seq=${listResult.mtr_seq}">${listResult.mtr_subject}:링크</a>
      </li>
      <li class="breadcrumb-item active">후기게시판</li>
    </ol>
--%>
    <!-- Blog Post -->
    
    
    <c:if test="${!empty listResult.mtr_review_list}">
    <c:forEach items="${listResult.mtr_review_list}" var="review" varStatus="status">

    <div><!-- 전체 -->
    <!-- 후기 -->
      <div class="card-body">
        <div class="row">
          <img class="d-flex mr-3 rounded-circle" src="../resources/profileImage/${review.mem_profile}" alt="" width="50px" height=50px>
			
           <div class="mt-0"><strong>${review.mem_nick}</strong> </div>&nbsp;&nbsp;&nbsp;&nbsp;
           <div style="color:gray;"> 
           <fmt:formatDate value="${review.mtrrv_rdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
           </div>&nbsp;&nbsp;&nbsp;&nbsp;
	           <c:choose>
	           <c:when test="${review.mtrrv_jumsu eq 0}">
	            <div class="starRev">
				  <span class="starK">별1</span>
				  <span class="starK">별2</span>
				  <span class="starK">별3</span>
				  <span class="starK">별4</span>
				  <span class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${review.mtrrv_jumsu eq 1}">
	            <div class="starRev">
				  <span class="starK on">별1</span>
				  <span class="starK">별2</span>
				  <span class="starK">별3</span>
				  <span class="starK">별4</span>
				  <span class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${review.mtrrv_jumsu eq 2}">
	            <div class="starRev">
				  <span class="starK on">별1</span>
				  <span class="starK on">별2</span>
				  <span class="starK">별3</span>
				  <span class="starK">별4</span>
				  <span class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${review.mtrrv_jumsu eq 3}">
	            <div class="starRev">
				  <span class="starK on">별1</span>
				  <span class="starK on">별2</span>
				  <span class="starK on">별3</span>
				  <span class="starK">별4</span>
				  <span class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${review.mtrrv_jumsu eq 4}">
	            <div class="starRev">
				  <span class="starK on">별1</span>
				  <span class="starK on">별2</span>
				  <span class="starK on">별3</span>
				  <span class="starK on">별4</span>
				  <span class="starK">별5</span>
	           </div>
	           </c:when>
	          <c:when test="${review.mtrrv_jumsu eq 5}">
	            <div class="starRev">
				  <span class="starK on">별1</span>
				  <span class="starK on">별2</span>
				  <span class="starK on">별3</span>
				  <span class="starK on">별4</span>
				  <span class="starK on">별5</span>
	           </div>
	           </c:when>
	          </c:choose>
	          <c:choose>
	          <c:when test="${loginUser.mem_email eq 'admin'}">
	          <a style="cursor:pointer;" mtrrv_seq="${review.mtrrv_seq}" onclick="reviewDel(this);">삭제</a>
	          </c:when>
	          <c:when test="${loginUser.mem_email eq review.mem_email}">
	          <a style="cursor:pointer;" mtrrv_seq="${review.mtrrv_seq}" onclick="reviewDel(this);">삭제</a>
	          </c:when>
	          </c:choose>
	          <img src="../resources/images/reportIcon2.jpg" style="margin-left:610px;width:30px;height:30px;cursor:pointer;" mtrrv_seq="${review.mtrrv_seq} "mem_email="${review.mem_email}" onclick="goReportForm(this);"/>
          </div><!-- .row -->
       
        <div><!-- class="col-lg-6" -->
            <p class="card-text" style="margin-left:50px;">${review.mtrrv_content}</p><!-- 내용 -->
            <!-- 파일 -->
            <div style="float:left;">
           	 <c:forEach items="${listResult.mtr_review_file_list}" var="review_file_list"> 
           	 	  <c:forEach items="${review_file_list}" var="review_file">
	            	  <c:if test="${review.mtrrv_seq eq review_file.mtrrv_seq}">
		                 <a style="cursor:pointer;" onClick="window.open('../resources/mentoring_review_images/${review_file.mtrrvf_fname}','_blank','width=700, height=700, location=no, scrollbars=yes, status=no')">
		                 &nbsp;&nbsp;<img src="../resources/mentoring_review_images/${review_file.mtrrvf_fname}" alt="" width="110px" height="110px"/>
		                 </a>
	          		  </c:if>
         		  </c:forEach>
            </c:forEach>
            </div>
       </div>
     </div>
     <div style="margin-bottom:10px;margin-right:5px;"align="right">도움이 됐어요 : <b>${review.mtrrv_likecnt} </b><a idx="${review.mtrrv_seq}" onclick="likePlus(this)"><img src="../resources/images/likeButton.png" alt="" width="30px" height="30px" id="likeBtn" style="margin-bottom:13px;cursor:pointer;"/></a></div>
     <!-- 후기내용들까지 -->
    
      <br/><br/><br/>
    <!-- 답변 -->
	<c:forEach items="${listResult.mtr_review_reply_list}" var="review_reply_list">
		<c:forEach items="${review_reply_list}" var="review_reply">
		    <c:if test="${review.mtrrv_seq eq review_reply.mtrrv_seq}">
			    <div class="card-footer text-muted">
			      <img style="float:left;" class="d-flex mr-3 rounded-circle" src="../resources/profileImage/${review_reply.mem_profile}" alt="" width="50px" height=50px>
			       <div class="mt-0"> ${review_reply.mem_nick} / <fmt:formatDate value="${review_reply.mtrrvrp_rdate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			      <br/>
				  <img src="../images/reply_arrow.png" width="15" height="15">${review_reply.mtrrvrp_content}
			      </div>
		    </c:if>
	   	</c:forEach>
	</c:forEach> 
	
    	<c:if test="${listResult.mem_email eq loginUser.mem_email}">
        <!-- 답변자 =답변달기 Form -->
	        <div class="card my-4">
	          <h5 class="card-header">후기답변폼</h5>
	          <div class="card-body">
	          <form id="f${status.count}" name="f${status.count}" action="../review/reviewReplyRegister.do?mtrrv_seq=${review.mtrrv_seq}" method="post">
	              <div class="form-group">
	                <textarea name="mtrrvrp_content" class="form-control" rows="3"></textarea>
	              </div>
	              <input type="hidden" name="mtr_seq" value="${listResult.mtr_seq}"/>
	              <button type="button" form_name="f${status.count}" mem_email="${review.mem_email}" onclick='rvReplyRegi(this);' class="btn btn-primary">답변등록</button>
	          </form>
	          </div>
	        </div>
		</c:if>
    	<hr>
	</div><!-- .card mb-4  -->
	</c:forEach>
	</c:if>
	
    <c:if test="${empty listResult.mtr_review_list}">
   		<div align='center' style="height:452px; margin-top:130px;">등록된 후기가 없습니다.</div>
    </c:if>
	
 
<c:if test="${!empty listResult.totalPageCount}"> <!-- 토탈페이지가 비어있지않을경우 -->
<!-- 페이징 -->    
<div class="board_paging" align="center">
<button  onclick="javascript:location.href='../review/reviewList.do?cp=1&mtr_seq=${listResult.mtr_seq}'">&#x000AB;</button>
<c:if test="${listResult.currentPage ne 1}">
<button  onclick="javascript:location.href='../review/reviewList.do?cp=${listResult.currentPage-1}&mtr_seq=${listResult.mtr_seq}'">&#x02039;</button>
</c:if>
<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
	<c:choose>
		<c:when test="${i==listResult.currentPage}">
		<button onclick="javascript:location.href='../review/reviewList.do?cp=${i}&mtr_seq=${listResult.mtr_seq}'" class="on"><strong>${i}</strong></button>
		</c:when>
		<c:otherwise>
		<button onclick="javascript:location.href='../review/reviewList.do?cp=${i}&mtr_seq=${listResult.mtr_seq}'">${i}</button>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${listResult.currentPage ne listResult.totalPageCount}">
		<button  onclick="javascript:location.href='../review/reviewList.do?cp=${listResult.currentPage+1}&mtr_seq=${listResult.mtr_seq}'">&#x0203A;</button>
	</c:if>
		<button  onclick="javascript:location.href='../review/reviewList.do?cp=${listResult.totalPageCount}&mtr_seq=${listResult.mtr_seq}'">&#x000BB;</button>
	</div>
</c:if>
<br/><br/>

  </div> <!-- /.container -->
<script>
	function goReviewWriteForm(){
		location.href="../review/reviewWriteForm.do?mtr_seq=${listResult.mtr_seq}";
	}

	$(document).ready(function(){
		$("#likeBtn").on('click',function(){
			//alert("좋아요누름");
		});
	});
	
	function rvReplyRegi(obj) {
		var mem_email = $(obj).attr("mem_email");
		var form_name = $(obj).attr("form_name");
		if(socket.readyState !== 1) return;
			socket.send("rvrp,${listResult.mtr_seq},"+mem_email);
			document.getElementById(form_name).submit();
	}
	
	function likePlus(obj) {
		//alert($(obj).attr("idx"));
		var mem_email = '<c:out value="${loginUser.mem_email}"/>';
		var mtrrv_seq = $(obj).attr("idx");
		var mtr_seq = '<c:out value="${listResult.mtr_seq}"/>';
		if(mem_email == "") {
			alert("로그인 후 이용 가능합니다.");
			location.href="../login/login.do";
			return false;
		}else{
			location.href="../review/likePlus.do?mem_email="+mem_email+"&mtrrv_seq="+mtrrv_seq+"&mtr_seq="+mtr_seq;
		}
	}
	
	function goReportForm(obj) {
		if('${loginUser.mem_email}' == '') {
			alert("로그인 후 신고 가능합니다.");
			location.href="../login/login.do"
			return;
		}
		var rep_content = prompt("신고 내용을 입력해주세요.");
		if(rep_content == null || rep_content == '') {
			alert("내용을 입력해주세요.");
			return;
		}else {
			var mtrrv_seq = $(obj).attr("mtrrv_seq");
			var rep_receiver = $(obj).attr("mem_email");
			var rep_caller = "${loginUser.mem_email}";

			var report = {
					mtrrv_seq: mtrrv_seq,
					rep_receiver: rep_receiver,
					rep_caller: rep_caller,
					rep_content: rep_content
					};
			$.ajax({
				url:"../review/rvReport.do",
				data: JSON.stringify(report),
				contentType:"application/json",
				type:"POST",
				success: function(data) {
					//console.clear();console.log("성공");
					if(data == "duplicate") {
						alert("이미 신고가 반영되었습니다.");
						return false;
					}else {
						alert("신고가 반영되었습니다.");
						return false;
					}
					
				},error: function(err) {
					//console.clear();console.log("실패");
				}
			});	
		}
	}
	
	function reviewDel(obj){
		var mtrrv_seq = $(obj).attr("mtrrv_seq");
		//alert(mtrrv_seq);
		location.href="../review/reviewDel.do?mtr_seq=${listResult.mtr_seq}&mtrrv_seq="+mtrrv_seq;
	}
</script>

<%@ include file="../footer.jsp" %>
