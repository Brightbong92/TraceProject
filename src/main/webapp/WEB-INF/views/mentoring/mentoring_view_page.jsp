<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nDate" />

<jsp:include page="../top.jsp" />



<style>
table {
  border-collapse: separate;
  border-spacing: 0 10px;
  align: center;
}
</style>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>

<!-- 클립보드 api -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>

  <!-- Page Content -->
  <div class="container">

<%-- 
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="javascript:history.back()">이전</a>
      </li>
      <li class="breadcrumb-item active">Portfolio Item</li>
    </ol>
--%>



    <!-- Portfolio Item Row -->
    <div class="row">
    
      <div class="col-md-8" style="border-bottom:1px solid #dfe1e5;"><!-- md -->
        <!--  <img class="img-fluid" src="http://placehold.it/750x500" alt="">-->
        <img class="img-fluid" src="../resources/mentoring_list_images/${listResult.mtr_profile}"  style="width:75%; margin-top:60px; margin-left:80px; margin-bottom:30px;" alt="">
        <br/>
        <!-- 멘토링 제목 -->
        <div style="font-size:25px" align="center"><strong>${listResult.mtr_subject}</strong></div><br/>
        <!-- 멘토링해시태그 -->
	    <div style="font-size:17px; margin-left:80px;" class="badge badge-warning mb-2">${listResult.mtr_hashtag}</div>
        
	    
	    <c:choose>
	           <c:when test="${listResult.mtr_jumsu eq 0}">
	            <div class="starRev" style="margin-left:80px; font-size:17px;">
	            	<strong>평점 : </strong>
				  <span style="height:20px;" class="starK">별1</span>
				  <span style="height:20px;"class="starK">별2</span>
				  <span style="height:20px;"class="starK">별3</span>
				  <span style="height:20px;"class="starK">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${listResult.mtr_jumsu eq 1}">
	            <div class="starRev" style="margin-left:80px; font-size:17px;">
	            	<strong>평점 : </strong> 
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK">별2</span>
				  <span style="height:20px;"class="starK">별3</span>
				  <span style="height:20px;"class="starK">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${listResult.mtr_jumsu eq 2}">
	            <div class="starRev" style="margin-left:80px; font-size:17px;">
	            	<strong>평점 : </strong>
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK on">별2</span>
				  <span style="height:20px;"class="starK">별3</span>
				  <span style="height:20px;"class="starK">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${listResult.mtr_jumsu eq 3}">
	            <div class="starRev" style="margin-left:80px; font-size:17px;">
	            	<strong>평점 : </strong>
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK on">별2</span>
				  <span style="height:20px;"class="starK on">별3</span>
				  <span style="height:20px;"class="starK">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${listResult.mtr_jumsu eq 4}">
	            <div class="starRev" style="margin-left:80px; font-size:17px;">
	            	<strong>평점 : </strong> 
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK on">별2</span>
				  <span style="height:20px;"class="starK on">별3</span>
				  <span style="height:20px;"class="starK on">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	          <c:when test="${listResult.mtr_jumsu eq 5}">
	            <div class="starRev" style="margin-left:80px; font-size:17px;">
	            	<strong>평점 : </strong>
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK on">별2</span>
				  <span style="height:20px;"class="starK on">별3</span>
				  <span style="height:20px;"class="starK on">별4</span>
				  <span style="height:20px;"class="starK on">별5</span>
	           </div>
	           </c:when>
	          </c:choose>
	          <!-- 멘토링 금액 -->
	    <div style="font-size:17px; margin-left:80px; margin-top:12px"><strong>금액  : ${listResult.mtr_price}원</strong></div><br/>
      </div>


	<hr>
     <!--   <div class="col-md-4">-->
     <div class="col-md-4" style="border-left:1px solid #dfe1e5; border-bottom:1px solid #dfe1e5;">

      <!-- 멘토링 옵션들 -->
        <!-- <h3 class="my-3">멘토링 타임</h3>-->
                <!-- Side Widget -->
        <!-- <div class="card my-4">-->
		
	    <div style="margin-top:60px; font-size:14px;">
          <h5 class="card-header" style="font-size:20px;">옵션</h5>
          <table style="margin-left:14px">
          <thead align="center">
          	<th>선택</th>
          	<th style="width:75%;">시간</th>
         	<th>인원</th>
          </thead>
          <tbody align="center">
	          
	        <c:forEach items="${listResult.detail_Info_List}" var="timelist">
	        	<tr align="center">
	        	<c:choose>
		        	<c:when test="${timelist.mtrdi_now_pcnt ne timelist.mtrdi_max_pcnt}">
		        		<td><input type="checkbox" mtrdi_seq="${timelist.mtrdi_seq}" name="checkOpt" value="${timelist.mtrdi_seq}" style="width:20px;height:20px;" onclick="selectOption(this)"></td>
		        		
		        		<fmt:parseDate value="${timelist.mtrdi_stime}" pattern="yyyy-MM-dd" var="rDate"/>	        	
	        			<c:if test="${rDate > nDate}"><%--멘토링시작날짜 > 현재날짜 --%>
		        			<td align='center' style="width:200px;"><span>${timelist.mtrdi_stime}<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~${timelist.mtrdi_etime}</span><br/></td>
		        			<td align='center' style="width:50px;"><span>${timelist.mtrdi_now_pcnt}</span>/<span>${timelist.mtrdi_max_pcnt}</span></td>
	        			</c:if>
		        	</c:when>
		        	<c:otherwise>
		        		<td><input type="checkbox" mtrdi_seq="${timelist.mtrdi_seq}" name="checkOpt" value="${timelist.mtrdi_seq}" disabled="disabled" style="width:20px;height:20px;"></td>
		        		<fmt:parseDate value="${timelist.mtrdi_stime}" pattern="yyyy-MM-dd" var="rDate"/>	        	
	        			<c:if test="${rDate > nDate}"><%--멘토링시작날짜 > 현재날짜 --%>
		        			<td align='center' style="width:200px;"><span style="text-decoration:line-through; color:gray;">${timelist.mtrdi_stime}<br/>&nbsp;~${timelist.mtrdi_etime}</span><br/></td>
		        			<td align='center' style="width:50px;color:gray;"><span>${timelist.mtrdi_now_pcnt}</span>/<span>${timelist.mtrdi_max_pcnt}</span></td>
	        			</c:if>
		        	</c:otherwise>
	        	</c:choose>
	       
	        	</tr>
	        </c:forEach>
	        </tbody>
          </table>
        </div>	
		
		
		
        <!--  <h3 class="my-3">결제 / 장바구니</h3>-->
        <br/>
        <br/>
        <div align="center">
        	<button style="height:40px; width:120pt;font-size: 20px; background-color:#dbefff; " type="button" onclick="goCart()">장바구니</button>
			<button style="height:40px; width:120pt;font-size: 20px; background-color:#dbefff; " type="button" onclick="goPaymentForm()">결제하기</button><br/><br/>
		</div>
			
        </div>
        
    </div>
    <!-- /.row -->
    
    <%-- 
    <!-- 멘토링 지역 -->
    <div style="font-size:2.0em" class="badge badge-primary">${listResult.mtr_area}</div> 
    --%>
    	      
    <br/>
    <div style="border-bottom:1px solid #dfe1e5;">
    <!-- 멘토 프로필 -->
    <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
	     <div class="card" style="box-shadow:none">
	        <div class="card-header" role="tab" id="headingTwo">
	          <h5 class="mb-0" style="text-align:left; margin-left:30px;">
	            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"  style="margin-left:40px;">멘토 소개 <span style="font-size:15px;">▼</span>  
	            </a>
	          </h5>
	        </div>
	        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
	          <div class="card-body">
	           		<div class="profile-thumb-wrap" style="margin-left:45px;">
						<img src="../resources/profileImage/${mentorInfo.mem_profile}" onError="this.src='../resources/profileImage/기본프로필사진.jpg'" class="thumb-profile" alt="프로필사진" style="width:150px; height:150px; float:left; border-radius: 100px;" />
						<div style="margin-left:20%; font-size:18px;">
							<span>멘토 이름 : </span>&nbsp;&nbsp;<span>${mentorInfo.mem_nick} </span> <br/><br>
							<span>멘토 이메일 : </span> &nbsp;&nbsp;<span>${mentorInfo.mem_email}</span> <br/><br>
							<span>멘토 소개 및 경력 : </span>&nbsp;&nbsp; <span>${mentorInfo.ml_yourself} </span><br>
						</div>
					</div>
	          </div>
	        </div>
	      </div>
      </div>
      </div>
     <!-- 멘토링 내용-->
     <br/>
     <div  style="font-size:25px;" ><b>멘토링 소개</b></div> 
     <br/>
     <div align="center" style="margin-left:80px;">  
     	${listResult.mtr_content}
     </div>
    <br/>
    <!-- 멘토링 장소 -->
    <div style="border-bottom:1px solid #dfe1e5;">
	    <h3 class="my-4" ><b>멘토링 장소</b></h3>
		<div id="map" style="width:80%;height:400px; margin-left:10%"></div>
		<br/>
		<span style="border-bottom:30px; margin-left:63%;"><b>주소 :</b> ${listResult.mtr_addr}</span>&nbsp;&nbsp;&nbsp;
		<button style="background-color:#dbefff; border-radius:20px;" id="addrcopy" data-clipboard-text="${listResult.mtr_addr}">주소복사</button>
    </div>
    
    <!-- 멘토링 질문 게시판-->
    <div style="border-bottom:1px solid #dfe1e5; margin-top:40px; height:90px;">
    <span class="my-4" style="font-size:25px;"><b>멘토링 문의</b></span> &nbsp;&nbsp;
    <button style="background-color:#dbefff; border-radius:20px;" onclick="goQABoard()">${qaRvCount.qaCnt}개의 문의보러가기</button>
    <br/>
    </div>
    <br/>
    <div style="border-bottom:1px solid #dfe1e5; margin-top:40px; height:90px;">
    <!-- 멘토링 후기 게시판 -->
    <span class="my-4" style="font-size:25px;"><b>멘토링 후기</b></span> &nbsp;&nbsp;
    <button style="background-color:#dbefff; border-radius:20px;"  onclick="goReviewBoard()">${qaRvCount.rvCnt}개의 후기보러가기</button>
    </div>
    
    <br/>
    <!-- Related Projects Row -->
    <h3 class="my-4"><b>관련된 멘토링</b></h3>

    <div class="row">
	<c:if test="${empty listResult.relative_mtr_list}">
			<div>관련된 멘토링이 없습니다.</div>
	</c:if>
	
	<c:if test="${!empty listResult.relative_mtr_list}">
	<c:forEach items="${listResult.relative_mtr_list}" var="relative_list">
      <div class="col-md-3 col-sm-6 mb-4">
        <a href="../mentoring/mentoringDetail.do?mtr_seq=${relative_list.mtr_seq}">
          <img class="img-fluid" src="../resources/mentoring_list_images/${relative_list.mtr_profile}" alt="">
	   		<b>${relative_list.mtr_subject}</b>
        </a>
        	<div style="font-size:1.0em" class="badge badge-warning mb-2">${relative_list.mtr_hashtag}</div>
      </div>
    </c:forEach>
	</c:if>


    </div><!-- /.row -->
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">알림</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br />장바구니에 상품이 담겼습니다.</p>
                <p><br /></p>
           		<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;">계속 쇼핑하기</span>
            	</div>
            	<br/>
            	<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="goMyCartlist()">
                <span class="pop_bt" style="font-size: 13pt;">장바구니 보러가기</span>
      </div>
 	</div>
    </div>
        <!--End Modal-->
    
  </div><!-- /.container -->
  

<script>
	optionList = [];
	
	function goQABoard(){
		location.href="../qa/qaList.do?mtr_seq=${listResult.mtr_seq}&cp=1";
	}
	function goReviewBoard() {
		location.href="../review/reviewList.do?mtr_seq=${listResult.mtr_seq}&cp=1";
	}
	function selectOption(obj){
		var flag = $(obj).is(":checked");
		if(flag == true) {
			optionList.push($(obj).attr("mtrdi_seq"));
			//alert("체크 시 배열: " + optionList);
		}else {
			var index = optionList.indexOf($(obj).attr("mtrdi_seq"));
			if(index > -1) {
				optionList.splice(index, 1);
			}
			//alert("체크해제 시 배열 : " + optionList);
		}
	}
	function clearOptionList() {
		$("[name=checkOpt]").prop("checked", false);
		var l = optionList.length;
		optionList.splice(0, l);
		//alert(optionList);
	}
	
	function goPaymentForm(){
		if("${loginUser.mem_email}" == "") {
			alert("로그인 후 이용가능합니다.");
			location.href="../login/login.do";
			return false;
		}

		if(optionList.length == 0) {
			alert("선택하신 상품이 없습니다.");
			return false;
		}else {
			location.href="../payment/paymentList.do?mtr_seq=${listResult.mtr_seq}&mtrdi_seqArr="+optionList+"&mem_email=${loginUser.mem_email}";
		}
	}
	function goCart(){
		
		if("${loginUser.mem_email}" == "") {
			alert("로그인 후 이용가능합니다.");
			location.href="../login/login.do";
			return false;
		}
		
		if(optionList.length == 0) {
			alert("선택하신 상품이 없습니다.");
		}else {
			$.ajax({
				url: "../cart/setCart.do?optionList=" + optionList+"&mtr_seq=${listResult.mtr_seq}&mem_email=${loginUser.mem_email}",
				contentType: "application/json",
				success: function(data){
					console.clear();
					//console.log("data: "+data);
					$('#cart_tot_count').css('display', "");
					$('#cart_tot_count').text(data);
				},error: function(err){
					console.clear();
					//console.log("에러");
				}
			});
			clearOptionList();
			$('#myModal').show();
			//alert("선택값 있음");
			//location.href="../cart/setCart.do?optionList=" + optionList+"&mtr_seq=${listResult.mtr_seq}&mem_email=${loginUser.mem_email}";
		}
	}	
    function close_pop(flag) {
        $('#myModal').hide();
        //location.reload();
        // history.go(0);
   };
   function goMyCartlist(){
	   location.href="../cart/cart.do?mem_email=${loginUser.mem_email}";
   }
	
</script>


<!-- 주소복사 -->
<script>
  var clipboard = new ClipboardJS('#addrcopy');
  clipboard.on('success', function(e) {
      //console.info('Action:', e.action);
      //console.info('Text:', e.text);
      //console.info('Trigger:', e.trigger);
      alert("주소가 복사되었습니다.");
  });

  clipboard.on('error', function(e) {
      //console.error('Action:', e.action);
      //console.error('Trigger:', e.trigger);
	  alert("복사가 안되었습니다.");
  });
</script>

<!-- 카카오맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cfc6adb56776563ea749406a6c619d30&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${listResult.mtr_addr}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
		/*
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
        });
        
        infowindow.open(map, marker);
		*/
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<%@include file="../footer.jsp"%>
