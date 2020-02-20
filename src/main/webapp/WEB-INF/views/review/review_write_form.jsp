<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:include page="../top.jsp"/>

<style>
<%--별점css--%>
.star_input>.input,
.star_input>.input>label:hover,
.star_input>.input>input:focus+label,
.star_input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('/images/star_img2.png')no-repeat;}
.star_input{display:inline-block; white-space:nowrap;width:225px;height:60px;padding:25px;line-height:50px;}
.star_input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star_input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star_input>.input.focus{outline:1px dotted #ddd;}
.star_input>.input>label{width:50px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star_input>.input>label:hover,
.star_input>.input>input:focus+label,
.star_input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star_input>.input>label:hover~label{background-image: none;}
.star_input>.input>label[for="p1"]{width:30px;z-index:5;}
.star_input>.input>label[for="p2"]{width:60px;z-index:4;}
.star_input>.input>label[for="p3"]{width:90px;z-index:3;}
.star_input>.input>label[for="p4"]{width:120px;z-index:2;}
.star_input>.input>label[for="p5"]{width:150px;z-index:1;}
.star_input>output{display:inline-block;width:100px; font-size:18px;text-align:right; vertical-align:middle;}
</style>

    <style>
        .btn-file{
            position: relative;
            overflow: hidden;
        }
        .btn-file input[type=file] {
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

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3" style="font-size:30px;"><a href="../mentoring/mentoringDetail.do?mtr_seq=${mtr_seq}">${mtr_subject}</a> - 후기 등록하기
      <%-- <small>: 리뷰</small>--%>
    </h1>
<%-- 
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#">Home</a>
      </li>
      <li class="breadcrumb-item active">Contact</li>
    </ol>
--%>
    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <form name="reviewForm" id="reviewForm" action="/review/reviewRegister.do" method="post" enctype="multipart/form-data">
    <div class="row" style="margin-top:40px">
	
	
	<div class="control-group form-group">
          <div style="margin-left:200px; margin-right:10px">
          	<label>작성자:</label><br/>
          	<input type="text" style="width:750px;" placeholder="${loginUser.mem_nick}" disabled="true">
          </div>
        </div>
          
	<input type="hidden" name="mtr_seq" value="${mtr_seq}">
		<div class="control-group form-group">
			<div style="margin-left:200px;">
			<label>후기내용:</label>
		    <textarea rows="10" cols="100" name="mtrrv_content" class="form-control" id="message" placeholder="후기를 등록해주세요" maxlength="999" style="resize:none;size:1000;"></textarea>
		    </div>
		</div>
    </div><!-- /.row -->
    
    
	<div style="margin-top:-15px;">
    <label style="margin-left:200px;"><strong>별점 :</strong></label>
    <span class="star_input">
		<span class="input">
	    	<input type="radio" name="star_input" value="1" id="p1">
	    	<label for="p1">1</label>
	    	<input type="radio" name="star_input" value="2" id="p2">
	    	<label for="p2">2</label>
	    	<input type="radio" name="star_input" value="3" id="p3">
	    	<label for="p3">3</label>
	    	<input type="radio" name="star_input" value="4" id="p4">
	    	<label for="p4">4</label>
	    	<input type="radio" name="star_input" value="5" id="p5">
	    	<label for="p5">5</label>
	  	</span>					
	</span>
	</div>
	<br/>
	
	<div class="control-group form-group">
			<div style="margin-left:200px;">
			<label>사진첨부 :</label> &nbsp;&nbsp;&nbsp;&nbsp;
			
		</div>
    </div>
    
    
    <div id="fileDiv">
	</div>
	<a href="#this" id="add" style="margin-left:200px;" >사진 추가하려면 클릭!!</a><br/>
	<div id="imgs_wrap" style="background:#edf8ff;margin-left:200px; width:70%"> 
	</div>
    
	<br/><br/>
    <div align='center'>
    <button type="button" class="btn btn-info" id="reviewRegiBtn">후기등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
    <br/><br/>
  </form>
  
  </div><!-- /.container -->
<script>
var starRating = function(){
	var $star = $(".star_input"),
	    $result = $star.find("output>b");
		
	  	$(document)
		.on("focusin", ".star_input>.input", 
			function(){
	   		 $(this).addClass("focus");
	 	})
			 
	   	.on("focusout", ".star_input>.input", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })
	  
	    .on("change", ".star_input :radio", function(){
	    	$result.text($(this).next().text());
	  	})
	    .on("mouseover", ".star_input label", function(){
	    	$result.text($(this).text());
	    })
	    .on("mouseleave", ".star_input>.input", function(){
	    	var $checked = $star.find(":checked");
	    		if($checked.length === 0){
	     	 		$result.text("0");
	   		 	} else {
	     	 		$result.text($checked.next().text());
	    		}
	  	});
	};
	starRating();
</script>



<script type="text/javascript">
		//var g_count =1;
		var cnt = 0;
		$(document).ready(function(){
			$("#add").on("click",function(e){
				e.preventDefault();
				fn_fileAdd();
			})
			
			$("#reviewRegiBtn").on('click', function(){
				if($("input:radio[name='star_input']:checked").val() == null) {
					alert("별점을 등록해주세요.");
					return false;
				}
				
				if (socket.readyState !== 1) return;
				socket.send("rv,${mtr_seq},${mtr_mem_email}");
				reviewForm.submit();

			});
			
		});
		//"+cnt+"번째 사진 : 
		function fn_fileAdd(){
			cnt++;
			var str = "<p style='margin-left:200px;'><label style='margin-top:8px;'class='btn btn-info btn-file'>파일추가<input type='file' idx='"+cnt+"' id='mtrrv_file' name='mtrrv_file' accept='.gif, .jpg, .png' onchange='fileUpload(this)' style='display:none'/></label>&nbsp;&nbsp;<a href='#this' idx='"+cnt+"' name='delete' class='btn btn-danger btn-file'>삭제하기</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click",function(e){
				e.preventDefault(); 
				//fn_fileDelete($(this));
				$(this).parent().remove();
				var i = $(this).attr("idx");
				var s = "loadImg"+i;
				var el = document.getElementById(s);
				el.remove();
			})
		}
		
		function fn_fileDelete(obj){
			//obj.parent().remove();
			//console.log($(obj).attr("idx"));
		}

	 function fileUpload(fis) {
		var str = fis.value;
		var idx = $(fis).attr("idx");
		//alert(index);
		var imgTag = "<img src='' idx='"+idx+"' id='loadImg"+idx+"' alt='' style='width:150px;height:150px;'/>";
		$("#imgs_wrap").append(imgTag);
		$('#span').text(fis.value.substring(str.lastIndexOf("\\")+1));
		// 이미지를 변경한다.
		var reader = new FileReader();
			reader.onload = function(e){
			$('#loadImg'+idx).attr('src',e.target.result);
			}
		reader.readAsDataURL(fis.files[0]);
	}
</script>
<%@ include file="../footer.jsp" %>