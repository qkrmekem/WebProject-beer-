function allClose(){
    $(".boxBasic-pik").css("display","block");
    $(".boxEdit-pik").css("display","none");
}
function editNickName(){
    //혹시 열린 창 닫기
    allClose()
    
    //수정 부분 열기
    $(".boxBasic-nic-pik").css("display","none");
    $(".boxEdit-nic-pik").css("display","block");
}
function editEmail(){
    allClose()

    $(".boxBasic-email-pik").css("display","none");
    $(".boxEdit-email-pik").css("display","block");
}
function editPassword(){
    allClose()

    $(".boxBasic-pw-pik").css("display","none");
    $(".boxEdit-pw-pik").css("display","block");
}
function editBirthdate(){
    allClose()

    $(".boxBasic-birth-pik").css("display","none");
    $(".boxEdit-birth-pik").css("display","block");
}
function editFavorite(){
	allClose()

    $(".boxBasic-favorite-pik").css("display","none");
    $(".boxEdit-favorite-pik").css("display","block");
	
}
function editProfile(){
	allClose()
	
	$(".boxBasic-profile-pik").css("display","none");
    $(".boxEdit-profile-pik").css("display","block");

}
function allClose(){
    $(".boxBasic-pik").css("display","block");
    $(".boxEdit-pik").css("display","none");
}

function updateNickName(cpath) {
	
	var m_nickname = $("#m_nickname").val();
	
	$.ajax({
	
		url :`${cpath}/myPageEdit.pik`,
		type :"post",
		data :{"update":"nickname","m_nickname":m_nickname},
		success : function(){
			$("#nickname").text( m_nickname);
			 allClose();
		},
		error :function(){alert("error")}
	});
}

function updateEmail(cpath) {
	
	var m_email = $("#m_email").val();
	
	$.ajax({
		url :`${cpath}/myPageEdit.pik`,
		type :"post",
		data :{"update":"email","m_email":m_email},
		success : function(){
			$("#email").text(m_email);
			 allClose();
		},
		error : function(){alert("error")}
	});
}

function updatePassword(cpath,m_pw) {
	var pw = `${m_pw}`;
	var pre_pw = $("#pre_pw").val();
	var new_pw = $("#new_pw").val();
	var check_pw = $("#check_pw").val();
	
	if(pw == pre_pw){
		$("#wrong-new-pw").css("display","none");
		$("#wrong-pw").css("display","none");
		
		if(new_pw == check_pw){
		
			$.ajax({
				url :`${cpath}/myPageEdit.pik`,
				type :"post",
				data :{"update":"pw","new_pw":new_pw},
				success : function(){
					$("#pre_pw").val("");
					$("#new_pw").val("");
					$("#check_pw").val("");		
					 allClose()
				},
				error : function(){alert("error")}
			});
		}else{
			$("#wrong-new-pw").css("display","block");
		}
	}else{
		$("#wrong-pw").css("display","block");
	}
	
	
}
function updateBirthdate(cpath) {
	
	var m_birthdate = $("#m_birthdate").val();
	
	$.ajax({
		url :`${cpath}/myPageEdit.pik`,
		type :"post",
		data :{"update":"birth","m_birthdate":m_birthdate},
		success :function(){
			$("#birthdate").text(m_birthdate);
			 allClose();
		},
		error :function(){alert("error")}
	});
}

function updateFavorite(cpath) {
	
	var beer_aroma= $("#beer_option1").prop("selectedIndex");
	var beer_from= $("#beer_option2").prop("selectedIndex");
	var beer_taste= $("#beer_option3").prop("selectedIndex");
	

	if(beer_aroma>0 && beer_from>0 && beer_taste){
	
		 $.ajax({
			url :`${cpath}/myPageEdit.pik`,
			type :"post",
			data :{"update":"favorite","beer_aroma":beer_aroma,"beer_from":beer_from,"beer_taste":beer_taste},
			success :function(){
				if(beer_aroma=="1"){
					$("#favorite-beeraroma").text("Aroma : 에일");
				}else if(beer_aroma=="2"){
					$("#favorite-beeraroma").text("Aroma : 라거");
				}else if(beer_aroma=="3"){
					$("#favorite-beeraroma").text("Aroma : 밀맥주");
				}else if(beer_aroma=="4"){
					$("#favorite-beeraroma").text("Aroma : 필스너");
				}else if(beer_aroma=="5"){
					$("#favorite-beeraroma").text("Aroma : 흑맥주");
				}else if(beer_aroma=="6"){
					$("#favorite-beeraroma").text("Aroma : 기타");
				}
			
				if(beer_from=="1"){
					$("#favorite-from").text("From : 국내");
				}else if(beer_from=="2"){
					$("#favorite-from").text("From : 해외");
				}
			
				if(beer_taste=="1"){
					$("#favorite-taste").text("Taste : Sweet");
				}else if(beer_taste=="2"){
					$("#favorite-taste").text("Taste : Dry");
				}else if(beer_taste=="3"){
					$("#favorite-taste").text("Taste : Soft");
				}else if(beer_taste=="4"){
					$("#favorite-taste").text("Taste : Deep");
				}else if(beer_taste=="5"){
					$("#favorite-taste").text("Taste : Bitter");
				}
				 allClose()
			},
			error :function(){alert("error")}
		});
	
	}
	
	
	
	

	
	
}


