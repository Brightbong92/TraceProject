<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp"/>



  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">멘토 신청 :
      <small>당신의 재능 마음껏 펼치세요</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/">Home</a>
      </li>
      <li class="breadcrumb-item active">Mentor</li>
    </ol>

	<form action="../mentor/apply.do" method="post" enctype="multipart/form-data">
		<input type='hidden' name='mem_email' value="${loginUser.mem_email}" />
		<table class="table table-boardered">
			<tr>
                <th style="width:100px;">이름</th>
                <td><input type="text" class="form-control" name="ml_name" style="width:500px;"></td>        
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" class="form-control" name="ml_phone" style="width:500px; float:left">&nbsp;<button class="btn btn-light" >인증하기</button></td>        
            </tr>
            <tr>
                <th>자기소개</th>
                <td><textarea class="form-control" rows="3" name="ml_yourself" style="width:700px; height:250px;"></textarea></td>
            </tr>
            <tr>
                <th>카테고리 </th>
                <td> <label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="0">운동</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="1">음악</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="2">공예</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="3">요리</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="4">사진 & 영상</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="5">뷰티</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="6">음료</label> </td>
            </tr>
            <tr>
            	<th>첨부자료</th>
            	<td><input type="file" class="input_st iw100" name="ml_ofname"/><br/><br/>
            	</td>
            </tr>
		</table>
		<div class="board_btn_wrap ac">
		    <input type="submit" value="신청하기" />
		    <input type="button" value="취소하기"  onclick='history.back(-1); return false;' />
		</div>
	</form>
	
  </div>
  <!-- /.container -->
	<br/>
<%@include file="../footer.jsp"%>
