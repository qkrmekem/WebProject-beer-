 <%@page import="kr.entity.pik.Member"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Beer</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${cpath}/assets/css/main.css" />
	<style>
		
		#main_beer_info{	
			overflow:hidden;			
			display:none;
			position:absolute;
			top:150px;
			left:120px;
			width:1300px;
			height:670px;
			z-index:1;			
			border: 3px solid beige; 
			border-radius: 35%; 
			-moz-border-radius: 35%; 
			-khtml-border-radius: 35%; 
			-webkit-border-radius: 35%;
			margin:auto;			
		}
		#main_beer_info_back{
			display:none;
			background-color: black;
			position:absolute;
			top:150px;
			left:120px;
			width:1300px;
			height:670px;
			z-index:1;	
			opacity: 0.8;
			border: 3px solid beige; 
			border-radius: 35%; 
			-moz-border-radius: 35%; 
			-khtml-border-radius: 35%; 
			-webkit-border-radius: 35%;
			margin:auto;			
		}
		#main_beer_table{			
			text-align:center;
			justify-content:center;	
			vertical-align:middle;
			position:absolute;
			left:200px;
			top:80px; 
			margin:auto;					
			border: 3px solid #606060;
			width: 70%;
			height: 50%;
			table-layout: fixed;
			z-index: 2;
		}
		#main_beer_table tr{
			display:flex;			
			margin:auto;
			justify-content:center;			
			text-align: center; 
		}
		#main_beer_table td{		
			display:flex;				
			margin:auto;		
			justify-content:center;		
			text-align: center;
		}
		
		#main_beer_table h2,h3{
			color:beige !important;		
		}
	</style>
	<script type="text/javascript">	
		$(document).ready(function(){			
			$("#home_btn").addClass("current");				
			initMap
		}) 		
		$(function () {
			$("#main_img").click(()=>{
				$("#intro").css("display","none");
				$("#banner").css("display","block");				
			})	
			$("#main_logo1").click(()=>{
				$("#intro").css("display","none");
				$("#banner").css("display","block");	
			})	
		})			
		function goLogIn(){
				location.href="${cpath}/loginForm.pik"
		}		
		function goLogOut(){
			 if (confirm("정말 삭제하시겠습니까??") == true){
				 location.href="${cpath}/logout.pik"
			 }else{ 
			     return false;
			 }
		}
	</script>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">		
		<!-- Header -->
		<section id="header" style="padding-top: 0; padding-bottom: 0;">
			<!-- Nav -->
			<%@ include file="nav.jsp"%>
			<%@ include  file="login.jsp"%>
		
			<!-- Banner -->
			
			
			<section id="banner" style="display: none; width:100%; background-color:#f7f7f7; margin:0; padding:0;">
								
				<div><header>
					<h2 style="color:red;">World Beer</h2>
				</header></div>
					
				<div id="main_beer_info_back">
					</div>
				<div id="main_beer_info">
					</div>
					
				<div id="map" style=" margin: auto; width:80%; height: 90vh; border: 3px solid beige; border-radius: 35%; -moz-border-radius: 35%; -khtml-border-radius: 35%; -webkit-border-radius: 35%;" ></div>
				<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBcCMNhGYduCOpd6vUqXX1yiiKtFBCKM&callback=initMap&region=kr"></script>
			
				<br>
				<button id="NA_btn">N_America</button>
				<button id="SA_btn">S_America</button>
				<button id="Home_btn">Home</button>
				<button id="OC_btn">Oceania</button>
				<button id="Asia_btn">Asia</button>
				<button id="EU_btn">EU</button>
				<br><br>
											
				<script type="text/javascript">
					var json;			
					var map;	
					
					function initMap() {					
					      	var seoul = { lat: 22 ,lng: 155 };
					      	   map = new google.maps.Map(
					           document.getElementById('map'), {
					           mapId: "67040d7b26feccd0",
					           zoom: 2.5,
					           center: seoul,
					           scaleControl: false,
					           zoomControl: false,
					           disableDefaultUI: true,
					           scrollwheel:false					           
					        });							      	
				      		var beer_icon = {
					  	  		url : "${cpath}/images/beer_icon.png",
					  	  	 	size: new google.maps.Size(30, 30),
					  	      	origin: new google.maps.Point(0, 0),
					  	     	anchor: new google.maps.Point(20, 40),
					  	      	scaledSize: new google.maps.Size(30, 30),			  	  	
					  	  	}; 					      
					      
					      	var location = [	
					    	  	['한국 : 서울', 36, 127, 'c25'],
								['프랑스 : 파리', 48.859737, 2.286952, 'c21'],								
								['미국 : 네바다', 36.070672, -114.774761, 'c6'],
								['벨기에 : 브뤼셀', 50.852055, 4.410520, 'c7'],
								['네덜란드 : 암스테르담', 52.326281, 4.952734, 'c1'],
								['핀란드 : 헬싱키', 60.186836, 24.932017, 'c22'],
								['인도네시아 : 마카사르', -5.151862, 119.569696, 'c14'],
								['스페인 : 마드리드', 40.315160, -3.642962, 'c9'],
								['아일랜드 : 더블린', 53.335206, -6.275992, 'c12'],
								['리투아니아 : 빌뉴스', 54.679764, 25.209341, 'c4'],
								['캐나다 : 오타와', 45.397979, -75.839435, 'c19'],
								['사이프러스 : 키프로스', 35.016122, 33.246252, 'c8'],
								['필리핀 : 마닐라', 14.580284, 120.989074, 'c23'],
								['일본 : 도쿄', 35.682199, 139.733488, 'c15'],
								['독일 : 베를린', 52.513671, 13.424698, 'c3'],
								['싱가포르', 1.350042, 103.866935, 'c10'],
								['오스트리아', 47.511629, 14.139651, 'c13'],
								['중국 : 베이징', 39.897541, 116.375205, 'c17'],
								['덴마크 : 쾨벤하운', 55.665090, 12.561425, 'c2'],
								['미국 : 하와이', 21.301016, -157.800359, 'c24'],
								['멕시코 : 멕시코시티', 19.383294, -99.131366, 'c5'],
								['체코 : 프라하', 50.057786, 14.444190, 'c18'],
								['아르헨티나 : 부에노스아이레스', -34.674657, -58.488043, 'c11'],
								['잉글랜드 : 버밍엄', 52.447896, -1.861060, 'c16'],
								['호주 : 멜버른', -37.824746, 145.090334, 'c26'],
								['태국 : 방콕', 13.728943, 100.558400, 'c20']				
							];
					      	
					    	//인포윈도우
				            var infowindow = new google.maps.InfoWindow();					    	
					  	  	var marker, i;					  	  				  	  
					  	  	
					  	  	for (var i=0; i < location.length; i++){
								marker = new google.maps.Marker({
									icon : beer_icon,
							  	    position: { lat: location[i][1] ,lng: location[i][2] },
							  	    map: map,
							  	    label: location[i][0]
					  	  		});
								
								google.maps.event.addListener(marker, 'click', (function(marker, i) {
				                    return function() {					                    	
				                    	$("#main_beer_info").css('display', 'block');
				                    	$("#main_beer_info_back").css('display', 'block');				                    	
				                        //html로 표시될 인포 윈도우의 내용
				                        //infowindow.setContent(location[i][0]);
				                        
				                        //인포윈도우가 표시될 위치
				                        //infowindow.open(map, marker);				                        
				                    	$.ajax({
				                    		url:'${cpath}/beerCountyList.pik',
				                    		type:"get",
				                    		data:{"country":location[i][3]},
				                    		success: function(res){
				                    			json = res;
				                    			country(res, 1);
				                    		},
				                    		error: function () {alert("Error!!")}				                    		
				                    	})		
				                    }
				                })(marker, i));				                
								
				                if (marker) {
				                    marker.addListener('click', function() {				                        
				                        //중심 위치를 클릭된 마커의 위치로 변경
				                        map.setCenter(this.getPosition());
				 
				                        //마커 클릭 시의 줌 변화
				                        map.setZoom(11);
				                    });
				                }				                
					  	  	};						  	  
					}
					  	  
					function country (data, page) {
					  		
					  		// 3개 단위로 페이징					  		
					  		var html="";
					  		var max = 3;
					  		
					  		html += "<table id='main_beer_table'>";
					  		for(let i = (page - 1)*3; i < (max*page > data.length ? data.length : max * page); i++){
					  			var beer = data[i]					  			
					  			html += "<tr>";
					  			html += "<td ><img src='"+beer.BEER_SRC+"'style='width:150px; height:150px;'></td>";
					  			html += "<td style='width:500px;'><h2>"+beer.BEER_NAME+"</h2></td>";
					  			html += "<td style='width:200px;'><h3>"+beer.AROMA_SEQ+"</h3></td>";					  								  			
					  			if (beer.TASTE_SEQ3 != null){
					  				html += "<td style='width:200px;'><h3>"+beer.TASTE_SEQ+"/"+beer.TASTE_SEQ2+"/"+beer.TASTE_SEQ3+"</h3></td>";
					  			} else {
					  				html += "<td style='width:250px;'><h3>"+beer.TASTE_SEQ+"/"+beer.TASTE_SEQ2+"</h3></td>";
					  			}					  								  			
					  			html += "</tr>";	
					  		}					  		
					  		html += "</table>";					  		
					  		var start = 1;
					  		var end = 5;
					  		
					  		var n = 0;
				  			if(data.length%max == 0){
				  				n = parseInt(data.length/max);
				  			}else{
				  				n = parseInt(data.length/max) + 1;
				  			}
					  		
				  			if(n>5){
						  		if(page > 3){
						  			if(page <= n - 2){
							  			start = page - 2;
							  			end = page + 2;
						  			}else{
						  				start = n - 4;
						  				end = n
						  			}
						  		}
				  			}else{
				  				end = n;
				  			}
				  			
					  		html += "<br>";
					  		for(let i = start ; i <= end; i++ ){
					  			if( i == page){
							  		html += "<a style='font-size:30px; font-weigh:bold; color : white;' href='javascript:country(json, " + i + ")'>" + i + "</a> &nbsp"
					  			}else{
							  		html += "<a style='font-size:20px; font-weigh:bold; color : beige;' href='javascript:country(json, " + i + ")'>" + i + "</a> &nbsp"					  				
					  			}
					  		}					  		
					  		$("#main_beer_info").html(html);				  		
					  		
					  	  }	 	  
					  	  	
					  	  function change_NA () {
					  		var NA = { lat: 33.59, lng: -103.44 };
					  		  map.panTo(NA);
					  		  map.setZoom(4);	
						  }			  	  
					  	  function change_SA () {
					  		var SA = { lat: -34.36, lng: -60.54 };
					  		  map.panTo(SA);
					  		  map.setZoom(4);	
					  	  }			  	  
					  	  function change_OC () {
					  		var OC = { lat: -10.77, lng: 121.16 };
					  		  map.panTo(OC);
					  		  map.setZoom(4);	
					  	  }
					  	  function change_Asia () {
					  		var Asia = { lat: 35.50, lng: 117.34 };
					  		  map.panTo(Asia);
					  		  map.setZoom(4);	
					  	  }
					  	  function change_EU () {
					  		var EU = { lat: 48.46, lng: 3.43 };
					  		  map.panTo(EU);
					  		  map.setZoom(4);	
					  	  }
					  	  function change_home () {
					  		var home = { lat: 22, lng: 155 };
					  		  map.panTo(home);
					  		  map.setZoom(2.5);	
					  		  infowindow.close();
					  	  }
					  	  
					  	  $(function () {			  		
					  			$("#NA_btn").click(function () {			  			
						  			
						  			change_NA();	  			
					  			})	
					  			$("#SA_btn").click(function () {			  			
						  			
						  			change_SA();	  			
					  			})
					  			$("#OC_btn").click(function () {			  			
						  		
						  			change_OC();	  			
					  			})
					  			$("#Asia_btn").click(function () {			  			
						  			
						  			change_Asia();	  			
					  			})
					  			$("#EU_btn").click(function () {			  			
						  			
						  			change_EU();	  			
					  			})
					  			$("#Home_btn").click(function () {			  			
						  			
						  			$("#main_beer_info").css('display', 'none');
						  			$("#main_beer_info_back").css('display', 'none');
						  			change_home();	  			
					  			})
					  	  })	
				</script>
				  					
			</section>		
			
			<!-- Intro -->
			<section id="intro" class="container">
				<div id="main_img_div" >					
					<!-- <h2 style="color:gold;"> 세계 맥주를 보고 싶으신가요? </h2> -->
					<div style="position:absolute; top:250px; left:800px">
					<a href="#"><img id="main_logo1" src="${cpath}/images/main_font_logo1.png" alt="logo" style="width:620px; height:420px;"></a> </div>
					<br><br>
					<a href="#"><img style="width:100%; height:100%;" id="main_img" src="https://storage.googleapis.com/cbmpress/uploads/sites/2/2017/07/%EC%98%A4%EB%A0%88%EA%B1%B4-%EB%A7%A5%EC%A3%BC-%EC%B6%95%EC%A0%9COregon-Brewers-Festival.png" alt="메인엑박"></a>
					<br><br>					
				</div>				
			</section>
		</section>		
		<!-- 지우면 안되는 태그입니다 -->
		
		<!-- Footer -->
		<%@ include file="footer.jsp"%>
		
	</div><!-- 지우면 안되는 태그입니다 -->

	<!-- Scripts -->
	<script src="${cpath}/assets/js/jquery.min.js"></script>
	<script src="${cpath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${cpath}/assets/js/browser.min.js"></script>
	<script src="${cpath}/assets/js/breakpoints.min.js"></script>
	<script src="${cpath}/assets/js/util.js"></script>
	<script src="${cpath}/assets/js/main.js"></script>

</body>
</html>