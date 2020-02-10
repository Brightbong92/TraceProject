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

<!-- 클립보드 api -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.0/clipboard.min.js"></script>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${listResult.mtr_subject} : 
      <small>상품페이지</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="javascript:history.back()">이전</a>
      </li>
      <li class="breadcrumb-item active">Portfolio Item</li>
    </ol>




    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-8"><!-- md -->
        <!--  <img class="img-fluid" src="http://placehold.it/750x500" alt="">-->
        <img class="img-fluid" src="../resources/mentoring_list_images/${listResult.mtr_profile}" alt="">
      </div>



     <!--   <div class="col-md-4">-->
     <div class="col-md-4">

      <!-- 멘토링 옵션들 -->
        <!-- <h3 class="my-3">멘토링 타임</h3>-->
                <!-- Side Widget -->
        <!-- <div class="card my-4">-->
        <%-- 
        <div>
          <h5 class="card-header">옵션</h5>
          <div class="card-body">
	        <c:forEach items="${listResult.detail_Info_List}" var="timelist">
	        	<span>시작시간: ${timelist.mtrdi_stime}</span><br/>
	        	<span>종료시간: ${timelist.mtrdi_etime}</span><br/>
	        	<span>최대인원: ${timelist.mtrdi_max_pcnt}</span>&nbsp;
	        	<span>현재인원: ${timelist.mtrdi_now_pcnt}</span><br/>
	        	<!-- <button type="button" mtrdiseq="${timelist.mtrdi_seq}" onclick="selectOption(this)">옵션선택</button><br/><br/>-->
	        	<button type="button" class="btn btn-primary" mtrdi_seq="${timelist.mtrdi_seq}" onclick="goPaymentForm(this)">결제하기</button>
				<button type="button" class="btn btn-primary" mtrdi_seq="${timelist.mtrdi_seq}" onclick="goCart(this)">장바구니</button><br/><br/>
	        </c:forEach>
          </div>
        </div>
		--%>
		
	    <div>
          <h5 class="card-header">옵션</h5>
          <table>
          <tbody>
          <th>시간</th>
          <th>인원</th>
          <th>선택</th>
          
	        <c:forEach items="${listResult.detail_Info_List}" var="timelist">
	        	<tr>
	        	<td style="width:200px;"><span>${timelist.mtrdi_stime}<br/>&nbsp;~${timelist.mtrdi_etime}</span><br/></td>
	        	<td style="width:50px;"><span>${timelist.mtrdi_now_pcnt}</span>/<span>${timelist.mtrdi_max_pcnt}</span></td>
	        	<td><input type="checkbox" mtrdi_seq="${timelist.mtrdi_seq}" name="checkOpt" value="${timelist.mtrdi_seq}" style="width:20px;height:20px;" onclick="selectOption(this)"></td>
	        	</tr>
	        </c:forEach>
	        </tbody>
          </table>
        </div>	
		
		
		
        <!--  <h3 class="my-3">결제 / 장바구니</h3>-->
			<button type="button" class="btn btn-primary" onclick="goPaymentForm()">결제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-primary" onclick="goCart()">장바구니</button>
		
			
        </div>
        
    </div>
    <!-- /.row -->
    
    
    <!-- 멘토링 제목 -->
    <h2 style="color:blue;"><b>${listResult.mtr_subject}</b></h2>
    <!-- 멘토링해시태그 -->
    <div>해시태그:${listResult.mtr_hashtag}</div>
    <!-- 멘토링 지역 -->
    <div>지역:${listResult.mtr_area}</div> 
    <!-- 멘토링 금액 -->
    <div>금액:${listResult.mtr_price}원</div>
    
    
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
    <h3 class="my-4"><b>멘토링 질문</b></h3>
    <button class="btn btn-primary" onclick="goQABoard()">질문보러가기</button>
    
    
    
    <!-- 멘토링 후기 게시판 -->
    <h3 class="my-4"><b>멘토링 후기</b></h3>
    <button class="btn btn-primary" onclick="goReviewBoard()">XX개의 후기보러가기</button>
    
    
    
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
        	<b style="color:green;">${relative_list.mtr_hashtag}</b>
      </div>
    </c:forEach>
	</c:if>


    </div><!-- /.row -->
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
		if(optionList.length == 0) {
			//alert("선택하신 상품이 없습니다.");
		}else {
			//alert("선택값 있음");
				location.href="../cart/setCart.do?optionList=" + optionList+"&mtr_seq=${listResult.mtr_seq}&mem_email=${loginUser.mem_email}";
			//
		}
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

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">강의장!!</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<%@include file="../footer.jsp"%>
