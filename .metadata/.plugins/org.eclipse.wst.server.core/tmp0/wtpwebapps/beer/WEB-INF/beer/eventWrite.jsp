<%@page import="kr.entity.pik.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 
	session = request.getSession();
	Member mvo = (Member)session.getAttribute("mvo");
%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Beer</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${cpath}/assets/css/main.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	  	function goList(){
	  		location.href="${cpath}/event.do";
	  	};
	  	
	  	$(function () {
			$("#b_file").on('change',function(){
		    	var fileName = $("#b_file").val();
		    	$(".upload-name-pik").val(fileName);
	    	});
		});
	  	
  	
  </script>
  <style type="text/css">
  	.upload-name-pik{
    display: inline-block;
    height: 30px;
    padding: 1px 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 30%;
    color: #999999;
    margin:0px 10px 12px 20px;
	}
	.label-for-file {
	    display: inline-block;
	    padding: 1px 10px;
	    color: #fff;
	    vertical-align: middle;
	    background-color: #ccc;
	    cursor: pointer;
	    height: 30px;
	    margin:0px 10px 12px 10px ;
	}
	.EventFile_pik input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	
  </style>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper" >
		<!-- Header -->
		<section id="header" style="padding-top: 0; padding-bottom: 0;">
			<!-- Logo&Nav-->
			<%@ include file="nav.jsp"%>
			<%@ include file="login.jsp"%>
		</section>
		<!-- 지우면 안되는 태그입니다 -->
		
		<!-- Main -->
		<section id="main">
			<div class="container">
				
				<article class="box post">
					<div>
						<h2 style="font-size:20px !important; ">무슨이벤트를 열것인가</h2><br>
						<p style="font-style: italic;">항상 견고하게 항상 부드럽게 사람들한테 돈을</p>
						<div class=".viewbox_pik" style="border: 1px solid #ccc; border-radius: 2%; padding: 20px 20px 100px 20px">
							<div class="EventContentBox_pik">
								<form action="${cpath}/eventWrite.pik" method="post" enctype="multipart/form-data">
									<div class="event_header_pik" style="position: relative; margin-bottom: 20px; padding: 0 20px; border-bottom: 1px solid #ccc;">
										<div class="EventTitle_pik" style="font-size: 13px;">										
											<input type="text" name="b_title" class="form-control" style="font-size: 1.5em; width: 100%; padding: 0; margin-bottom: 20px;"/>
										</div>
									</div>
								
									<div class="event_container_pik">
										<div class="EventFile_pik">
											<input class="upload-name-pik" value="첨부파일" placeholder="첨부파일">
											<label for="b_file" class="label-for-file">파일찾기</label>	
											<!-- 아래 input이 파일관련 input입니다!!-->								
											<input type="file" id="b_file" name="b_file"class="form-control" />
										</div>
										<div class="_viewer_pik" style="padding: 0 20px; min-height: 100px;">
											<textarea rows="20" name="b_content" class ="form-control"></textarea>
										</div>
									</div>
									<div>
										<span style="float:right; margin-top:27.5px">
											<button type="submit" style="padding: 10px 35px; margin-left: 10px; font-size: 1em;">완료</button>
											<button onclick="goList()" style="padding: 10px 35px; margin-left: 10px; margin-right:30px; font-size: 1em;"  class="button alt large" >취소</button>
										</span>
									</div>
								</form>
							</div>
						</div>
					</div>
				</article>
			</div>
		</section>
		<!-- Footer -->
		<%@ include file="footer.jsp"%>

	</div>
	<!-- 지우면 안되는 태그입니다 -->

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	
</body>
</html>
	