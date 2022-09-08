<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Beer</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${cpath}/assets/css/main.css" />
	
</head>
<body class="homepage is-preload">
<script type="text/javascript">
	var idCheck = false;
	var pwCheck = false;
	var nameCheck = false;
	var genderCheck = false;
	var emailCheck = false;
	var birthdateCheck = false;
	var aromaCheck = false;
	var fromCheck = false;
	var tasteCheck = false;
	function doubleCheck(){
		var inputId = $('#m_id').val();
		
		$.ajax({
			url:'${cpath}/doubleCheck.pik',
			type: "post",
			data: {"m_id":inputId},
			success: function(count){
				
				if(count==0){
					$("#idCheckMsg").html("id는 3자리 ~ 9자리 사이로 입력해주세요")
					$("#m_id").val("");
				}else if(count==1){
					$("#idCheckMsg").html("중복된 아이디가 있습니다. 다른 아이디로 입력해주세요.")
					$("#m_id").val("");
				}else{
					alert("중복된 아이디가 없습니다!!!");
					$("#idCheckMsg").html("")
					idCheck = true;
				}
			},
			error: function(){alert("id중복기능 에러");}
		})
// 		$("#checkTrue").css("display","inline");
// 		$("#checkFalse").css("display","none");
	}
	function resetIdCheck(){
		idCheck=false;
	}
	function resetPwCheck(){
		Check=false;
	}
	function doubleCheckFalse(){
		alert("중복확인을 먼저 해주세요.")
	}
	function checkPw(){
		var pw = $("#m_pw").val();
		var pw2 = $("#m_pw1").val();
		var sc = ["!","@","#","$","%"];
        var check_sc = 0;
        for(var i=0;i<sc.length;i++){
            if(pw.indexOf(sc[i]) != -1){
            	check_sc = 1;
            }
        }
        if(pw.length < 6 || pw.length>16){
//             window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
            $("#pwCheckMsg").text("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.");
			
        }
        if(check_sc == 0){
        	$("#pwCheckMsg").text("특수문자를 포함해주세요");
        }else if(check_sc == 1){
        	$("#pwCheckMsg").text("");
        }
	}
	function pwDoubleCheck(){
		var pw = $("#m_pw").val();
		var pw2 = $("#m_pw1").val();
		if(pw != pw2){
			$("#pwDoubleCheckMsg").html("비밀번호가 일치하지 않습니다");
			pwCheck = false;
		}
		if(pw == pw2){
			$("#pwDoubleCheckMsg").html("");
			pwCheck = true;
		}
	}
	function checkName(){
		if($("#m_name").val() == ""){
			$("#nameCheckMsg").html("이름을 입력해주세요");
			nameCheck = false;
		}else{
			$("#nameCheckMsg").html("");
			nameCheck = true;
		}
	}
	function checkGender(){
		if($("#m_gender").val()=="-1"){
			$("#genderCheckMsg").html("성별을 선택해주세요");
			genderCheck = false;
		}else{
			$("#genderCheckMsg").html("")
			genderCheck = true;
		}
	}
	function checkBirthDate(){
		if($("#m_birthdate").val()==""){
			console.log($("#m_birthdate").val()+'true')
			$("#birthdateCheckMsg").html("생년월일을 선택해주세요");
			birthdateCheck=false;
			console.log(birthdateCheck)
		}else{
			console.log($("#m_birthdate").val()+'false')
			$("#birthdateCheckMsg").html("");
			birthdateCheck = true;
			console.log(birthdateCheck)
		}
	}
	function checkEmail(){

		var email = $("#m_email").val()
		var arrUrl=[".co.kr",".com",".net",".or.kr",".go.kr"]
		var emailForm1 = false;
		var emailForm2 = false;
		if($("#m_email").val()==""){
			$("#emailCheckMsg").html("이메일을 입력해주세요");
		}else{
			$("#emailCheckMsg").html("");
			emailForm1 = true;
		}
		for(var i = 0; i<arrUrl.length;i++){
			if(email.indexOf(arrUrl[i])>0){
				emailForm2 = true;
			}
		}
		if(emailForm1 && emailForm2){
			emailCheck=true;
		}else{
			$("#emailCheckMsg").html("이메일 형식을 맞춰주세요");
			emailCheck=false;
		}
	}
	function checkAroma(){
		if($("#beer_option1").val()=="-1"){
			$("#aromaCheckMsg").html("좋아하는 향을 선택해주세요");
			aromaCheck = false;
		}else{
			$("#aromaCheckMsg").html("");
			aromaCheck = true;
		}
	}
	function checkFrom(){
		if($("#beer_option2").val()=="-1"){
			$("#fromCheckMsg").html("좋아하는 원산지을 선택해주세요");
			fromCheck = false;
		}else{
			$("#fromCheckMsg").html("");
			fromCheck = true;
		}
	}
	function checkTaste(){
		if($("#beer_option3").val()=="-1"){
			$("#tasteCheckMsg").html("좋아하는 맛을 선택해주세요");
			tasteCheck = false;
		}else{
			$("#tasteCheckMsg").html("");
			tasteCheck = true;
		}
	}
	function registerSubmit(){
		if(!idCheck){
			alert("id입력을 확인해주세요");
			return false;
		}
		if(!pwCheck){
			alert("암호를 확인해주세요");
			return false;
		}
		if(!nameCheck){
			alert("이름을 입력해주세요");
			return false;
		}
		if(!genderCheck){
			alert("성별을 선택해주세요");
			return false;
		}
		if(!emailCheck){
			alert("이메일 주소를 확인해주세요");
			return false;
		}
		if(!birthdateCheck){
			alert("생년월일을 입력해주세요");
			return false;
		}
		if(!aromaCheck){
			alert("선호하는 향을 선택해주세요");
			return false;
		}
		if(!fromCheck){
			alert("선호하는 원산지를 선택해주세요");
			return false;
		}
		if(!tasteCheck){
			alert("선호하는 맛을 선택해주세요");
			return false;
		}
		
	}
	
</script>
		<div id="page-wrapper">

			<!-- Header -->
			<section id="header" style="padding-top: 0; padding-bottom: 0;">
					<!-- Logo -->
					<!-- Nav -->
				<%@ include  file="nav.jsp"%>
			</section><!-- 지우면 안되는 태그입니다 -->

						<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<!-- Portfolio -->
									<section>
										<header class="major">
											<h2>회원가입</h2>
										</header>
										<form action="/beer/register.pik" method="post" onsubmit="return registerSubmit();">
											<input type="hidden" id="token_sjoin" name="token_sjoin" value="6fnwb3fdYkQTX854">
											<input type="hidden" id="encPswd" name="encPswd" value="">
											<input type="hidden" id="encKey" name="encKey" value="">
											<input type="hidden" id="birthday" name="birthday" value="">
											<input type="hidden" id="joinMode" name="joinMode" value="unreal">
											<input type="hidden" id="pbirthday" name="pbirthday" value="">
											<input type="hidden" id="ipinFlag" name="ipinFlag" value="">
											<input type="hidden" id="nid_kb2" name="nid_kb2" value="">
											<div class="row" style="justify-content: center">
												<div  style="width:50%" class="col-4 col-6-medium col-12-small">
													<!-- 아이디 입력 -->
													<h3 class="join_title"><label for="id">아이디</label></h3>
													<section class="box" style="padding:0; display: flex; margin-bottom:0" >
														<div style="width: 76.5%">
															<input type="text" id="m_id" name="m_id" class="int" title="ID" maxlength="20" onchange="resetIdCheck()">
															
														</div>
														<input type="button" class="button alt" onclick="doubleCheck()" value="중복확인">
														
													</section>
													<div style="display:block; margin-bottom:2.5em;">
														<span id="idCheckMsg" style="color:red;background-color:transparent !important;"></span>
														</div>
													<h3 class="join_title"><label for="password">비밀번호</label></h3>
													<section class="box" style="padding:0; margin-bottom:0;">
														<input type="password" id="m_pw" name="m_pw" onchange="checkPw()" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20" onchange="pwDoubleCheck()">
														
													</section>
													<div style="display:block; margin-bottom:2.5em;">
														<span id="pwCheckMsg" style="color:red;background-color:transparent !important;"></span>
														</div>
													<!-- 비밀번호 확인 입력 -->
													<h3 class="join_title"><label for="password1">비밀번호 재확인</label></h3>
													<section class="box" style="padding:0; margin-bottom:0;">
														<input type="password" id="m_pw1" name="m_pw1" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20" onchange="pwDoubleCheck()">
													</section>
													<div style="display:block; margin-bottom:2.5em;">
														<span id="pwDoubleCheckMsg" style="color:red;background-color:transparent !important;"></span>
														</div>
													<!-- 이름 입력 -->
													<h3 class="join_title"><label for="name">이름</label></h3>
													<section class="box" style="padding:0; margin-bottom:0;">
														<input type="text" id="m_name" onfocusout="checkName()" name="m_name" title="이름" class="int" maxlength="40">
													</section>
													<div style="display:block; margin-bottom:2.5em;">
														<span id="nameCheckMsg" style="color:red;background-color:transparent !important;"></span>
													</div>
													<!-- 생년월일 입력 -->
													
													<h3 class="join_title"><label for="yy">생년월일</label></h3>
													<section class="box" style="padding:0; margin-bottom:0; display: flex;">
														<div class="bir_yy" style="width: 33.3333%">
														<input type="date" id="m_birthdate" name="m_birthdate" onchange="checkBirthDate()">
														</div>									
												</section>
												<div style="display:block; margin-bottom:2.5em;">
														<span id="birthdateCheckMsg" style="color:red;background-color:transparent !important;"></span>
													</div>
													<!-- 성별 -->
													
													<h3 class="join_title" ><label for="gender">성별</label></h3>
													<section class="box" style="padding:0; margin-bottom:0;">
															
															
															<select id="m_gender" name="m_gender" class="sel" aria-label="성별" onchange="checkGender()">
																<option value="-1" selected>성별</option>
																		<option value="1">남자</option>
																		<option value="0">여자</option>
															</select>
													</section>
													<div style="display:block; margin-bottom:2.5em;">
														<span id="genderCheckMsg" style="color:red;background-color:transparent !important;"></span>
													</div>
													
													
													<!-- 이메일 -->
													<h3 class="join_title"><label for="email">본인 확인 이메일<span class="terms_choice"></span></label></h3>
													<section class="box" style="padding:0; margin-bottom:0;">
														<input type="text" onchange="checkEmail()" onfocusout="checkEmail()" id="m_email" name="m_email" aria-label="선택입력" class="int" maxlength="100">
													</section>
													<div style="display:block; margin-bottom:2.5em;">
														<span id="emailCheckMsg" style="color:red; background-color:transparent !important;"></span>
													</div>
												</div>
											
												
											</div>
											<!-- 취향 -->
											<div class="row" style="justify-content: center; margin-top:10px; !important">
												<div  style="width:50%" class="col-4 col-6-medium col-12-small">
												
												<div style="margin:auto;">
												<div style=" margin-bottom:0;padding-top: 10px; padding-bottom:10px; display:inline">
												<h3 style="display:inline;"> Aroma :  </h3>
												<select name="beer_aroma" id="beer_option1" class="beer_option_select" onchange="checkAroma()">
													<option selected value="-1"> choose ▽  </option>
													<option value= 1 >에일</option>
													<option value= 2 >라거</option>												
													<option value= 3 >밀맥주</option>
													<option value= 4 >필스너</option>
													<option value= 5 >흑맥주</option>												
													<option value= 6 >기타</option>											
												</select>												
											</div>
											<div style="display:block; margin-bottom:2.5em;">
														<span id="aromaCheckMsg" style="color:red;background-color:transparent !important;">좋아하는 향을 선택해주세요</span>
													</div>
													
											<div style="margin:auto; display:inline;">
												<h3 style="display:inline;"> From :  </h3>
												<select name="beer_from" id="beer_option2" class="beer_option_select" onchange="checkFrom()">
													<option selected value="-1"> choose ▽  </option>
													<option value= 1 >국내</option>
													<option value= 2 >해외</option>													
												</select>	
											</div>
											<div style="display:block; margin-bottom:2.5em;">
														<span id="fromCheckMsg" style="color:red;background-color:transparent !important;">선호하는 원산지를 선택해주세요</span>
													</div>
																										
											<div style="margin:auto; padding-top: 10px; display:inline">
												<h3 style="display:inline;"> Taste :  </h3>
												<select name="beer_taste" id="beer_option3" class="beer_option_select" onchange="checkTaste()">
													<option selected value="-1"> choose ▽  </option>
													<option value= 1 >Sweet</option>
													<option value= 2 >Dry</option>
													<option value= 3 >Soft</option>
													<option value= 4 >Deep</option>
													<option value= 5 >Bitter</option>													
												</select>
												<div style="display:block; margin-bottom:2.5em;">
														<span id="tasteCheckMsg" style="color:red;background-color:transparent !important;">좋아하는 맛을 선택해주세요</span>
													</div>
											</div>				
										</div>
												
												</div>
											</div>
											
											
											<div class="actions" align="center" style="margin-top: 30px;">
												<input id="checkTrue" style="padding:12px 35px; margin-right: 10px; font-size:1.3em;" type="submit" class="button large" value="회원 가입">
<!-- 												<input id="checkFalse" onclick="doubleCheckFalse()" style="padding:12px 35px; margin-right: 10px; font-size:1.3em ;" type="button" class="button alt" value="회원 가입"> -->
												<input style="padding:12px 35px; margin-left: 10px; font-size:1.3em;" type="reset" class="button alt large"  value="다시 입력">
											</div>

										</form>
										
									</section>
							</div>
						</div>
					</div>
				</section>


			<!-- Footer -->
				<%@ include  file="footer.jsp"%>
		</div> <!-- 지우면 안되는 태그입니다 -->

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>