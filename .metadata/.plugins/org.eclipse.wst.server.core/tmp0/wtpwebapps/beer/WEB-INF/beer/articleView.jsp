<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLineChar","\n"); %>
<% pageContext.setAttribute("spaceChar","\n"); %>
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
  		location.href="${cpath}/articleList.pik?page=1";
  	}
  	function goDel(b_seq){
  		location.href="${cpath}/articleDelete.pik?b_seq="+b_seq;
  	}
  	function goUpdate(b_seq){
  		location.href="${cpath}/articleUpdateForm.pik?b_seq="+b_seq;
  	}
  	
  	function writeReply(){
  		
  		
  		var r_re = $("#r_re").val();
  		var new_reply="";
  		$.ajax({
  			url:"${cpath}/articleReply.pik",
  			type:"post",
  			data:{"reply":"write","b_seq":"${vo.b_seq}","m_id":"${mvo.m_id}","r_re":r_re},
  			dataType:"json",
  			success: function(data){

  				new_reply+="<tr id="+data.r_seq+" style='border:none'>";
  				new_reply+="<td >"+data.m_id+"</td>";
  				new_reply+="<td ><span>"+data.r_re+"</span>";
				new_reply+='<span style="margin-left:10px; margin-right:5px" >'+data.r_date+'</span>'	
  				new_reply+='<span><button onclick="replyDelete('+data.r_seq+')" style=" font-size: 5px; background-color: #ccc; width: 40px !important; padding:0.2em 0;margin-left: 2em;">삭제</button></span>';
  				new_reply+="</td></tr>"; 				
  				$("#new-reply").before(new_reply);
  				$("#r_re").val("");

  			}
  			
  			
  		});
  		
  	}
  	function replyDelete(r_seq){

  		$.ajax({
  			url:"${cpath}/articleReply.pik",
  			type:"post",
  			data:{"reply":"delete","r_seq":r_seq},
  			success: function(){
  				$("#"+r_seq).remove();
  			},	
  		});
  		
  	}
  	
  	
  </script>
  <style> 
	img {
	  width: 600px;
	  height: 400px;
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
			<%@ include  file="login.jsp"%>
		</section>
		<!-- 지우면 안되는 태그입니다 -->
		<!-- Main -->
		<section id="main">
			<div class="container">
				<!-- Content -->
				<article class="box post">
					<div>
						<h2>HAKUNA MATATA</h2>
						<p style="font-style: italic;">Carpe diem, quam minimum credula postero. 현재를 잡아라, 내일이란 말은 최소한만 믿어라.</p>
						<div class=".viewbox_pik" style="border: 1px solid #ccc; padding: 20px">
							<div class="ArticleContentBox_pik">
								<div class="article_header_pik" style="position: relative; margin-bottom: 20px; padding: 0 20px; border-bottom: 1px solid #ccc;">
									<div class="ArticleTitle_pik" style="font-size: 13px;">
										<table>
											<tr>
												<td style="font-size: 1.3em; width: 5%; padding: 0">${vo.b_seq}</td> 
												<td id="title"style="font-size: 1.2em; width: 60%; padding: 0">${vo.b_title}</td>
												<td style="font-size: 1.3em; width: 15%; padding: 0">${vo.m_id}</td>
												<td style="font-size: 1.3em; width: 15%; padding: 0">${fn:split(vo.b_date," ")[0]}</td>
												<td style="font-size: 1.3em; width: 10%; padding: 0">${vo.b_cnt}</td>
											</tr>
										</table>
									</div>
								</div>
								
								<!--  파일관련 영역 start-->
								
								<!-- 파일관련영역 end -->
								<div class="article_container_pik">
									<c:if test="${vo.b_file!='null'}">
										<div class="article_container_pik">
											<div class="article_file_pik" style=" border-bottom:none;"><img src = "/imgReview/${vo.b_file}"></div>
										</div>
									</c:if>								
									<div class="article_viewer_pik" style=" border-bottom: 1px solid #ccc; margin-bottom:5px; padding:10px 20px 25px 20px; min-height: 100px;">${fn:replace(vo.b_content,newLineChar,"<br/>") }</div>
								</div>
								<div class="ReplyBox_pik" style="position: relative; margin-bottom: 5px; line-height: 19px;">
									<div class="like_article_pik" style="display: inline-block; position: relative; vertical-align: top; font-size: 13px;">
									
										<table style='border:none'>
									  		<c:forEach var="rvo" items="${list}">
									  			<tr id="${rvo.r_seq}" style="border:none">
													<td >${rvo.m_id}</td>
													<td >
														<span>${fn:replace(rvo.r_re,spaceChar," ")}</span>
														<span style="margin-left:10px; margin-right:5px" >${rvo.r_date}</span>
														<c:if test="${mvo.m_id==rvo.m_id}">	
															<span>
																<button onclick="replyDelete('${rvo.r_seq}')" style=" font-size: 5px; background-color: #ccc; width: 40px !important; padding:0.2em 0;margin-left: 2em;">삭제</button>
															</span>
														</c:if>
													</td>		 	
												</tr>	
									  		</c:forEach>
									  			<tr id="new-reply" style="border:none"></tr>						  		
									    </table>

									</div>
								</div>
								<div class="CommentBox_pik" style="margin-top:0px;">
									<div class="CommentWriter_pik" style="margin:0 0 10px 0; padding:0 5px 10px 5px; border-radius: 6px; box-sizing: border-box;">
										<div class="comment_inbox_pik" style="position: relative; margin-bottom: 10px;">	
											<textarea placeholder="댓글을 남겨보세요" rows="1" id="r_re" name="r_re" class="comment_inbox_text_pik" style="width: 100%;height: 100px !important;"></textarea>
										</div>
									</div>
								</div>
								<span>
									<button onclick="writeReply()" style="padding: 10px 35px; margin-left: 30px; font-size: 1em; "  class="button alt large" >댓글</button>
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
		var articleID = "${vo.m_id}";
		
	
      $(document).ready(function(){
            if(loginID==articleID){
			 $('#edit-del').css('display','inline');
            }
        });
	</script>
</body>
</html>