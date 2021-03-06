<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Blog + Left Sidebar | Triangle</title>
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/lightbox.css'/>" rel="stylesheet"> 
    <link href="<c:url value='/resources/css/animate.min.css'/>" rel="stylesheet"> 
	<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/responsive.css'/>" rel="stylesheet">

    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="<c:url value='/resources/images/ico/favicon.ico'/>">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/resources/images/ico/apple-touch-icon-144-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='/resources/images/ico/apple-touch-icon-114-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='/resources/images/ico/apple-touch-icon-72-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" href="<c:url value='/resources/images/ico/apple-touch-icon-57-precomposed.png'/>">
</head><!--/head-->

<body>
    
	<header id="header">      
        
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                     <a class="navbar-brand" href="/biz/home" >
                            <h1><img src="<c:url value='/resources/images/cos.png'/>" alt="logo" ></h1>
                        </a>
                    
                    
                </div>
                
                 <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/biz/order">주문</a></li>
                        <li ><a href="/biz/sales">매출관리 </a>        
                        </li>                    
                        <li><a href="/biz/product">상품관리 </a>               
                        </li>
                        <li class="dropdown "><a href="#">게시글관리 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="/biz/community">코스 커뮤니티</a></li>
                                <li><a href="/biz/review">상품 후기</a></li>
                                <li><a href="/biz/faq">FAQ</a></li>
                                <li><a href="/biz/ask">1:1문의</a></li>          
                            </ul>
                        </li>                         
                        <li><a href="/biz/member ">회원관리</a></li>                    
                    </ul>
                </div>
                
            </div>
        </div>
    </header>
    <!--/#header-->

    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">관리자 페이지</h1>
                            <p>&nbsp;로그인</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->


    <section id="blog" class="padding-top">
        <div class="container"  >
            <div class="row">
           
               	<!-- <form action="/biz/home/login" method="POST"> -->
               	<form name="frm" action="<c:url value='/j_spring_security_check' />" method="psot">
                    <table class="table table-hover" style="width: 40%" >
                       
                        <tr style="align-content: center">
                            <td>ID:</td><td><input type="text" id="j_username"></td>
                        </tr>
                        <tr>
                            <td>Password:</td><td><input type="password" id="j_password"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center"><input type="button" value="로그인" onclick="doLogin()"></td>
                        </tr>
                       <%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                    </table>
				</form>              
            </div>
        </div>
    </section>

    
    <div style="text-align: center ; "><br/><br/><br/><br/>
        <img src="<c:url value='/resources/images/home/clients.png'/>" alt="nob"/>
    </div>
   
     <script type="text/javascript" src="<c:url value='/resources/js/jquery.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/lightbox.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/wow.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/main.js'/>"></script> 
    <script> 
    function doLogin() { 
    	if(frm.j_username.value == "") 
    	{ alert(" 아이디를 입력해주세요 .");

    	return;

    	} if(frm.j_password.value == "") { alert(" 패스워드를 입력해주세요 .");

    	return;

    	} frm.submit();
	} 
    </script>
</body>
</html>
