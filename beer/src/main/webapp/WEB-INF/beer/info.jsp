<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>    

<%@page import="java.util.*, java.text.*" %>

<%
	/* Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String ntime = sf.format(nowTime); */
	
	Calendar cal = Calendar.getInstance();
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Beer</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${cpath}/assets/css/main.css" />
		<style type="text/css">
				.beer_search_head_td{
					width: 400px;
				}
				tr.beer_search_tr > td { padding : 20px 0px 20px 0px; margin : 20px 0px 20px 0px; text-align: center; }	
				tr.beer_search_tr:hover { background-color: beige; }
		
				#info_right_btn{
					position:relative;
					left:585px;
					visibility : hidden;
				}
				#info_left_btn{
					position:relative;
					visibility : hidden;
				}						
				
				.search_div{
					margin: auto;
					
					display: flex; 
					justify-content:center;					
					text-align:center; 
					overflow:hidden; 
					
					border: 3px solid gold; 
					border-radius: 50%; 
					-moz-border-radius: 50%; 
					-khtml-border-radius: 50%; 
					-webkit-border-radius: 50%; 
					
					width:500px; 
					height:500px;
				}	
				.search_img{				
					object-fit: cover; 
					max-width: 100%; 
					height: auto;
				}
				.count_div{
					position:relative; 
					left:315px; 
					top:-20px;
										
					display: flex; 
					justify-content:center;	
					text-align:center; 
					overflow:hidden; 
					
					background-color:white; 
					border: 3px solid beige; 
					border-radius: 50%; 
					-moz-border-radius: 50%; 
					-khtml-border-radius: 50%; 
					-webkit-border-radius: 50%; 
					width:50px; height:50px;
				}
				
				#buttion2_div{
					position:absolute;
					top: 35%;
				}
		</style>
		
		
		<script type="text/javascript">
		$(document).ready(function(){
			console.log("info");			
			$("#info_btn").addClass("current");					
			call();		
		})
		
		async function call(){
			await All_load();
			await Side_load();
		}
		
		function Side_load() {
			console.log("side_list");
			$.ajax({
				url:"${cpath}/beerSideList.pik",
				type:"get",
				success: function (data) {	
					if (data != ""){
						var str1 = data.split('/')[0];
						var str2 = data.split('/')[1];
						var str3 = data.split('/')[2];						
						$("#before_recommend_beer1").html("<a style='text-decoration-line: none !important;' href='${cpath}/beerSearchForm.pik?name="+str1+"' id='before_recommend_beer1'>1. "+str1+"</a>");
						$("#before_recommend_beer2").html("<a style='text-decoration-line: none !important;' href='${cpath}/beerSearchForm.pik?name="+str2+"' id='before_recommend_beer1'>2. "+str2+"</a>");
						$("#before_recommend_beer3").html("<a style='text-decoration-line: none !important;' href='${cpath}/beerSearchForm.pik?name="+str3+"' id='before_recommend_beer1'>3. "+str3+"</a>");
					}											
				},
				error:function(){ console.log("Admin account is not enough data for beer")}
			})			
		}
		
		function All_load(){
			// 게시판 리스트 가져오기			
			$.ajax({
				url : "${cpath}/beerRecommendList.pik",
				type : "get",				
				dataType : "json",
				success : resultHTML,
				error:function(){ console.log("Admin account is not enough data for beer")}
			});
		}	
		
		var index_max = 0;
		function resultHTML(data){ // data=[{ },{ }]		
			var html="";
		
			$.each(data,function(index,beer){
			if (index == 0){	
					html += "<div id='div_index_"+index+"' style='display:block;'>";
					html += "<div class='count_div'><h3 style='color:red; object-fit: cover; max-width: 100%; height: auto;'>"+(index+1)+"</h3>";
					html += "</div>";
					
					html += "<div class='search_div' id='search_img_"+index+"'>";
					html += "<img class='search_img' src="+beer.BEER_SRC+">";					
					html += "</div>";
					
					html += "<section>";	
					//table
					html += "<table>";					
					//title
					html += "<tr class='beer_search_tr'>";
					html += "<td colspan='2' class='beer_search_head_td'>";
					html += "<h2 style='padding-top:20px;'>"+beer.BEER_NAME+"</h2>";	
					html += "</td>";
					html += "</tr>";
					//1
					html += "<tr class='beer_search_tr'>";
					html += "<td class='beer_search_head_td'><h3>Beer From</h3></td>";
					html += "<td>";
					html += "<h4>"+beer.FROM_SEQ+"</h4>";		
					html += "</td>";					
					html += "</tr>";
					//2
					html += "<tr class='beer_search_tr'>";					
					html += "<td class='beer_search_head_td'><h3>Beer Aroma</h3></td>";	
					html += "<td>"; 
					html += "<h4>"+beer.AROMA_SEQ+"</h4>";
					html += "</td>";
					html += "</tr>";	
					//3
					html += "<tr class='beer_search_tr'>";
					html += "<td><h3>Beer Taste</h3></td>";
					html += "<td>"; 
					
					if (beer.TASTE_SEQ3 == null){
						html += "<h4>"+beer.TASTE_SEQ+" / "+beer.TASTE_SEQ2+"</h4>";
					} else {
						html += "<h4>"+beer.TASTE_SEQ+" / "+beer.TASTE_SEQ2+" / "+beer.TASTE_SEQ3+"</h4>";
					}
					
					html += "</td>";			
					html += "</tr>";
					//4
					html += "<tr class='beer_search_tr'>";
					html += "<td class='beer_search_head_td'><h3>Beer ABV</h3></td>";
					html += "<td class='beer_search_head_td'>"; 
					html += "<h4>"+beer.BEER_ABV+"</h4>";
					html += "</td>";					
					html += "</tr>";
					//5
					html += "<tr class='beer_search_tr'>";
					html += "<td class='beer_search_head_td'><h3>Beer Country</h3></td>";
					html += "<td>"; 
					html += "<h4>"+beer.COUNTRY_CD+"</h4>";
					html += "</td>";					
					html += "</tr>";					
					html += "</table>";
					html += "</section>";
					html += "</div>";
											
				} else {
					
					html += "<div id='div_index_"+index+"' style='display:none;'>";
					html += "<div class='count_div'><h3 style='color:red; object-fit: cover; max-width: 100%; height: auto;'>"+(index+1)+"</h3>";
					html += "</div>";
					
					html += "<div class='search_div' id='search_img_"+index+"'>";
					html += "<img class='search_img' src="+beer.BEER_SRC+">";					
					html += "</div>";
					
					html += "<section>";	
					//table
					html += "<table>";					
					//title
					html += "<tr class='beer_search_tr'>";
					html += "<td colspan='2' class='beer_search_head_td'>";
					html += "<h2 style='padding-top:20px;'>"+beer.BEER_NAME+"</h2>";	
					html += "</td>";
					html += "</tr>";
					//1
					html += "<tr class='beer_search_tr'>";
					html += "<td class='beer_search_head_td'><h3>Beer From</h3></td>";
					html += "<td>";
					html += "<h4>"+beer.FROM_SEQ+"</h4>";		
					html += "</td>";					
					html += "</tr>";
					//2
					html += "<tr class='beer_search_tr'>";					
					html += "<td class='beer_search_head_td'><h3>Beer Aroma</h3></td>";	
					html += "<td>"; 
					html += "<h4>"+beer.AROMA_SEQ+"</h4>";
					html += "</td>";
					html += "</tr>";	
					//3
					html += "<tr class='beer_search_tr'>";
					html += "<td><h3>Beer Taste</h3></td>";
					html += "<td>"; 
					
					if (beer.TASTE_SEQ3 == null){
						html += "<h4>"+beer.TASTE_SEQ+" / "+beer.TASTE_SEQ2+"</h4>";
					} else {
						html += "<h4>"+beer.TASTE_SEQ+" / "+beer.TASTE_SEQ2+" / "+beer.TASTE_SEQ3+"</h4>";
					}
					
					html += "</td>";			
					html += "</tr>";
					//4
					html += "<tr class='beer_search_tr'>";
					html += "<td class='beer_search_head_td'><h3>Beer ABV</h3></td>";
					html += "<td class='beer_search_head_td'>"; 
					html += "<h4>"+beer.BEER_ABV+"</h4>";
					html += "</td>";					
					html += "</tr>";
					//5
					html += "<tr class='beer_search_tr'>";
					html += "<td class='beer_search_head_td'><h3>Beer Country</h3></td>";
					html += "<td>"; 
					html += "<h4>"+beer.COUNTRY_CD+"</h4>";
					html += "</td>";					
					html += "</tr>";					
					html += "</table>";
					html += "</section>";
					html += "</div>";
				}	
				index_max = index;
			})		
			
			$("#beer_info").html(html);			
			$("#info_right_btn").css("visibility", "visible");
			$("#info_left_btn").css("visibility", "visible");
						
		}
		
		var index = 0;
		function goleft(){
			if (index > 0){
				$("#div_index_"+index).css('display','none');
				index-=1;
				$("#div_index_"+index).css('display','block');				
			} else if (index==0){
				$("#div_index_"+index).css('display','none');
				index = index_max;
				$("#div_index_"+index).css('display','block');				
			}				
		}		
		function goright(){
			if (index+1 > index_max){
				$("#div_index_"+index).css('display','none');
				index = 0;
				$("#div_index_"+index).css('display','block');				
			} else {
				$("#div_index_"+index).css('display','none');
				index+=1;
				$("#div_index_"+index).css('display','block');				
			}	
		}
		
	</script>
	</head>
	<body class="left-sidebar is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header" style="padding-top: 0; padding-bottom: 0;">					

					<!-- Nav -->
					<%@ include file="nav.jsp"%>
					<%@ include file="login.jsp"%>

				</section>

			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-4 col-12-medium">

								<!-- Sidebar -->
									
									<section class="box">
										<header>
											<h3>Before Recommend Beer</h3>
										</header>
										<p> <%= cal.get(Calendar.YEAR) %>년
										    <%= cal.get(Calendar.MONTH) + 1%>월
										    <%= cal.get(Calendar.DATE)  %>일 </p>
										<ul class="divided">
											<li id="before_recommend_beer1"><a href='${cpath}/beerSearchForm.pik' style="text-decoration-line: none !important;" >오늘 기분은 어떠세요?</a></li>
											<li id="before_recommend_beer2"><a href='${cpath}/beerSearchForm.pik' style="text-decoration-line: none !important;">힘들지는 않았나요?</a></li>
											<li id="before_recommend_beer3"><a href='${cpath}/beerSearchForm.pik' style="text-decoration-line: none !important;">색 다른 맥주를 원하세요?</a></li>		
										
										</ul>										
									</section>
									
							</div>
							<div class="col-8 col-12-medium imp-medium">
									<div id="buttion2_div">
										<button id="info_left_btn" onclick="goleft()">◀</button>								
										<button id="info_right_btn" onclick="goright()">▶</button>
									</div>									
									<!-- Content -->																		
									<div id="beer_info" class="box post">	
										<!-- 여기에 자료 in -->							
									</div>
									

							</div>
						</div>
					</div>
				</section>

			<!-- Footer -->
				<section id="footer">
					<%@ include file="footer.jsp" %>
				</section>

		</div>

		<!-- Scripts -->
			<script src="${cpath}/assets/js/jquery.min.js"></script>
			<script src="${cpath}/assets/js/jquery.dropotron.min.js"></script>
			<script src="${cpath}/assets/js/browser.min.js"></script>
			<script src="${cpath}/assets/js/breakpoints.min.js"></script>
			<script src="${cpath}/assets/js/util.js"></script>
			<script src="${cpath}/assets/js/main.js"></script>

	</body>
</html>