 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>    

<%@page import="java.util.*, java.text.*" %>
<%	
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
					/* visibility : hidden; */
				}
				#info_left_btn{
					position:relative;
					/* visibility : hidden; */
				}
				#go_btn{
					position:relative;	
					left:610px;	
					
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
					left:310px; 
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
					top: 55%;
				}
				#buttion1_div{
					position:absolute;
					top: 15.5%;
				}
				.beer_option_select{
					all: unset;
					background-color: beige;
					color: black;
					padding: 5px 20px;
					border-radius: 10px;
					cursor: pointer; 
					font-weight:bold;
				}
				
	</style>
	
	<script type="text/javascript">	
		$(document).ready(function(){  			
			
			$("#search_btn").addClass("current");
			Side_load();
			
			$("#beer_name").val("${name}");
		}); 
		
			
		
		function Side_load() {
			console.log("side_list");
			$.ajax({
				url:"${cpath}/beerSideList.pik",
				type:"get",
				success:function (data) {					
					if (data != ""){
						var str1 = data.split('/')[0];
						var str2 = data.split('/')[1];
						var str3 = data.split('/')[2];
						$("#before_recommend_beer1").html('1. '+str1+' ');
						$("#before_recommend_beer2").html('2. '+str2+' ');
						$("#before_recommend_beer3").html('3. '+str3+' ');
					}								
				},
				error:function(){ console.log("Admin account is not enough data for beer")}
			})			
		}
		
		function getInsert() {			
			$("#search_img").css("display", "none");			
			var fdata = $("#bfrm").serialize();			
			$.ajax({
				url :  "${cpath}/beerSearchList.pik",
    			type : "post",
    			data : fdata,   
    			dataType : 'json',
    			success : viewList, //다시 리스트 호출
    			error : function() {alert("error");}
			})			
		}		
		
		$(function (){
			$("#go_btn").click(function(){
				
				var str = $("#beer_name").val();	
				var op1 = $("#beer_option1").val();				
				var op2 = $("#beer_option2").val();
				var op3 = $("#beer_option3").val();
				
				if (str != ""){
					getInsert();
				}
				else if (op1 != "null" && op2 != "null" && op3 != "null"){
					getInsert();					
				} else {
					alert("맥주의 이름 또는 취향 3가지를 입력하세요");
				}		
			})
		})
		
		var searchtf = false;
		
		var index_max = 0;
		function viewList(data) {				
			var html="";
			
			if (searchtf){
				$("#beer_info").empty();
				index_max = 0;
				index=0;
			}
			
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
			searchtf = true;
			
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
										    <%= cal.get(Calendar.DATE) %>일 </p>
										<ul class="divided">
											<li><a href='#' id="before_recommend_beer1" style="text-decoration-line: none !important;">오늘 기분은 어떠세요?</a></li>
											<li><a href='#' id="before_recommend_beer2" style="text-decoration-line: none !important;">힘들지는 않았나요?</a></li>
											<li><a href='#' id="before_recommend_beer3" style="text-decoration-line: none !important;">색 다른 맥주를 원하세요?</a></li>											
										</ul>										
									</section>

							</div>
							<div class="col-8 col-12-medium imp-medium">
							
								<div id="buttion2_div">
									<button id="info_left_btn" onclick="goleft()">◀</button>								
									<button id="info_right_btn" onclick="goright()">▶</button>									
								</div>									
								<div id="buttion1_div">									
									<button id="go_btn">Search!</button>
								</div>		
								
								<!-- Content -->									
									<div class="box post" style="background-color:white;">
										<!--<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>-->
										
										<form id="bfrm">
										
										<div style="margin:auto;">
												<p style="display:inline; font-size:40px; font-weight: bold;"> Name : </p>
												<input style="all:unset; background-color: beige; color: black;padding: 5px 20px;border-radius: 10px;cursor: pointer; font-weight:bold; width:60%" 
												type="text" name="beer_name" id="beer_name">
												<br><br>
												<div style="margin:auto; padding-top: 10px; padding-bottom:10px; display:inline">
												<h3 style="display:inline;"> Aroma :  </h3>
												<select name="beer_aroma" id="beer_option1" class="beer_option_select">
													<option selected value="null"> choose ▽  </option>
													<option value= 1 >에일</option>
													<option value= 2 >라거</option>												
													<option value= 3 >밀맥주</option>
													<option value= 4 >필스너</option>
													<option value= 5 >흑맥주</option>												
													<option value= 6 >기타</option>											
												</select>												
											</div><span>&nbsp</span>
											
											<div style="margin:auto; display:inline;">
												<h3 style="display:inline;"> From :  </h3>
												<select name="beer_from" id="beer_option2" class="beer_option_select">
													<option selected value="null"> choose ▽  </option>
													<option value= 1 >국내</option>
													<option value= 2 >해외</option>													
												</select>	
											</div><span>&nbsp</span>
																										
											<div style="margin:auto; padding-top: 10px; display:inline">
												<h3 style="display:inline;"> Taste :  </h3>
												<select name="beer_taste" id="beer_option3" class="beer_option_select">
													<option selected value="null"> choose ▽  </option>
													<option value= 1 >Sweet</option>
													<option value= 2 >Dry</option>
													<option value= 3 >Soft</option>
													<option value= 4 >Deep</option>
													<option value= 5 >Bitter</option>													
												</select>
											</div>				
										</div><br><br>										
											
											
										</form>
											
										<div id="search_img" style="margin:auto; background-image:url(https://t1.daumcdn.net/cfile/tistory/2508675051FDB0B02D);
										border: 3px solid gold; border-radius: 50%; -moz-border-radius: 50%; -khtml-border-radius: 50%; -webkit-border-radius: 50%; width:600px; height:600px;">
											
										</div>											
										<div id="beer_info">										
											<br><h2 id="wuw" style="margin:auto; text-align: center;"> What U want? </h2>
										</div>		
									</div>
									

							</div>
						</div>
					</div>
				</section>

			<!-- Footer -->
				<section id="footer">
				<%@ include file="footer.jsp"%>
					
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