<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.MentoringQAVo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../top.jsp" %>

  <!-- Page Content -->
  <div class="container" >

    <!-- Page Heading/Breadcrumbs -->
    
    <p style="font-size:25px;margin-top:40px;">${listResult.mtr_subject}  - Q & A 
        <c:if test="${!empty loginUser}">
        <div style="float:right;">
        <button class="btn btn-primary" onclick="goQAWriteForm()">문의하기</button>
        </div>
        </c:if>
    </p>
<%-- 
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item">
      	<input type="hidden" id="mtrseq" value="${listResult.mtr_seq}"/>
        <a href="../mentoring/mentoringDetail.do?mtr_seq=${listResult.mtr_seq}">${listResult.mtr_subject}:링크</a>
      </li>
      <li class="breadcrumb-item active">질문게시판</li>
    </ol>
--%>
    <!-- Blog Post -->
    <c:if test="${!empty listResult.mtr_qa_list}">
    
    <c:forEach items="${listResult.mtr_qa_list}" var="qa_list">
    
    
    
		<br/><br/>
    <!--  <div class="card mb-4">-->
    <div>
      <div class="card-body">
        <div class="row">
          <img class="d-flex mr-3 rounded-circle" src="../resources/profileImage/${qa_list.mem_profile}" alt="" width="60px" height=60px>
            <div class="mt-0" style="font-size:15px;"><strong>${qa_list.mem_nick}</strong></div> &nbsp;&nbsp;&nbsp;&nbsp; <div style="color:gray;"><fmt:formatDate value="${qa_list.mtrqa_rdate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
        </div> 
        <div><!-- class="col-lg-6" -->
            <p class="card-text" style="margin-left:80px;">${qa_list.mtrqa_content}</p>
        </div>
      </div>

      
                                                                 
     <c:if test="${!empty listResult.mtr_qa_reply_list}">                                                  
      
     <c:forEach items="${listResult.mtr_qa_reply_list}" var="qa_reply_list">
     	<c:forEach items="${qa_reply_list}" var="list">
		     <c:if test="${list.mtrqa_seq eq qa_list.mtrqa_seq}">
		     	  <c:set var="flag" value="true"/>
			      <div class="card-footer text-muted" style="height:150px;">
			      <img style="float:left; margin-left:3%" class="d-flex mr-3 rounded-circle" src="../resources/profileImage/${list.mem_profile}" alt="" width="50px" height=50px>
			      <div class="mt-0" ><strong>${list.mem_nick}</strong> &nbsp; <fmt:formatDate value="${list.mtrqarp_rdate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			      <br/>
				  &nbsp;&nbsp;<img src="../images/reply_arrow.png" width="15" height="15"> &nbsp;${list.mtrqarp_content}
			      </div>  
			 </c:if>
    	 </c:forEach>
    </c:forEach>
    </c:if>
    
    
     <c:if test="${flag ne 'true'}">
   <div class="card-footer text-muted" style="height:50px; text-align:center">담당 멘토 답변 대기중..</div>
    </c:if>
    

       <c:if test="${listResult.mem_email eq loginUser.mem_email}">
        <!-- 답변자 =답변달기 Form -->
        <div class="card my-4">
          <h5 class="card-header">답변폼</h5>
          <div class="card-body">
          <form name="f" action="../qa/qaReplyRegister.do?mtrqa_seq=${qa_list.mtrqa_seq}" method="post">
              <div class="form-group">
                <textarea name="mtrqarp_content" class="form-control" rows="3"></textarea>
              </div>
              <input type="hidden" name="mtr_seq" value="${listResult.mtr_seq}"/>
              <!--  
              <button type="button" class="btn btn-primary" value="${qa_list.mtrqa_seq}" onclick="qaReplyRegi(this)">답변등록</button>
              -->
              	<button class="btn btn-primary">답변등록</button>
          </form>
          </div>
        </div>
        </c:if>
    </div>
    
    </c:forEach>
    	
	</c:if>
    <c:if test="${empty listResult.mtr_qa_list}">
   		<div align='center'>등록된 질문이 없습니다.</div>
    </c:if>
<br/><br/>
<c:if test="${!empty listResult.totalPageCount}"> <!-- 토탈페이지가 비어있지않을경우 -->
<!-- 페이징 -->    
<div class="board_paging" align="center">
<button  onclick="javascript:location.href='../qa/qaList.do?cp=1&mtr_seq=${listResult.mtr_seq}'">&#x000AB;</button>
<c:if test="${listResult.currentPage ne 1}">
<button  onclick="javascript:location.href='../qa/qaList.do?cp=${listResult.currentPage-1}&mtr_seq=${listResult.mtr_seq}'">&#x02039;</button>
</c:if>
<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
	<c:choose>
		<c:when test="${i==listResult.currentPage}">
		<button onclick="javascript:location.href='../qa/qaList.do?cp=${i}&mtr_seq=${listResult.mtr_seq}'" class="on"><strong>${i}</strong></button>
		</c:when>
		<c:otherwise>
		<button onclick="javascript:location.href='../qa/qaList.do?cp=${i}&mtr_seq=${listResult.mtr_seq}'">${i}</button>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${listResult.currentPage ne listResult.totalPageCount}">
		<button  onclick="javascript:location.href='../qa/qaList.do?cp=${listResult.currentPage+1}&mtr_seq=${listResult.mtr_seq}'">&#x0203A;</button>
	</c:if>
		<button  onclick="javascript:location.href='../qa/qaList.do?cp=${listResult.totalPageCount}&mtr_seq=${listResult.mtr_seq}'">&#x000BB;</button>
	</div>
</c:if>
	<br/><br/>
  </div>
  <!-- /.container -->

<script>
	function goQAWriteForm(){
		location.href="../qa/qaWriteForm.do?mtr_seq=${listResult.mtr_seq}";
	}

</script>
  
<%@ include file="../footer.jsp" %>
