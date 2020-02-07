<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.MentoringListResult"%>
<jsp:include page="../top.jsp" />


  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">멘토링 리스트 :
      <small>검색한 멘토링</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/">Home</a>
      </li>
      <li class="breadcrumb-item active">Portfolio 2</li>
    </ol>

	<c:if test="${!empty mentoringListResultSearch}">
    <div class="row">
    <c:forEach items="${mentoringListResultSearch.mtr_list}" var="list">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}"><img class="card-img-top" src="../resources/mentoring_list_images/${list.mtr_profile}" width="700" height="300" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="../mentoring/mentoringDetail.do?mtr_seq=${list.mtr_seq}">${list.mtr_subject}</a>
            </h4>
				<p class="card-text"><span style="font-size:1.0em" class="badge badge-warning mb-2"><b>${list.mtr_hashtag}</b></span></p>
				<p class="card-text">지역:<b>${list.mtr_area}</b></p>
				<p class="card-text">금액:<b>${list.mtr_price}원</b></p>            
					          <c:choose>
					          <c:when test="${list.mtr_jumsu eq 0}">
					            <div class="starRev">
								  <span class="starR">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 1}">
						      	 <div class="starRev">
								  <span class="starR on">별1</span>
								  <span class="starR">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 2}">
						      	 <div class="starRev">
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 3}">
						      	 <div class="starRev">
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 4}">
						      	 <div class="starRev">
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR">별5</span>
								</div>
						      </c:when>
						      <c:when test="${list.mtr_jumsu eq 5}">
						      	 <div class="starRev">
								  <span class="starR on">별1</span>
								  <span class="starR on">별2</span>
								  <span class="starR on">별3</span>
								  <span class="starR on">별4</span>
								  <span class="starR on">별5</span>
								</div>
						      </c:when>
					          </c:choose>
			    <!--<p class="card-text">평점:<b>${list.mtr_jumsu}</b></p>-->
          </div>
        </div>
      </div>
    </c:forEach>
    </div><!-- /.row -->
	    <c:if test="${empty mentoringListResultSearch.mtr_list}">
	        <div align="center">찾으시는 멘토링이 없습니다.</div>
	    </c:if>
    </c:if>
    
    <!-- 페이징  -->
    <div class="page_wrap">
    <div class="page_nation">
<%
		MentoringListResult lr = (MentoringListResult)request.getAttribute("mentoringListResultSearch");
%>
    <c:if test="${!empty mentoringListResultSearch.totalCount}">
<%
		int pageCount = lr.getTotalPageCount();
		int pageBlock = 3;
		int startPage = ((lr.getCurrentPage() - 1) / pageBlock) * pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		if(startPage > pageBlock) {
%>
		<a class="arrow pprev" href="searchList.do?cp=1&word=<%=lr.getCategory_no()%>"></a> 
		<a class="arrow prev" href="searchList.do?cp=<%=lr.getCurrentPage() - 1%>&word=<%=lr.getCategory_no()%>"></a>
<%
		}
%>
    <c:forEach begin="<%=startPage%>" end="<%=endPage%>" var ="i">
   		<c:choose>
	   		<c:when test="${i == mentoringListResultSearch.currentPage}">
				<a class="active" href="searchList.do?cp=${i}&word=<%=lr.getCategory_no()%>">${i}</a>&nbsp;
			</c:when>
			<c:otherwise>
				<a href="searchList.do?cp=${i}&word=<%=lr.getCategory_no()%>">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
<%
		if(endPage < pageCount) {
%>
		<a class="arrow next" href="searchList.do?cp=<%=startPage + 3 %>&word=<%=lr.getCategory_no()%>"></a>
		<a class="arrow nnext" href="searchList.do?cp=<%=pageCount%>&word=<%=lr.getCategory_no()%>"></a>
<%
		}
%>
	 </c:if>
	 	</div><!-- .page_nation -->
	 </div><!-- .page_wrap -->

  </div><!-- /.container -->

<%@include file="../footer.jsp"%>
