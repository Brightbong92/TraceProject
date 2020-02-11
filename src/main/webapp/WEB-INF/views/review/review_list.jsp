<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.MentoringQAVo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../top.jsp" %>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${listResult.mtr_subject}
      <small></small>
    </h1>

<%-- 
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
    <c:forEach items="${listResult.mtr_review_list}" var="review">

    <div class="card mb-4"><!-- 전체 -->

    <!-- 후기 -->
      <div class="card-body">
        <div class="row">
          <img class="d-flex mr-3 rounded-circle" src="../resources/profileImage/${review.mem_profile}" alt="" width="50px" height=50px>

           <div class="mt-0">${review.mem_nick} / 
           <fmt:formatDate value="${review.mtrrv_rdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
           </div>
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
          </div><!-- .row -->
       
        <div><!-- class="col-lg-6" -->
            <p class="card-text" style="margin-left:50px;">${review.mtrrv_content}</p><!-- 내용 -->
            <!-- 파일 -->
            <div style="float:left;">
           	 <c:forEach items="${listResult.mtr_review_file_list}" var="review_file_list"> 
           	 	  <c:forEach items="${review_file_list}" var="review_file">
	            	  <c:if test="${review.mtrrv_seq eq review_file.mtrrv_seq}">
		                 <a style="cursor:pointer;" onClick="window.open('../resources/mentoring_review_images/${review_file.mtrrvf_fname}','_blank','width=700, height=700, location=no, scrollbars=yes, status=no')">
		                 <img src="../resources/mentoring_review_images/${review_file.mtrrvf_fname}" alt="" width="120px" height="120px"/>
		                 </a>
	          		  </c:if>
         		  </c:forEach>
            </c:forEach>
            </div>
       </div>
     </div>
     <div style="margin-bottom:10px;margin-right:5px;"align="right">도움이됐어요 :<b>${review.mtrrv_likecnt}</b><a idx="${review.mtrrv_seq}" onclick="likePlus(this)"><img src="../resources/images/likeButton.png" alt="" width="30px" height="30px" id="likeBtn" style="margin-bottom:13px;"/></a></div>
     <!-- 후기내용들까지 -->
    
      
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
	          <form name="f" action="../review/reviewReplyRegister.do?mtrrv_seq=${review.mtrrv_seq}" method="post">
	              <div class="form-group">
	                <textarea name="mtrrvrp_content" class="form-control" rows="3"></textarea>
	              </div>
	              <input type="hidden" name="mtr_seq" value="${listResult.mtr_seq}"/>
	              <button class="btn btn-primary">답변등록</button>
	          </form>
	          </div>
	        </div>
		</c:if>
    
	</div><!-- .card mb-4  -->
	</c:forEach>
	</c:if>
	
    <c:if test="${empty listResult.mtr_review_list}">
   		<div align='center'>등록된 후기가 없습니다.</div>
    </c:if>
<!--  
    <c:if test="${empty listResult.mtr_review_list}">
   		<div align='center'>등록된 후기가 없습니다.</div>
    </c:if>
-->
 
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
	
	
	function likePlus(obj) {
		//alert($(obj).attr("idx"));
		var mem_email = '<c:out value="${loginUser.mem_email}"/>';
		var mtrrv_seq = $(obj).attr("idx");
		var mtr_seq = '<c:out value="${listResult.mtr_seq}"/>';
		if(mem_email == "") {
			alert("로그인 후 이용 가능합니다.");
			return false;
		}else{
			location.href="../review/likePlus.do?mem_email="+mem_email+"&mtrrv_seq="+mtrrv_seq+"&mtr_seq="+mtr_seq;
		}
			
	}
	
	
</script>

<%@ include file="../footer.jsp" %>
