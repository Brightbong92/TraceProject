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

<!-- 해시태그 -->
<style>
    .tag-item:hover {
        background-color: #3fb1fc;
        color: #fff;
    }
    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }
    
    #list_table th{
    	background-color:#F2F2F2;
    	font-weight: bold;
    }
    #list_table td{
    	font-weight: bold;
    	
    }
    table.table {
    border-collapse: collapse;
    text-align: left;

	}
	table.table thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #000;
    border-bottom: 3px solid #036;
}
</style>
  <!-- Page Content -->
  <div class="container">
	<br/><br/>
    <div class="row">
    	<h3>멘토링 등록</h3>
    	<br/><br/>
	<form id="writeForm" name="writeForm" action="../mentoring/mentoringWrite.do" method="post" enctype="multipart/form-data">
				
				<div class="control-group form-group" style="float:left;width:550px;height:330px; margin-right:50px; border-right:1px solid #dfe1e5; background:#edf8ff">
            		<div class="controls">
              	<label style="margin-left:5%">썸네일 :</label> &nbsp; &nbsp;
                <input type="file" class="" id="mtr_profile_file" name="mtr_profile_file"/>  
                	<img id="sum_nailImg" style="margin-left:5%"/>    
            		</div>
          		</div> 
          		
				<div class="control-group form-group" >
            		<div class="controls">
              	<label>멘토링 제목 :</label>
                <input type="text" class="form-control" name="mtr_subject" id = "mtr_subject" style="width:500px;" placeholder="제목을 입력해주세요">    
            		</div> 
          		</div>
 				
          		
				<div class="control-group form-group">
            		<div class="controls">
              	<label>금액 :</label>
            	<input type="text" class="form-control" name="mtr_price" id="mtr_price" style="width:500px;" placeholder="숫자만 입력가능" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
            		</div>
            	</div>
				
          		<div class="control-group form-group">
            		<div class="controls">
              	<span><label>해시태그 :</label></span>
            	<span id="tag-list"> </span>
            	<br/>
            	<input type="text" class="form-control" style="width:420px; float:left;" name="hashtag" id="hashtag" placeholder="ex)#요가" />
				&nbsp;&nbsp;
            	<button type="button" class="btn btn-info" id="tagPlus">태그추가</button>
            	<%-- <button type="button" class="btn btn-primary" id="check">태그값확인</button>--%>
            		</div>
            	</div>
            	<br/><br/>
            	
            	<hr>
            	<div class="control-group form-group">
            		<div class="controls">
              	<label>카테고리 :</label>&emsp;&emsp;&emsp;
                 <label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="0">운동</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="1">음악</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="2">공예</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="3">요리</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="4">사진 & 영상</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="5">뷰티</label>&emsp;&emsp;&emsp;&emsp;
                	<label style="font-size:15px;"><input type="radio" name="mtrcg_no" value="6">음료</label> 
            		</div>
          		</div>
            	<hr> 
            	
            	<div class="control-group form-group">
            		<div class="controls"> 
              	<label>멘토링 내용 :</label>
                <textarea id="summernote" class="summernote" name="mtr_content" ></textarea>
            		</div>
          		</div>
            	
            	<hr>
            	<div class="control-group form-group">
            		<div class="controls">
              	<label>지역:</label>
            	<input type="text" class="form-control" name="mtr_area" id="mtr_area" placeholder="ex)신촌/홍대"/>
            		</div>
            	</div>
            
            	
            	<div id="map" style="width:100%;height:300px;margin-top:10px;display:none"></div>
            
            
            	<div class="control-group form-group">
            		<div class="controls">
              	<label>상세주소 :</label>
            	<br/>
            	<input type="text" class="form-control" id="mtr_addr" name="mtr_addr" placeholder="주소검색을 클릭해주세요" style="width:90%; float:left;">
            	&nbsp;&nbsp;
            	<input type="button" class="btn btn-info" onclick="sample5_execDaumPostcode()" value="주소 검색">
            		</div>
            	</div>
            	
            	<hr>
            <!--  
            <tr>
            	<th>인원</th>
            	<td>
            	<input type="text" id="mtrdi_max_pcnt" name="mtrdi_max_pcnt" style="width:70px;"placeholder="최대인원"/>
            </tr>
            -->
            	<div class="control-group form-group">
            		<div class="controls">
              		<label>날짜선택 :</label>
            	
					<div class="calenCon"  align="center">
						<label for="calender"><Strong>시작 날짜</Strong></label> 
						<input type="text" id="datetimepicker" name="calender" style="width:100px;" autocomplete="off">&nbsp;
						
						<label for="start"> <Strong>시작시간</Strong> </label> 
						<input type="text" id="date_timepicker_start" name="start" style="width:100px;" autocomplete="off" disabled>&nbsp;
						
						<label for="end"><Strong>종료시간</Strong></label> 
						<input type="text" id="date_timepicker_end" name="end" style="width:100px;" autocomplete="off" disabled>&nbsp;&nbsp;&nbsp;
						
						
						<label for="maxpcnt"><Strong>최대인원</Strong></label> 
						<input type="text" id="max_pcnt" name="pcnt" style="width:100px;" autocomplete="off" disabled>&nbsp;&nbsp;&nbsp;
						
						<button type="button" class="btn btn-info"  id="dataPlus">일정추가</button>
					</div>
					</div>
				</div>
            	
            	

		<br/>
		 <!--동적테이블 날짜 -->
		<table  class="table" id="list_table">
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
		<input type="hidden" id="mtrdi_time" name="mtrdi_time" value="empty">
		<input type="hidden" id="mem_email" name="mem_email" value="${loginUser.mem_email}">
		<input type="hidden" id="mtr_hashtagArray" name="mtr_hashtagArray" value="empty"><!-- 태그관련 배열 전송용 -->
		<input type="hidden" id="mtr_hashtag" name="mtr_hashtag" value=""><!-- mtr_hashtag = null// @멘토링 이갖고있는변수때문에 -->
	</form>
  </div>
  
   <br/>
   <br/>
   <br/>
	  <div align="center">
	   <button type="button" class="btn btn-info" id="writeGo" >멘토링 개설하기<i class="fa fa-check spaceLeft"></i></button> 
	   <button id="clearBtn" class="btn btn-warning" >취소하기<i class="fa fa-times spaceLeft"></i></button>
	   </div>
	   <br/><br/>
  </div>
  <!-- /.container -->

<!-- 섬머노트 -->
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
<!--해시태그-->
$(document).ready(function(){
	

	var tag = {};
	var cnt = 0;
	
	$("#tagPlus").click(function(){
		
		var w = $("#hashtag").val().indexOf("#");
		
		if(w == -1) {
			alert("올바른형식으로 추가해주세요.");
			$("#hashtag").val("");
			return false;
		}
		var tagValue = $("#hashtag").val();
		
		if(tagValue == "") {
			alert("해시태그를 입력 후 추가 해주세요.");
			return false;
		 }
		
		var hashArr = marginTag();//해시태그 배열값으로 셋팅
		
		if(hashArr.length == 4) {
			alert("해시태그는 4개까지 추가 가능해요.");
			return false;
		}
		
		 var result = Object.values(tag).filter(function (word) {
	         return word === tagValue;
	     })
		 if(result.length == 0) {//중복이아닐경우
			 $("#tag-list").append("<span class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+cnt+"'>X</span></span>&nbsp;&nbsp;");
			 addTag(tagValue);
			 $("#hashtag").val("");
		 }else {//중복일경우
			 alert("태그값이 중복");
			 $("#hashtag").val("");
			 return false;
		 }
	
	});
	
	function marginTag () {// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	    return Object.values(tag).filter(function (word) {
	        return word !== "";
	    });
	}
	
	
	$(document).on("click", ".del-btn", function(e){//지우는부분
		var index = $(this).attr("idx");
		//tag[index] = "";
		delete tag[index];
		$(this).parent().remove();
		
	});
	
	
	function addTag (value) {
	    tag[cnt] = value; // 태그를 Object 안에 추가
	    cnt++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	}
	
	
	$("#check").click(function(){
		var result = Object.values(tag);
		alert("길이: " + result.length);
		alert("배열값: " + result);
	});



<!--데이트피커 -->

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
		 if($("#max_pcnt").val() == "") {
		 	alert("최대인원을 입력해주세요.")
		 	$("#max_pcnt").focus();
		 	return false;
	 	 }
		
		 if($("#max_pcnt").val() == 0) {
			 alert("최대인원은 최소 1명이상입니다.");
			 $("#max_pcnt").val("");
			 $("#max_pcnt").focus();
			 return false;
		 }
		 
		 $('#list_table').append(
				 $('<tr>').append(
						 $("<td align='center'>").append($('#datetimepicker').val()),
						 $("<td align='center'>").append($('#date_timepicker_start').val()),
						 $("<td align='center'>").append($('#date_timepicker_end').val()),
						 $("<td align='center'>").append($('#max_pcnt').val()),
						 $("<td align='center'>").append(
								 //$("<a align='center'>").prop('href', '#').addClass('delete-link').append('삭제')
								 $("<a align='center'>").addClass('delete-link').append('삭제')
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
		
		
		<%--글쓰기 버튼 --%>
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
					//alert(dataArray);
			});
			
			$("#mtrdi_time").val(dataArray);
			 var len = $('#list_table >tbody tr').length;
			var price = $("#mtr_price").val();
			var hashArr = marginTag();//해시태그 배열값으로 셋팅
			
			
			 if($("#mtr_subject").val() == "") {
				 alert("제목을 입력하지 않았습니다.")
		         document.writeForm.mtr_subject.focus();
		         return false;
			 }else if($("input:radio[name='mtrcg_no']").is(":checked") == false) {
		    	  alert("카테고리를 선택해주세요.");
		    	  return false;
		     }
			 else if(hashArr.length == 0) {
				 alert("해시태그를 입력해주세요.");
				 document.writeForm.hashtag.focus();
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
				$("#mtr_hashtagArray").val(hashArr);//해시태그 배열값으로 셋팅
				writeForm.submit();
		});
});
</script>
<style type="text/css">

	#load {
	 width: 100%;
	 height: 100%;
	 top: 0;
	 left: 0;
	 position: fixed;
	 display: block;
	 opacity: 0.8;
	 background: white;
	 z-index: 99;
	 text-align: center;
	}
	
	 
	
	#load > img {
	 position: absolute;
	 top: 40%;
	 left: 30%;
	 z-index: 100;
	}
	
	</style>
<div id="load">

 <img src="../resources/images/loading14.gif" alt="loading">

</div>
<script>
var sel_file;
$(document).ready(function(){
	document.getElementById("load").style.display = "none";
	
	
	$("#clearBtn").on('click', function(){
		document.getElementById('writeForm').reset();
	});
	
	   $("#mtr_profile_file").on('change', handleImgFileSelect);
	   
	   function handleImgFileSelect(e) {
	      var files = e.target.files;
	      var filesArr = Array.prototype.slice.call(files);
	      filesArr.forEach(function(f){
	         if(!f.type.match("image.*")) {
	            alert("확장자는 이미지만 가능!!");
	            return;
	         }
	         sel_file = f;
	         var reader = new FileReader();
	         reader.onload = function(e) {
	            $("#sum_nailImg").css("width","90%");
	            $("#sum_nailImg").css("height","280px");
	            $("#sum_nailImg").attr("src", e.target.result);
	         }
	         reader.readAsDataURL(f);
	      });
	   }
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
  
