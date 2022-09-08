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
    <script type="text/javascript">
        var loginID = "${mvo.m_id}";
        
         $(function(){
             if(loginID){
                 $("#loginMember").css("display","inline-block");
             }else{
                 $("#loginMember").css("display","none");
             }
         });
         $(document).ready(function(){      
                <%String btnPath = request.getRequestURI().split("/")[4].split("\\.")[0];
                if(btnPath.indexOf("articleList")!=-1 || btnPath.indexOf("articleView")!=-1){
                %>$("#review_btn").addClass("current");  <%
                }else if(btnPath.indexOf("eventList")!=-1){
                %>$("#notice_btn").addClass("current");  <%
                }else if(btnPath.indexOf("myPage")!=-1){
                %>$("#loginMember").addClass("current"); <%
                }%>
            })  
         
         
        
    </script>
    
    <style type="text/css">
    .a-hover:hover {
    	background-color: rgba(255, 217, 0, 0.232) !important;
    }
    
    
    </style>
</head>
<body>
<!-- Logo -->
<div style="background-color:#252122; height:200px;">
    <h1 style="padding-top: 45px"><a href="${cpath}/index.pik" style="color:gold">Beer</a></h1>

    
<!-- Nav -->
    <nav id="nav">
        <ul>
            <li id="home_btn"><a class="a-hover" style="color:#f7f7f7;" href="${cpath}/index.pik">Home</a></li>
            <li id="info_btn"><a class="a-hover" style="color:#f7f7f7;" href="${cpath}/beerRecommendForm.pik">Beer Info</a></li>
            <li id="search_btn"><a class="a-hover" style="color:#f7f7f7;" href="${cpath}/beerSearchForm.pik">Beer Search</a></li>
            <li id="review_btn"><a class="a-hover" style="color:#f7f7f7;" href="${cpath}/articleList.pik?page=1">Review</a></li>
            <li id="notice_btn"><a class="a-hover" style="color:#f7f7f7;" href="${cpath}/eventList.pik">Notice</a></li>
            <li id="loginMember"><a class="a-hover" style="color:#f7f7f7;" href="${cpath}/myPage.pik">My Page</a></li>
            
        </ul>
    </nav>
</div>
</body>
</html>