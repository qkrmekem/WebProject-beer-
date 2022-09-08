<%@page import="kr.entity.pik.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!-- jstl함수를 가져오는 코드 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 줄 바꿈을 객체바인딩 -->
<%
pageContext.setAttribute("newLineChar", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Beer</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${cpath}/assets/css/main.css" />
<style type="text/css">
	table tr:hover td {
		background-color: #f7f7f78c;
	}
	a {
		text-decoration-line: none !important;
	}
	a:link {
		color: #5D5D5D;
	}
	a:visited {
		color: #5D5D5D;
	}
	
	.updatefunction{
	    font-size: xx-small;
	    width: 60px !important;
	    padding: 0.4em 0.65em 0.4em 0.65em;
	    margin-left: 2em;
	    background-color: #BFBEBD;
	}
	.updatefunction:hover{
	    background-color: #F2CB05;
	}

	img {
	  width: 600px;
	  height: 450px;
	  object-fit: contain;
	}	  

</style>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">
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
				<div class="row">
					<div class="col-12">

								<!-- review -->
							<article class="box post" style="padding:40px 28px 80px 28px">
								<div>
									<h2>EVENT</h2>
									<br>
									<p style="font-style: italic;">현재 진행중인 이벤트는 업체사정으로 취소될 수 있습니다.</p>
									<table style="margin:0">
										<tr style="border-bottom:solid 1px #ccc">
											<td style="width: 15%; text-align:center;">번호</td>
											<td style="width: 45%; text-align:center">제목</td>
											<td style="width: 15%; text-align: center">작성자</td>
											<td style="width: 15%; text-align: center">게시일</td>
											<td style="width: 10%; text-align: center">조회수</td>
										</tr>
									</table>	
									<c:forEach var="vo" items="${list}">
										<table style="margin:0">
											<tr onclick="eventView('${vo.b_seq}')" style="border-bottom:solid 1px #ccc">
												<td style="width: 15%; padding-left: 50px;">${vo.b_seq}</td>
												<td style="width: 45%; padding-left: 50px;">${vo.b_title}</td>		
												<td style="width: 15%; text-align: center;">${vo.m_id}</td>
												<td style="width: 15%; text-align: center;">${fn:split(vo.b_date," ")[0]}</td>
												<td style="width: 10%; text-align: center;">${vo.b_cnt }</td>
											</tr>
										</table>
										<div class="plz ${vo.b_seq}" style="display:none; text-align:center; border:solid 1px #ccc;  margin:15px 120px; padding-bottom:35px; padding-right:15px;">
											<c:if test="${vo.b_file!='null'}">
										 		<div style="width:100%;  text-align:center;" >
										 			<img src = "/imgNotice/${vo.b_file}" ">
										 		</div>
											</c:if> 	
											<div style="display:inline-block; align:center; text-align:center; width:90%; margin:30px">${fn:replace(vo.b_content,newLineChar,"<br/>") }</div>													
											<span style="float:right"><button class="updatefunction" style= "display:none;" onclick='adminView("${vo.b_seq}")'>수정</button></span>
										</div>
									</c:forEach>
									<div>
										<button id="onlywrite" onclick="goeventWriteForm()"
											style="padding: 10px 35px; margin-left: 10px; margin-right: 30px; margin-top: 20px; font-size: 1em; float: right; display: none">
											글쓰기</button>
									</div>	
								</div>
							</article>
							</div>
						</div>
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
	<script>
		
		function goeventView(){
			location.href="${cpath}/eventView.pik?b_seq="${vo.b_seq};
		}
		function goeventWriteForm(){
			location.href="${cpath}/eventWriteForm.pik";
		}
		var loginID = "${mvo.m_id}";
		
	
      $(document).ready(function(){
            if(loginID=="administrator"){
			 $('#onlywrite').css('display','block');
			
            }
        });
      //
      
      function otherView(){
    $(".plz").css("display","none");
	}
      
     function adminView(b_seq){
    	 if(loginID=="administrator"){
    		 location.href="${cpath}/eventView.pik?b_seq="+b_seq;
         }
     };
     //
      function eventView(ff){
    	 
    	 if($("."+ff).css("display")=="none"){
    		 otherView();
    		 $("."+ff).css("display","block");
    	  		
      		 if(loginID=="administrator"){
      			 
    	  		 $('.updatefunction').css('display','block');	
      		 }
    	 }else {
    		 $("."+ff).css("display","none");
    	 }
    	 
  	}
 
     
      function getDownload(b_file) {
    		location.href="${cpath}/eventDownload.pik?b_file="+b_file;
    	}
	</script>
</body>
</html>