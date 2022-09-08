<%@page import="kr.entity.pik.Paging"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.entity.pik.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Beer</title>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${cpath}/assets/css/main.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<style>
			.popup-wrap{
				background-color:rgba(0,0,0,.3);
				display: flex;
				flex-direction: column;
				justify-content:center;
				align-items:center;
				position:fixed;
				top:0;
				left:0;
				right:0;
				bottom:0;
				z-index: 2;
				display:none;
			}
	</style>
	
	<script>
	$(document).ready(function(){
		if (!"${mvo}"){
			$("#logInBtn").css("display","flex");
		}else{
			$("#logOutBtn").css("display","flex");
		}
	})
		
	</script>
		
</head>

<body class="homepage is-preload">
	<script>
		<% String reqPath = request.getRequestURI().split("/")[4].split("\\.")[0]+".pik";
		if(reqPath.indexOf("articleList")!=-1){
			reqPath+="?page=1";
		}else if(reqPath.indexOf("main")!=-1){
			reqPath="index.pik";
		}else if(reqPath.indexOf("info")!=-1){
			reqPath="beerRecommendForm.pik";
		}else if(reqPath.indexOf("search")!=-1){
			reqPath="beerSearchForm.pik";
		}else if(reqPath.indexOf("articleView")!=-1){
			String b_seq = request.getParameter("b_seq");
			reqPath+="?b_seq="+b_seq;
		}else if(reqPath.indexOf("myPage") != -1) {
			reqPath="index.pik";
		}
		
		%>
		function open_popup(){
			var log_popup = document.getElementById("popup")
			

			log_popup.style.display="flex"
		}
		function log_out(){
			 if (confirm("정말 로그아웃 하시겠습니까?") == true){
			     location.href="${cpath}/logout.pik?reqPath=<%=reqPath%>"
		
			 }else{
			     return false;
			 }
		}
		function close_popup(){
			var log_popup = document.getElementById("popup")
			log_popup.style.display="none"
		}
		function login_submit(){
			
			var fData= $("#loginForm").serialize();
			$.ajax({
				url : "${cpath}/login.pik",
				type : "post",
				data : fData,
				success : function(result){
					let data = $.trim(result)
				
					if(data==="aa"){
	
						goMain();
					}else{
					
						$("#failMsg").css("display","block");
					}
				},
				error : function(){alert("error");} 
			});
		}
		function goMain(){
			location.href="${cpath}/"+"<%=reqPath%>";
		}
	
		
		</script>
		
	
	<div id="logInBtn" style="display:none; position: absolute; top: 5%; right: 2%;z-index: 2;  ">
		<button onclick="open_popup()" >LogIn</button>		
	</div>
	<div id="logOutBtn" style="display:none; position: absolute; top: 5%; right: 2%;z-index: 2;">
		<button class="alt" style="border:solid 1px #F2CB05; background-color: none; color:#F2CB05 !important;" onclick="log_out()">LogOut</button>
	</div>
	<div id="popup" class="popup-wrap" style="width: 100%;height: 100%;">
		<div style="width: 450px;height: auto; background-color: #fff; border-radius: 15px 15px 15px 15px;">
			<div style="width: 100%;height: auto;background-color: #D52349;padding: 15px;border-radius: 15px 15px 0 0;">
				<div style="margin: 0 auto;">
					<h2 style="color: white; margin-top: 10px;">로그인</h2>
				</div>
			</div>
			<div style="width: 100%;height: auto;">

				<form id="loginForm">
					<div class="row" style="justify-content: center;height: 100%;">
						<div class="col-4 col-6-medium col-12-small " style="width: 85%; margin-top:20px;">
							<!-- 아이디 입력 -->
							<h3 class="join_title">
								<label for="m_id">ID</label>
							</h3>
							<div style="padding: 0; display: flex;">
								<input type="text" id="m_id" name="m_id" class="int" title="ID" placeholder="아이디를 입력하세요" maxlength="20">
							</div>
								<!-- 비밀번호 입력 -->
							<h3 class="join_title" style="margin-top: 10px;">
								<label for="m_pw">Password</label>
							</h3>
							<div class="box" style="padding: 0; border-color: #fff;">
								<input type="password" id="m_pw" name="m_pw" class="int" placeholder="비밀번호를 입력하세요" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
							</div>
							<div id="failMsg" class="box" style="display:none;margin-top:10px;padding: 0 0 0 0; border-color: #fff;">
								<span style="color:red; font : bold;">아이디와 비밀번호를 확인하세요</span>
							</div>
							<div class="box" style="margin-top:10px;padding: 0 0 0 0; border-color: #fff;">
								<a href="${cpath}/registerForm.pik" style="color:blue; text-decoration-line: none !important; color: #5D5D5D;">아직 회원이 아니시라면? 회원가입</a>
							</div>
							<input hidden value="<%=reqPath%>">
						</div>
					</div>
					<div class="actions"  style="margin-top: 25px; width: 100%;height: 20%;">
						<input style=" font-size: 1.3em;width: 50%;height: 100%;margin: 0;float: left;border-radius: 0 0 0 15px;"
							type="button" onclick="login_submit()" class="button" value="로그인">
						<input style=" font-size: 1.3em;width: 50%;height: 100%;margin:0;float: right;border-radius: 0 0 15px 0;"
						type="button" onclick="close_popup()" class="button alt" value="취소"id="login-cancel">
						<input style="clear: both;" hidden>
					</div>
				</form>
			</div>
		</div>
	</div>

	
	<!-- Scripts -->
	<script type="text/javascript"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>