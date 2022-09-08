<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLineChar","\n"); %>
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
  		location.href="${cpath}/eventList.pik";
  	}
  	function goDel(b_seq){
  		location.href="${cpath}/eventDelete.pik?b_seq="+b_seq;
  	}
  	function goUpdate(b_seq){
  		location.href="${cpath}/eventUpdateForm.pik?b_seq="+b_seq;
  	}
  </script>
  <style>
 	img {
	  width: 600px; 
	  height: 900px; 
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
				<!-- Content -->
				<article class="box post">
					<div>
						<h2>오늘의 이벤트는 이겁니다</h2>
						<p style="font-style: italic;">뇌빼기를 하면 한번 더 뇌빼기를 하게되요</p>
						<div class=".viewbox_pik" style="border: 1px solid #ccc; padding: 20px">
							<div class="EventContentBox_pik">
								<div class="event_header_pik" style="position: relative; margin-bottom: 20px; padding: 0 20px; border-bottom: 1px solid #ccc;">
									<div class="EventTitle_pik" style="font-size: 13px;">
										<table>
											<tr>
												<td style="font-size: 1.3em; width: 5%; padding: 0">${vo.b_seq}</td> 
												<td id="title"style="font-size: 1.5em; width: 55%; padding: 0">${vo.b_title}</td>
												<td style="font-size: 1.3em; width: 15%; padding: 0">${vo.m_id}</td>
												<td style="font-size: 1.3em; width: 15%; padding: 0">${fn:split(vo.b_date," ")[0]}</td>
												<td style="font-size: 1.3em; width: 10%; padding: 0">${vo.b_cnt}</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="event_container_pik">
									<c:if test="${vo.b_file!='null'}">
									<div style="padding: 0 20px; min-height: 50px;"><img src = "/imgNotice/${vo.b_file}" >${vo.b_file}</div>
									</c:if>
									<div class="event_viewer_pik" style="align:center; padding: 0 20px; min-height: 100px;">${fn:replace(vo.b_content,newLineChar,"<br/>") }</div>
								</div>
								<div class="ReplyBox_pik" style="position: relative; margin-bottom: 27px; line-height: 19px;">
									<div class="like_event_pik" style="display: inline-block; position: relative; vertical-align: top; font-size: 13px;">
									</div>
								</div>
								<span>
									<button onclick="goList()" style="padding: 10px 35px; margin-left: 10px; font-size: 1em; background:#BFBFBF"  class="button alt large" >목록</button>
								</span>
								<span id="edit-del" style="display:none; float:right">
									<button onclick="goUpdate(${vo.b_seq})" style="padding: 10px 35px; margin-left: 10px; font-size: 1em; "  class="button alt large" >수정</button>
									<button onclick="goDel(${vo.b_seq })" style="padding: 10px 35px; margin-left: 10px; margin-right:30px; font-size: 1em; "  class="button large" >삭제</button>
								</span>
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
	
	<script type="text/javascript">
	
		
		var loginID = "${mvo.m_id}";
		var eventID = "${vo.m_id}";

      $(document).ready(function(){
            if(loginID==eventID){
			 $('#edit-del').css('display','inline');
            }
        });
	</script>
</body>
</html>