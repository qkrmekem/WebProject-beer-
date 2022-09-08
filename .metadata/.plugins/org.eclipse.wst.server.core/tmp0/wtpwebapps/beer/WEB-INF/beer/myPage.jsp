 <%@page import="kr.entity.pik.Member"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Beer</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${cpath}/assets/css/main.css" />
	<link rel="stylesheet" href="${cpath}/assets/css/myPage.css" />	
	<script>
		$(document).ready(function(){
			if("${fvo.aroma_seq}"=="1"){
				$("#favorite-beeraroma").text("Aroma : 에일");
			}else if("${fvo.aroma_seq}"=="2"){
				$("#favorite-beeraroma").text("Aroma : 라거");
			}else if("${fvo.aroma_seq}"=="3"){
				$("#favorite-beeraroma").text("Aroma : 밀맥주");
			}else if("${fvo.aroma_seq}"=="4"){
				$("#favorite-beeraroma").text("Aroma : 필스너");
			}else if("${fvo.aroma_seq}"=="5"){
				$("#favorite-beeraroma").text("Aroma : 흑맥주");
			}else if("${fvo.aroma_seq}"=="6"){
				$("#favorite-beeraroma").text("Aroma : 기타");
			}
		
			if("${fvo.from_seq}"=="1"){
				$("#favorite-from").text("From : 국내");
			}else if("${fvo.from_seq}"=="2"){
				$("#favorite-from").text("From : 해외");
			}
		
			if("${fvo.taste_seq}"=="1"){
				$("#favorite-taste").text("Taste : Sweet");
			}else if("${fvo.taste_seq}"=="2"){
				$("#favorite-taste").text("Taste : Dry");
			}else if("${fvo.taste_seq}"=="3"){
				$("#favorite-taste").text("Taste : Soft");
			}else if("${fvo.taste_seq}"=="4"){
				$("#favorite-taste").text("Taste : Deep");
			}else if("${fvo.taste_seq}"=="5"){
				$("#favorite-taste").text("Taste : Bitter");
			}
			
			if("${mvo.m_type}"=="n"){
				$("#member-grade").text("일반회원");
			}else if("${mvo.m_type}"=="v"){
				$("#member-grade").text("VIP");
			}
		});

		$(function () {
			$("#m_profile").on('change',function(){
		  		var fileName = $("#m_profile").val();
		  		$(".upload-name-pik").val(fileName);
			});
		});
		
		
    </script>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">		
		<!-- Header -->
		<section id="header" style="padding-top: 0; padding-bottom: 0;">
			<!-- Nav -->
			<%@ include file="nav.jsp"%>
			<%@ include  file="login.jsp"%>
		</section><!-- 지우면 안되는 태그입니다 -->
		
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">

					<div class="col-4 col-12-medium imp-medium">
						<!-- 기본 사진 이름  -->		
						<section  class="box" >
							<div class="outProfilImgBox">
								<div class="profilImgBox">
									<c:if test='${mvo.m_profile!="null"}'> 
										<img id = "m_image" class="profileImg-pik" src="/imgMember/${mvo.m_profile}"alt="" />	
									</c:if>
									<c:if test='${mvo.m_profile=="null"}'> 
										<img class="profileImg-pik" src="images/pic09.jpg" alt="" />
									</c:if>				
								</div>
								<div class="boxBasic-pik boxBasic-profile-pik">
									<button class="mypage-button-pik  edit-profile-button" onclick="editProfile()">수정</button>
									
									<div class="say-hello">
										<p class="p-write-pik">${mvo.m_name}님</p>
										<p class="p-write-pik">반갑습니다</p>

									</div>
									
								</div>
								<div class="boxEdit-pik boxEdit-profile-pik" >
									<form action="${cpath}/profileUpdate.pik" method="post" enctype="multipart/form-data">
										<input id = "m_id" type="hidden" name="m_id" value="${mvo.m_id}" />
										<input class="upload-name-pik" value="첨부파일" placeholder="첨부파일">
										<label for="m_profile" class="label-for-file">파일찾기</label>
										<!-- 아래 input이 파일관련 input입니다!!-->	
										<input type="File" id="m_profile" name="m_profile" >
										<button type="submit" class="editpage-button-pik update-profile-button" onclick="updateProfile()">등록</button>
										<button type="button" class="back-button-pik editpage-button-profile" onclick="editClose()">취소</button>
									</form>
								</div>
							</div>
						</section>						
						<!-- 댓글 게시글 검색기능  -->
						<section class="box">
							<div>
								<p class="p-write-pik">최근 내가 쓴 글</p>
								<div class="box-latestReAl">
									<c:if test="${latestArticle!=null}">
										<c:forEach var="latestArticle" items="${latestArticle}">
											<div class="inbox-latestReAl"><a class="latestReAl" href="${cpath}/articleView.pik?b_seq=${latestArticle.b_seq}">${fn:substring(latestArticle.b_title,0,15)}...</a></div>
										</c:forEach>
									</c:if>
									<c:if test="${latestArticle==null}">
										<div class="inbox-latestReAl">${mvo.m_name}님의 게시글이 없습니다</div>
									</c:if>
								</div>
							</div>
							<div>
								<p class="p-write-pik">최근 내가 쓴 댓글</p>
								<div class="box-latestReAl" >
									<c:if test="${latestRe!=null}">
										<c:forEach var="latestRe" items="${latestRe}">
											<div class="inbox-latestReAl"><a class="latestReAl"  href="${cpath}/articleView.pik?b_seq=${latestRe.b_seq}">${fn:substring(latestRe.r_re,0,15)}...</a></div>
										</c:forEach>
									</c:if>
									<c:if test="${latestRe==null}">
										<div class="inbox-latestReAl">${mvo.m_name}님의 댓글이 없습니다</div>
									</c:if>
								</div>
							</div>
							

						</section>
					</div>
					<!--계정관리-->

					<div class="col-8 col-12-medium ">
						<article class="box post" style="border-radius:2%;">
							<section>
								<h3 class="h3-my-pik">계정관리</h3>
								<p class="p-my-pik">기본정보</p>
								<p class="p-small-my-pik"> 프로필 사진과 별명은 다른 사람이 볼 수 있습니다.</p>
							</section>
							<section>
								<div class="infoOutbox-pik">									
									<!--별명 정보&수정-->
									<div class="infoInbox-pik">
										<div class="infoInboxLeft-pik">
											별명
										</div>
										<div class="infoInboxRight-pik">
											<div class="boxBasic-pik boxBasic-nic-pik">
												<span id="nickname">${mvo.m_nickname}</span>
												<button class="mypage-button-pik" onclick="editNickName()">수정</button>
											</div>
											<div class="boxEdit-pik boxEdit-nic-pik">
												<input type="text" id="m_nickname" name="m_nickname" value="${mvo.m_nickname}" class="inputInBox-pik">
												<button type="button" class="editpage-button-pik" onclick="updateNickName('${cpath}')">등록</button>
												<button type="button" class="back-button-pik" onclick="allClose()">취소</button>
											</div>
										</div>
									</div>
									<!--이메일 정보&수정-->
									<div class="infoInbox-pik">
										<div class="infoInboxLeft-pik">
											이메일
										</div>
										<div class="infoInboxRight-pik">
											<div class="boxBasic-pik boxBasic-email-pik">
												<span id="email">${mvo.m_email}</span>
												<button class="mypage-button-pik" onclick="editEmail()">수정</button>
											</div>
											<div class="boxEdit-pik boxEdit-email-pik">
												<input type="text" id="m_email" name="m_email" value="${mvo.m_email}" class="inputInBox-pik">
												<button type="button" class="editpage-button-pik" onclick="updateEmail('${cpath}')">등록</button>
												<button type="button" class="back-button-pik"  onclick="allClose()">취소</button>
											</div>
										</div>
									</div>
									<!--비밀번호 정보&수정-->
									<div class="infoInbox-pik">
										<div class="infoInboxLeft-pik" >
											비밀번호
										</div>
										<div class="infoInboxRight-pik">
											<div class="boxBasic-pik boxBasic-pw-pik">
												<span id="password">**********</span>
												<button class="mypage-button-pik" onclick="editPassword()">수정</button>
											</div>
											<!--비밀번호 확인 부분-->
											<div class="boxEdit-pik boxEdit-pw-pik">
												<input type="password" id="pre_pw" name="pre_pw" placeholder="기존 비밀번호를 입력해 주세요" class="inputInBox-pik">
												<div id="wrong-pw">기존 비밀번호가 틀렸습니다</div>
												<input type="password" id="new_pw" name="new_pw" placeholder="새로운 비밀번호를 입력해 주세요" class="inputInBox-pik">
												<div id="wrong-new-pw">새로운 비밀번호가 일치하지 않습니다</div>
												<input type="password" id="check_pw" name="check_pw" placeholder="새로운 비밀번호를 다시 입력해 주세요" class="inputInBox-pik">
												<button type="button" class="editpage-button-pik" onclick="updatePassword('${cpath}','${mvo.m_pw}')">등록</button>
												<button type="button" class="back-button-pik" onclick="allClose()">취소</button>
											</div>
										</div>
									</div>
									<!--생년월일 정보&수정-->
									<div class="infoInbox-pik">
										<div class="infoInboxLeft-pik">
											생년월일
										</div>
										<div class="infoInboxRight-pik">
											<div class="boxBasic-pik boxBasic-birth-pik">
												<span id="birthdate">${fn:split(mvo.m_birthdate," ")[0]}</span>
												<button class="mypage-button-pik" onclick="editBirthdate()">수정</button>
											</div>
											<div class="boxEdit-pik boxEdit-birth-pik">
												<input type="date" id="m_birthdate" name="m_birthdate">
												<button type="button" class="editpage-button-pik" onclick="updateBirthdate('${cpath}')">등록</button>
												<button type="button" class="back-button-pik" onclick="allClose()">취소</button>									
											</div>
										</div>
									</div>
									<!-- 맥주 취향 정보 & 수정  -->
									<div class="infoInbox-pik">
										<div class="infoInboxLeft-pik">
											맥주취향
										</div>
										<div class="infoInboxRight-pik">
											<div class="boxBasic-pik boxBasic-favorite-pik">
												<span class="pre-favorite" id="favorite-beeraroma"></span>
												<span class="pre-favorite" id="favorite-from"></span>
												<span class="pre-favorite" id="favorite-taste"></span>
												<button class="mypage-button-pik" onclick="editFavorite()">수정</button>
											</div>
											<div class="boxEdit-pik boxEdit-favorite-pik">	
												<div class="favorite-edit">
													<span class="favorite-edit-font" id="aromaCheck" >좋아하는 향을 선택해주세요</span>
													<h4 class="favorite-edit-h4"> Aroma  :</h4>
													<select name="beer_aroma" id="beer_option1" class="beer-edit-select" >
														<option selected value="-1"> choose ▽  </option>
														<option value= 1 >에일</option>
														<option value= 2 >라거</option>												
														<option value= 3 >밀맥주</option>
														<option value= 4 >필스너</option>
														<option value= 5 >흑맥주</option>												
														<option value= 6 >기타</option>											
													</select>												
												</div>
												<div class="favorite-edit">
													<span class="favorite-edit-font" id="fromCheck" >선호하는 원산지를 선택해주세요</span>
													<h4 class="favorite-edit-h4"> From	:</h4>
													<select name="beer_from" id="beer_option2" class="beer-edit-select" >
														<option selected value="-1"> choose ▽  </option>
														<option value= 1 >국내</option>
														<option value= 2 >해외</option>													
													</select>	
												</div>								
												<div class="favorite-edit">
													<span class="favorite-edit-font" id="tasteCheck" >좋아하는 맛을 선택해주세요</span>
													<h4 class="favorite-edit-h4"> Taste  :</h4>
													<select name="beer_taste" id="beer_option3" class="beer-edit-select" >
														<option selected value="-1"> choose ▽  </option>
														<option value= 1 >Sweet</option>
														<option value= 2 >Dry</option>
														<option value= 3 >Soft</option>
														<option value= 4 >Deep</option>
														<option value= 5 >Bitter</option>													
													</select>
												</div>
												<div class="favorite-edit-button" >
													<button type="button" class="editpage-button-pik" onclick="updateFavorite('${cpath}')">등록</button>
													<button type="button" class="back-button-pik"  onclick="allClose()">취소</button>
												</div>
											</div>
										</div>
									</div>
									<!--회원등급 정보&수정-->
									<div class="infoInbox-pik">
										<div class="infoInboxLeft-pik">
											회원등급
										</div>
										<div class="infoInboxRight-pik">
											<div class="boxBasic-pik boxBasic-grade-pik">
												<form action="" method="get">
													<span id="member-grade">${mvo.m_type}</span>
													<button type="button" class="mypage-button-pik">가입</button>
												</form>
												<!--버튼 클릭시 유료회원으로 전환 편의점 구독신청-->
											</div>
										</div>
									</div>
									<!--가입일 정보&수정-->
									<div class="infoInbox-pik">
										<div class="infoInboxLeft-pik">
											가입일
										</div>
										<div class="infoInboxRight-pik">
											<div class="boxBasic-pik boxBasic-joindate-pik">
												${fn:split(mvo.m_joindate," ")[0]}
											</div>
										</div>
									</div>
								</div>
							</section>
						</article>
					</div>
				</div>
			</div>
		</section>
		
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
	<script src="${cpath}/assets/js/myPage.js"></script>
	

</body>
</html>