<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<style>
/**Global CSS**/
*{
	margin : 0;
	pading : 0;	
}
body{
	background-image: url("img/css/librarybackground.jpg");
	background-color: #cccccc;
}
li{
 	list-style : none;
}
a{
	text-decoration: none;
}
table {
	margin : 0 auto;
	text-align : center;
}

/* fieldset {
    border: 5px solid #f0c413;
    background: white;
    border-radius: 5px;
    padding: 15px;
    margin : 0 auto;
    width : 160px;
} */

/** Header CSS**/
header{
	height : 200px;
	margin : 0 auto;
	/* background : white; *//* #f0c413; */  /*  #EB613B; */
	position : relative;
	/* border-left : solid #f0c413 1px;
	border-right : solid #f0c413 1px; */
}
header>#top{
	position: absolute;
	top : 0;
	right : 50px;
	width : 500px;
	height : 55px;
	line-height : 55px;
	background : #8a4c25;
	background: rgba(137, 73, 35, 0.6);
	border-radius: 0px 0px 10px 10px;
	float : right;
}
heaer>#top>fieldset>form>.form-group{
	align : center;
}

header>#logo>#mainname{
	position: absolute;
	top : 25px;
	left : 43%;
}

header > #bottom{
	position: absolute;
	bottom : 0;
	left : 240px;
	width : 100%;
}

header > #bottom > ul > li{
	float : left;
	background : black;
	width : 130px;
	height : 45px;
	line-height : 45px;
	text-align : center;
/* 	border : solid/*  #f0c413 */ white 1px; */
	
}
header > #bottom > ul > li > a{
	width : 150px;
	margin : 20px;
	color : white;
	font-size : 1.1em;
	
}
header > #bottom > ul > li > a:HOVER{
	color : red;
}
header>#bottom>ul>li{
	border-radius: 20px 20px 0 0;
}

/** Nav CSS**/
nav{
	height : 45px;
	margin : 0 auto;
	background: rgb(255,255,255); /* Old browsers */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,255,255,1)), color-stop(3%,rgba(225,225,225,1)), color-stop(47%,rgba(241,241,241,1)), color-stop(100%,rgba(246,246,246,1))); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(225,225,225,1) 3%,rgba(241,241,241,1) 47%,rgba(246,246,246,1) 100%); /* Chrome10+,Safari5.1+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0 ); /* IE6-9 */
	border-top : solid white 2px opacity.5;
	border-bottom : solid #dcdbdb 1px;
	line-height : 45px;
	color : black;
}
 nav>#bottom{
	width : 400px;
	margin : 0 100px;
} 
nav>#bottom>ul>li{
	float : left;
}
nav>#bottom>ul>li>a{
	width : 150px;
	margin : 20px 20px;
	font-size : 1.0em;
	color : black;
}

/** Section CSS**/
section {
	width : 80%;
/* 	height : 600px; */
	margin : 0 auto;
}
#left{
	width : 30%;
/* 	height : 600px; */
	float : left;	
	background: rgba(250,230,195,0.4);
}
#left>div{
	margin : 10px 10px;
}

#center{
	width : 70%;
/* 	height : 600px; */
	float : left;
	background: rgba(255,255,255,0.4);
}
#notice{
	width : 320px;
	height : 220px;
	border : solid black 1px;
	float : left;
	padding : 10px;
	margin : 0px 23px;

}
#free{
	width : 320px;
	height : 220px;
	border : solid black 1px;
	float : left;
	padding : 10px;

}
#lastbook{
	width : 640px;
	height : 200px;
	padding : 10px;
	border : solid black 1px;

}
/** Footer CSS**/
footer{
	width : 100%;
	height : 121px;
	margin : 0 auto;
	background : #8a4c25;
	background: rgba(137, 73, 35, 0.6);
	border-top : solid #8a4c25 2px;
	color : white;
	line-height : 121px;
}
footer>div{
	width : 600px;
	height : 50px;
	margin : 30px 30px;
}

#myCarousel{
	width : 95%;
	margin : 20px auto;
}

.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      height : 300px;
      margin: auto;
  }

</style>
<script>
function makeHeight(){
	var section = document.querySelector("#section");
	var left = document.querySelector("#left");
	var center = document.querySelector("#center");
	
	var mHeight = center.clientHeight;
	/* ClientHeight를 써서 표 높이만큼 늘리게 함. */
	if(mHeight < 800){
		mHeight = 800;
	}
	center.style.height = mHeight + 'px';
	section.style.height = mHeight + 'px';
	left.style.height = mHeight + 'px';
}
window.onload = function(){
	makeHeight();
};

</script>
</head>
<body>
	<header>
	<jsp:include page="${top}"/>
	</header>
	<nav><jsp:include page="${nav}"/></nav>
	<section id="section">
	<aside id="center">
	<jsp:include page="${center}"/>
	</aside>
	<aside id="left">
	<jsp:include page="${left}"/>
	</aside>
	</section>
	<footer>
	<div>
	<h5>SDS Campus Secure Code Team 5 : YouSangYi | LeeDongWoo | KimJiHun </h5>
	<h6>@2015 sangyi design inc. All rights Reserved. Privacy policy | Terms of Use</h6>
	</div>
	</footer>
</body>
</html>