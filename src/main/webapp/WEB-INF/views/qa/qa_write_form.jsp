<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp"/>


  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${mtr_subject}
      <small>: 질문</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#">Home</a>
      </li>
      <li class="breadcrumb-item active">Contact</li>
    </ol>

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <form name="sentMessage" id="qaForm" action="/qa/qaRegister.do" method="post">
    <div class="row">
			<input type="hidden" name="mtr_seq" value="${mtr_seq}">
          <div class="control-group form-group">
            <div style="margin-left:200px; margin-right:10px">
              <textarea rows="10" cols="100" name="mtrqa_content" class="form-control" id="message" placeholder="질문을 등록해주세요" maxlength="999" style="resize:none;size:1000;"></textarea>
            </div>
          </div>
    </div>
      <div align='center'> 
      <button type="submit" class="btn btn-primary" id="sendMessageButton">질문등록</button>
      </div>
    <!-- /.row -->
     </form>

  </div>
  <!-- /.container -->
        
<%@ include file="../footer.jsp" %>