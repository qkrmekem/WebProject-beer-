<%@page import="kr.entity.pik.Paging"%>
<%@page import="kr.entity.pik.Article"%>
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
	<meta name="viewport"content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${cpath}/assets/css/main.css" />

<style type="text/css">
	table tr:hover td {
		background-color: #f7f7f78c;
	}
	
	a {
		text-decoration-line: none !important;
	}
	
	a:link {
		color: #5d5d5d;
	}
	
	a:visited {
		color: #5d5d5d;
	}
	

	img {
	  width: 184px;
	  height: 184px;
	  object-fit: contain;
	  border-radius: 10%
	}	  
 
</style>
<script>
	var idx = ${paging.getPage()};
	var max = ${paging.getEnd_page()};
	var last = ${paging.getTotal_page_count()}


	function goFirst(){
		if(idx != 1){
			location.href="${cpath}/articleList.pik?page=1";
		}
	}

	function goPrevious(){
		if(idx > 1){
			location.href="${cpath}/articleList.pik?page="+(idx-1);
		}
	}
	function goNext(){
	
		if(idx<max){
			location.href="${cpath}/articleList.pik?page="+(idx+1);
		}
	}
	function goLast(){
		if(idx != max){
			location.href="${cpath}/articleList.pik?page="+last;
		}
	}

</script>
</head>
<body class="left-sidebar is-preload">
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
						<section>
							<header class="major">
								<h2>Beer Review</h2>
							</header>
							<!-- 베스트후기 -->
							<div class="row">
								<c:forEach var="vo" items="${list2}">
									<div class="col-4 col-6-medium col-12-small" style="width: 20%; height: 100%;">
										<section class="box" style="padding:0;">
											<a href="${cpath}/articleView.pik?b_seq=${vo.b_seq}">
												<div>
													<img src="/imgReview/${vo.b_file}" alt=""  />
												</div>
												<header>
													<div style="font-style: italic; font-size:large; padding-left:10px;" >Best Review</div>
													<div style="font-style: italic; font-size:large; padding-left:10px; color:black;" >${fn:substring(vo.b_title,0,9)}...</div>
												</header>
											</a>
										</section>
									</div>
								</c:forEach>
							</div>	
						</section>
					</div>

					<div class="col-12">
						<!-- review -->
						<article class="box post">
							<div>
								<h2>HAKUNA MATATA</h2>
								<p style="font-style: italic;">Carpe diem, quam minimum
									credula postero. 현재를 잡아라, 내일이란 말은 최소한만 믿어라.</p>
								<table style="margin-bottom: 0">
									<thead>
										<tr>
											<th style="width: 15%; padding-left: 75px;">번호</th>
											<th style="width: 45%; padding-left: 75px;">제목</th>
											<th style="width: 15%; text-align: center">작성자</th>
											<th style="width: 15%; text-align: center">게시일</th>
											<th style="width: 10%; text-align: center">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="vo" items="${list}">
											<tr>
												<td style="width: 15%; padding-left: 50px;">${vo.b_seq}</td>
												<td style="width: 45%; padding-left: 50px;"><a
													href="${cpath}/articleView.pik?b_seq=${vo.b_seq}">${vo.b_title}</a>
												</td>
												<td style="width: 15%; text-align: center;">${vo.m_id}</td>
												<td style="width: 15%; text-align: center;">${fn:split(vo.b_date," ")[0]}</td>
												<td style="width: 10%; text-align: center;">${vo.b_cnt }</td>
											</tr>
										</c:forEach>
										<tr>

											<td colspan="5"><button onclick="goWriteForm()"
													style="padding: 10px 35px; margin-left: 10px; margin-right: 30px; margin-top: 20px; font-size: 1em; float: right;">글쓰기</button></td>
										</tr>
									</tbody>
								</table>
								<div align="center">
									<ul>
										<li style="display: inline-block;"><a href="javascript:void(0);" onclick="goFirst();">《</a></li>
										<li style="display: inline-block;"><a href="javascript:void(0);" onclick="goPrevious();">◀</a></li>
										<c:forEach var="i" begin="${paging.getStart_page()}"
											end="${paging.getEnd_page()}" step="1">
											<li style="display: inline-block;">
												<c:if test="${i!=paging.page }"><a href="${cpath }/articleList.pik?page=${i}">${i }</a></c:if>
												<c:if test="${i==paging.page}"><a href="${cpath }/articleList.pik?page=${i}" style="font-size: large; font-weight: bold; border-left :solid 1px #ccc; border-right :solid 1px #ccc; padding: 0 10px;">${i}</a></c:if>
												
												
											</li>
										</c:forEach>
										<li style="display: inline-block;"><a href="javascript:void(0);" onclick="goNext();">▶</a></li>
										<li style="display: inline-block;"><a href="javascript:void(0);" onclick="goLast();">》</a></li>
									</ul>
								</div>
							</div>
							<div></div>
						</article>
					</div>

				</div>
			</div>
		</section>
		<!-- Footer -->
		<%@ include file="footer.jsp"%>

	</div>



	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
		function goArticleView(){
			location.href="${cpath}/articleView.pik?b_seq="${vo.b_seq};
		}
		function goWriteForm(){
			if(!"${mvo}"){
				open_popup();
			}else{
				location.href="${cpath}/articleWriteForm.pik";	
			}
			
		}
	</script>

</body>
</html>