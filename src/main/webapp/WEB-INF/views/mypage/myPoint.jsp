<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" import="tp.vo.PointInfo, tp.domain.Points ,java.util.*"%>
<jsp:include page="../top.jsp" />
<head>
    <style>
        .btn-profile{
            position: relative;
            overflow: hidden;
        }
        .btn-profile input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }
    </style>
	
</head>
<body>
	<script>

function setImg() {
    form.submit();
    alert("프로필이 변경되었습니다.");
}
</script>

  <!-- Page Content -->
  <div class="container">
	
	<br/><br/>
    <div class="my-summary-wrap">
		<div class="profile-wrap">
			<div class="profile-thumb-wrap" align="center">
			<img src="../resources/profileImage/${loginUser.mem_profile}" onError="this.src='../resources/profileImage/TraceDefaultProfile.jpg'" class="thumb-profile" alt="프로필사진" style="width:120px; height:120px; border-radius: 100px;" />
			</div>
			<div class="profile-info-wrap" align="center" style="margin-top:15px;">
				안녕하세요.
			<span class="profile-name cut-txt" align="center">${loginUser.mem_nick} 님</span>
			<br/>
			<label class="btn btn-primary btn-file" style="margin-top:20px;">프로필 사진 편집
			<form id="form" name="changeProfile" action="../mypage/changeprofile.do" method="post" enctype="multipart/form-data">
       		 <input type='hidden' id="email" name='mem_email' value="${loginUser.mem_email}" />
       		 <input type="file" style="display: none;" name="mem_profile" onchange="setImg()" >
       		 </form>
    		</label>
			</div>
		</div>
	</div>
	
<style>
.bora, .bora0 {flex: 0 0 100% !important; max-width:100% !important; overflow:hidden;}
.bora .bora1 {display:block !important;}
.bora .aaa {width:20%; float:left; text-align:center; background: #000; color: #fff; padding: 20px 0;}
.bora .bbb {width:20%; height:10px; float:left; text-align:center; background: #fff; color: #fff; padding: 20px 0;}


</style>	
	<br/>
    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4 bora">
        <div class="list-group bora1" style="font-size:16px;" >
          <a href="../mypage/myInfo.do" class="aaa" style="color:gray;">내 정보 관리</a>
          <a href="../mypage/myActivity.do" class="aaa" style="color:gray;">나의 활동 내역</a>
          <a href="../mypage/myPoint.do?mem_email=${loginUser.mem_email}" class="aaa" style="color:white;">포인트</a>
          <a href="../mypage/myPayment.do" class="aaa" style="color:gray;">구매 &환불 내역 </a>
          <a href="#" class="aaa"  style="background:#f74f76; color:white;">장바구니</a>
        </div>
      </div>
      <c:if test="${empty pointInfoResult.pointInfo}">
     		<p style="text-align:center; width:100%; color:gray;">포인트 내역이 없습니다.</p>
     	</c:if>
     	<c:if test="${!empty pointInfoResult.pointInfo}">
      <table class="table table-boardered">
      	<thead>
      		<p style="width:180px; color:gray;"><strong>포인트 적립  & 사용 </strong></p>
      		<td> 번호 </td>
      		<td> 적립 / 사용 내역 </td>
      		<td> 포인트 </td>
      		<td> 총 포인트 </td>
      		<td> 날짜 </td>
     	</thead>
     	
     	<tbody>
	     	<c:set var = "total" value = "0" />
	     	<c:forEach items="${pointInfoResult.pointInfo}" var="point" varStatus="status">
	     		<tr>
	     			<td>${status.count}</td>
		     		<td> ${point.po_content}</td>
		     		<c:if test="${point.po_saving >=0}">
		     		<td style="color:blue"> ${point.po_saving}</td>
		     		</c:if>
		     		<c:if test="${point.po_saving <0}">
		     		<td style="color:red"> ${point.po_saving}</td>
		     		</c:if>
		     		<c:set var= "total" value="${total + point.po_saving}"/>
		      		<td> ${total}p </td>
		      		<td> ${point.po_rdate} </td>
		     	</tr>
	     	</c:forEach>
     	</tbody>
      </table>
      </c:if>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->


<%@include file="../footer.jsp"%>
