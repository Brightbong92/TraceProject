<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp"/>


<!-- 썸머노트 -->
<link href="../resources/summernote/dist/summernote-lite.min.css" rel="stylesheet">
<script src="../resources/summernote/dist/summernote-lite.min.js"></script>
<script src="../resources/summernote/dist/lang/summernote-ko-KR.js"></script>   

<!-- 멘토링글쓰기폼 타임피커 -->
<link rel="stylesheet" type="text/css" href="../resources/time/jquery.datetimepicker.css"/>
<script src="../resources/time/jquery.datetimepicker.full.min.js"></script>

<!-- 다음주소 우편번호 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cfc6adb56776563ea749406a6c619d30&libraries=services"></script>
</head>

<body>
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">멘토링 글쓰기
      <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="/">Home</a>
      </li>
      <li class="breadcrumb-item active">멘토링 글쓰기 폼</li>
    </ol>
    <!-- 글쓰기 Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
	<form name="writeForm" action="../mentoring/mentoringWrite.do" method="post" enctype="multipart/form-data">
		<table class="table table-boardered">
			<tr>
                <th style="width:150px;">멘토링 제목</th>
                <td><input type="text" class="form-control" name="mtr_subject" id = "mtr_subject" style="width:950px;"></td>        
            </tr>
            <tr>
                <th>썸네일 이미지</th>
                <td><input type="file" class="" id="mtr_profile_file" name="mtr_profile_file"/></td>        
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea id="summernote" class="summernote" name="mtr_content"></textarea></td>
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
            	<th>해시태그</th>
            	<td><input type="text" class="form-control" name="mtr_hashtag" id="mtr_hashtag" placeholder="ex)#요가,#필라테스,#해시태그 "/></td>
            </tr>
            
             <tr>
            	<th>금액</th>
            	<td><input type="text" class="form-control" name="mtr_price" id="mtr_price" placeholder="숫자만 입력가능"/></td>
            </tr>
            
            <tr>
            	<th>지역</th>
            	<td><input type="text" class="form-control" name="mtr_area" id="mtr_area" placeholder="ex)신촌/홍대"/></td>
            </tr>
            
            <tr>
            	<th>맵</th>
            	<td><div id="map" style="width:900px;height:300px;margin-top:10px;display:none"></div></td>
            </tr>
            
            <tr>
            	<th>상세주소</th>
            	<td>
            	<input type="text" class="form-control" id="mtr_addr" name="mtr_addr" placeholder="주소검색을 클릭해주세요" style="width:950px;">
            	<br/>
            	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td>
            </tr>
            
            <!--  
            <tr>
            	<th>인원</th>
            	<td>
            	<input type="text" id="mtrdi_max_pcnt" name="mtrdi_max_pcnt" style="width:70px;"placeholder="최대인원"/>
            </tr>
            -->
            
            <tr>
            	<th>날짜선택</th>
            	<td>
					<div class="calenCon">
						<label for="calender"><Strong>시작 날짜</Strong></label> 
						<input type="text" id="datetimepicker" name="calender" style="width:100px;" autocomplete="off">&nbsp;
						
						<label for="start"> <Strong>시작시간</Strong> </label> 
						<input type="text" id="date_timepicker_start" name="start" style="width:100px;" autocomplete="off" disabled>&nbsp;
						
						<label for="end"><Strong>종료시간</Strong></label> 
						<input type="text" id="date_timepicker_end" name="end" style="width:100px;" autocomplete="off" disabled>&nbsp;&nbsp;&nbsp;
						
						
						<label for="maxpcnt"><Strong>최대인원</Strong></label> 
						<input type="text" id="max_pcnt" name="pcnt" style="width:100px;" autocomplete="off" disabled>&nbsp;&nbsp;&nbsp;
						
						<button type="button" id="dataPlus">일정추가</button>
					</div>
            	</td>
            </tr>	

		</table>
		 <!--동적테이블 날짜 -->
		<table border="1" id="list_table">
			<colgroup>
				<!-- column 의 설정을 할수 있다. -->
				<col style="width:300px;">
				<col style="width:300px;">
				<col style="width:300px;">
				<col style="width:300px;">
				<col style="width:300px;">
			</colgroup>
			
			<thead>
				<tr align="center">
					<th align="center">시작날짜</th>
					<th align="center">시작시간</th>
					<th align="center">종료시간</th>
					<th align="center">최대인원</th>
					<th align="center">일정삭제</th>
				</tr>
			</thead>
			 
			<tbody>
			
			</tbody>
			
		</table>
		
		<!-- hidden -->
		<input type="hidden" id=mtrdi_time name="mtrdi_time" value="empty">
		<input type="hidden" id="mem_email" name="mem_email" value="${loginUser.mem_email}">
		
	</form>
  </div>
  
   <br/>
   <br/>
   <br/>
	  <div align="center">
	   <input type="button" id="writeGo" value="신청하기" />
	   <input type="reset" value="취소하기" onclick="test()"/>
	   </div>
  </div>
  <!-- /.container -->
  
<script>
    $(document).ready(function(){
      $("#summernote").summernote({
        placeholder: '내용입력해주세요',
        tabsize: 2,
        height: 350
      });
    });
</script>

<script>
	<!-- 다음 우편번호 -->
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("mtr_addr").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>    
   
<script>     
    <!--데이트 피커-->
    var time=null;
	 $('input').attr('autocomplete','off');
	 $("#datetimepicker").change(function(){
		 time = $('#datetimepicker').val(),
		$('#date_timepicker_start').attr('disabled', false);
		});
	 $("#date_timepicker_start").change(function(){
		  $('#date_timepicker_end').attr('disabled', false);
		});
	 $("#date_timepicker_end").change(function(){
		  $('#max_pcnt').attr('disabled', false);
		});
	 
	 var today = new Date();
	 var dd = today.getDate();
	 var mm = today.getMonth()+4; //January is 0!
	 var mm2 = today.getMonth()+1;
	 var yyyy = today.getFullYear();
	 
	 if(dd<10) {
        dd='0'+dd
     } 

     if(mm<10) {
        mm='0'+mm
     } 

     today = yyyy+'/'+mm+'/'+dd;
     today2 = yyyy+'-0'+mm2+'-'+dd;
     $('#date').datetimepicker({
         format:'Y-m-d',   
         minDate:'',//yesterday is minimum date(for today use 0 or -1970/01/01)
         maxDate:today,//tomorrow is maximum date calendar
         defaultDate:'',
         timepicker:false
      });
     $('#datetimepicker').datetimepicker({
        format:'Y-m-d',   
        minDate:'',//yesterday is minimum date(for today use 0 or -1970/01/01)
        maxDate:today,//tomorrow is maximum date calendar
        defaultDate:'',
        timepicker:false
     });
     $(function(){
        $('#date_timepicker_start').datetimepicker({
           format:'H:i',
           defaultTime:'09:00',
           allowTimes:[
           '09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30',
           '16:00','16:30','17:00','17:30','18:00','18:30','19:00','19:30','20:00','20:30'
           ],
           onShow:function( ct ){
           	if( time===today2 ){
           	    this.setOptions({
           	      minTime:'',
           	      maxTime:$('#date_timepicker_end').val()?$('#date_timepicker_end').val():false
           	    });
           	  }
           	else
           	    this.setOptions({
           	    	minTime:'09:00',
           	    	maxTime:$('#date_timepicker_end').val()?$('#date_timepicker_end').val():false
           	    });
           },
           datepicker:false
        });
        $('#date_timepicker_end').datetimepicker({
           format:'H:i',
           defaultTime:'09:30',
           allowTimes:[
              '09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30',
              '16:00','16:30','17:00','17:30','18:00','18:30','19:00','19:30','20:00','20:30','21:00'
              ],
           onShow:function( ct ){
           this.setOptions({
           minTime:$('#date_timepicker_start').val()?$('#date_timepicker_start').val():false
           })
        },
        datepicker:false
        });
     });
     $.datetimepicker.setLocale('ko');

	 $("#dataPlus").on("click", function() {
		 
		 if($("#datetimepicker").val() == "") {
			 alert("시작날짜를 입력해주세요.");
			 $("#datetimepicker").focus();
			 return false;
		 }
		 if($("#date_timepicker_start").val() == "") {
			 alert("시작시간을 입력해주세요.");
			 $("#date_timepicker_start").focus();
			 return false;
		 }
		 if($("#date_timepicker_end").val() == "") {
			 alert("종료시간을 입력해주세요.");
			 $("#date_timepicker_end").focus();
			 return false;
		 }

		 $('#list_table').append(
				 $('<tr>').append(
						 $("<td align='center'>").append($('#datetimepicker').val()),
						 $("<td align='center'>").append($('#date_timepicker_start').val()),
						 $("<td align='center'>").append($('#date_timepicker_end').val()),
						 $("<td align='center'>").append($('#max_pcnt').val()),
						 $("<td align='center'>").append(
								 $("<a align='center'>").prop('href', '#').addClass('delete-link').append('삭제')
								 )
						 )
				 )
		$("#datetimepicker").val("");
		$("#date_timepicker_start").val("");
		$("#date_timepicker_end").val("");
		$("#max_pcnt").val("");
		
	 });
 
	 $('#list_table').on("click", ".delete-link", function () {
		  $(this).parent().parent().remove();
		})
		
		
		
		$("#writeGo").click(function(){
			var dataArrayToSend = [];
			str = "";
			//var j = 0;
			var dataArray = [];
			$('#list_table tbody tr').each(function() {
				len = $(this).find("td").length-1;
				for(var i = 0; i<len; i++) {
					//dataArrayToSend.push($(this).find("td").eq(i).text());
					str += $(this).find("td").eq(i).text() + " ";
					}
					//alert("str: " + str);
					dataArray.push(str);
					str = "";
					alert(dataArray);
			});
			
			$("#mtrdi_time").val(dataArray);
			 var len = $('#list_table >tbody tr').length;
			var price = $("#mtr_price").val();
			
			 if($("#mtr_subject").val() == "") {
				 alert("제목을 입력하지 않았습니다.")
		         document.writeForm.mtr_subject.focus();
		         return false;
			 }else if($("input:radio[name='mtrcg_no']").is(":checked") == false) {
		    	  alert("카테고리를 선택해주세요.");
		    	  return false;
		     }
			 else if($("#mtr_hashtag").val() == "") {
				 alert("해시태그를 입력해주세요.")
				 document.writeForm.mtr_hashtag.focus();
				 return false;
			 }
			 else if($("#mtr_price").val() == "") {
		    	 alert("금액을 입력해주세요")
		    	 document.writeForm.mtr_price.focus();
		    	 return false;
			 }
			 else if($("#mtr_area").val() == "") {
		    	 alert("지역을 입력해주세요")
		    	 document.writeForm.mtr_area.focus();
		    	 return false;
			 }
			 else if($("#mtr_addr").val() == "") {
		    	 alert("주소를 입력해주세요")
		    	 document.writeForm.mtr_addr.focus();
		    	 return false;
			 }else if(len < 1) {
				 alert("멘토링 날짜를 입력해주세요. *최소 1타임 이상입니다.")
				 $("#datetimepicker").focus();
				 return false;
			 }
				writeForm.submit();
		});
	 
</script>

  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 발자취 2020</p>
    </div>
    <!-- /.container -->
  </footer>

</body>
</html>
  