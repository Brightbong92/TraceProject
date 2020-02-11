<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
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
    
      <div class="col-md-8"><!-- md -->
        <!--  <img class="img-fluid" src="http://placehold.it/750x500" alt="">-->
        <img class="img-fluid" src="../resources/mentoring_list_images/${listResult.mtr_profile}" alt="" height="" width="500">
        <br/>
        <!-- 멘토링 제목 -->
        <div><h1>${listResult.mtr_subject}</h1></div>
        <!-- 멘토링 금액 -->
	    <div style="font-size:2.0em" class="badge badge-primary">금액: ${listResult.mtr_price}원</div><br/><br/>
	    <!-- 멘토링해시태그 -->
	    <div style="font-size:2.0em" class="badge badge-warning mb-2">${listResult.mtr_hashtag}</div>
	    <c:choose>
	           <c:when test="${listResult.mtr_jumsu eq 0}">
	            <div class="starRev">
				  <span style="height:20px;" class="starK">별1</span>
				  <span style="height:20px;"class="starK">별2</span>
				  <span style="height:20px;"class="starK">별3</span>
				  <span style="height:20px;"class="starK">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${listResult.mtr_jumsu eq 1}">
	            <div class="starRev">
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK">별2</span>
				  <span style="height:20px;"class="starK">별3</span>
				  <span style="height:20px;"class="starK">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${listResult.mtr_jumsu eq 2}">
	            <div class="starRev">
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK on">별2</span>
				  <span style="height:20px;"class="starK">별3</span>
				  <span style="height:20px;"class="starK">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${listResult.mtr_jumsu eq 3}">
	            <div class="starRev">
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK on">별2</span>
				  <span style="height:20px;"class="starK on">별3</span>
				  <span style="height:20px;"class="starK">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	           <c:when test="${listResult.mtr_jumsu eq 4}">
	            <div class="starRev">
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK on">별2</span>
				  <span style="height:20px;"class="starK on">별3</span>
				  <span style="height:20px;"class="starK on">별4</span>
				  <span style="height:20px;"class="starK">별5</span>
	           </div>
	           </c:when>
	          <c:when test="${listResult.mtr_jumsu eq 5}">
	            <div class="starRev">
				  <span style="height:20px;"class="starK on">별1</span>
				  <span style="height:20px;"class="starK on">별2</span>
				  <span style="height:20px;"class="starK on">별3</span>
				  <span style="height:20px;"class="starK on">별4</span>
				  <span style="height:20px;"class="starK on">별5</span>
	           </div>
	           </c:when>
	          </c:choose>
      </div>



     <!--   <div class="col-md-4">-->
     <div class="col-md-4">

      <!-- 멘토링 옵션들 -->
        <!-- <h3 class="my-3">멘토링 타임</h3>-->
                <!-- Side Widget -->
        <!-- <div class="card my-4">-->
		
	    <div>
          <h5 class="card-header">옵션</h5>
          <table>
          <tbody align='center'>
          <th align='center'>시간</th>
          <th align='center'>인원</th>
          <th align='center'>선택</th>
          
	        <c:forEach items="${listResult.detail_Info_List}" var="timelist">
	        	<tr align='center'>
	        	<td align='center' style="width:200px;"><span>${timelist.mtrdi_stime}<br/>&nbsp;~${timelist.mtrdi_etime}</span><br/></td>
	        	<td align='center' style="width:50px;"><span>${timelist.mtrdi_now_pcnt}</span>/<span>${timelist.mtrdi_max_pcnt}</span></td>
	        	<td align='center'><input type="checkbox" mtrdi_seq="${timelist.mtrdi_seq}" name="checkOpt" value="${timelist.mtrdi_seq}" style="width:20px;height:20px;" onclick="selectOption(this)"></td>
	        	</tr>
	        </c:forEach>
	        </tbody>
          </table>
        </div>	
		
		
		
        <!--  <h3 class="my-3">결제 / 장바구니</h3>-->
        <br/>
        <br/>
        <div align='center'>
			<button style="height:40pt; width:300pt;font-size: 25px;"type="button" class="btn btn-primary" onclick="goPaymentForm()">결제하기</button><br/><br/>
			<button style="height:40pt; width:300pt;font-size: 25px;"type="button" class="btn btn-primary" onclick="goCart()">장바구니</button>
		</div>
			
        </div>
        
    </div>
    <!-- /.row -->
    
    <%-- 
    <!-- 멘토링 지역 -->
    <div style="font-size:2.0em" class="badge badge-primary">${listResult.mtr_area}</div> 
    --%>
    	      
    
    
    <!-- 멘토 프로필 -->
    <h3 class="my-4"><b>멘토 프로필</b></h3>
    <button class="btn btn-primary" 
    onclick="window.open('../mentor/popup.do?mem_email=${listResult.mem_email}','멘토정보',
    'width=700px,height=800px,left=100px,top=100px');">프로필보기</button>
   
     <!-- 멘토링 내용-->
     <h3 class="my-4"><b>내용</b></h3>
     <div>
     	${listResult.mtr_content}
     </div>
    
    
    <!-- 멘토링 장소 -->
    <h3 class="my-4"><b>멘토링 장소</b></h3>
	<div id="map" style="width:500px;height:300px;"></div>
	<br/>
	<span><b>주소 :</b> ${listResult.mtr_addr}</span>&nbsp;&nbsp;&nbsp;
	<button class="btn btn-primary" id="addrcopy" data-clipboard-text="${listResult.mtr_addr}">주소복사</button>
    
    
    <!-- 멘토링 질문 게시판-->
    <h3 class="my-4"><b>멘토링 문의</b></h3>
    <button class="btn btn-primary" onclick="goQABoard()">문의하기</button>
    
    <!-- 멘토링 후기 게시판 -->
    <h3 class="my-4"><b>멘토링 후기</b></h3>
    <button class="btn btn-primary" onclick="goReviewBoard()">후기보러가기</button>
    
    
    
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
	function goPaymentForm(){
		
		if("${loginUser.mem_email}" == "") {
			alert("로그인 후 이용가능합니다.");
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
			return false;
		}
		
		if(optionList.length == 0) {
			alert("선택하신 상품이 없습니다.");
		}else {
			$.ajax({
				url: "../cart/setCart.do?optionList=" + optionList+"&mtr_seq=${listResult.mtr_seq}&mem_email=${loginUser.mem_email}",
				success: function(data){
					console.clear();
					console.log("성공");
				},error: function(data){
					console.clear();
					console.log("에러");
				}
			});
			$('#myModal').show();
			//alert("선택값 있음");
			//location.href="../cart/setCart.do?optionList=" + optionList+"&mtr_seq=${listResult.mtr_seq}&mem_email=${loginUser.mem_email}";
		}
	}	
    function close_pop(flag) {
        $('#myModal').hide();
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
