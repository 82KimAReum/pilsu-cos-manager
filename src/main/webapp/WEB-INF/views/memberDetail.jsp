<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>회원</title>
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/lightbox.css'/>" rel="stylesheet"> 
    <link href="<c:url value='/resources/css/animate.min.css'/>" rel="stylesheet"> 
	<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/responsive.css'/>" rel="stylesheet">

    <link rel="shortcut icon" href="<c:url value='/resources/images/ico/favicon.ico'/>">
   <%--  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/resources/images/ico/apple-touch-icon-144-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='/resources/images/ico/apple-touch-icon-114-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='/resources/images/ico/apple-touch-icon-72-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" href="<c:url value='/resources/images/ico/apple-touch-icon-57-precomposed.png'/>"> --%>
</head><!--/head-->

<body>
    
	<header id="header">      
        
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                   
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
                        <li class="active"><a href="/biz/member ">회원관리</a></li>                    
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
                            <h1 class="title">회원 디테일</h1>
                            <p>&nbsp;${email }님의 회원 상세 정보</p>
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
               <table class="table table-hover" >   
				 <caption>주문자 정보</caption> 
                    <tbody>
						<tr style="text-align: center;">
							<td><button type="button" class="btn btn-default" id="info" disabled="disabled">주문자 정보 목록</button></td>
							<td><button type="button" class="btn btn-default" id="order">주문 목록</button></td>
							<td><button type="button" class="btn btn-default" id="review">후기목록</button></td>
							<td><button type="button" class="btn btn-default" id="board">게시물 목록</button></td>
							<td><button type="button" class="btn btn-default" id="qna">1:1문의 목록</button></td>
						</tr>                    	
                    </tbody>
                </table>   
              
               <table class="table table-hover" >   
				 <caption>주문자 정보</caption> 
                    <tbody>
                    	<tr>
                    		<td>이름</td>
                    		<td>${data.name}(${data.email })</td>
                    	</tr>
                    	<tr>
                    		<td>성별</td>
                    		<td>${data.gender }</td>
                    	</tr>
                    	<tr>
                    		<td>나이</td>
                    		<td>${sysYear-data.ageyear }</td>
                    	</tr>
                    	<tr>
                    		<td>피부타입</td>
                    		<td>${data.skintype }</td>
                    	</tr>
                    	<tr>
                    		<td>전화번호</td>
                    		<td>${data.phone }</td>
                    	</tr>
                    	<tr>
                    		<td>주소</td>
                    		<td>(${data.zipcode}) ${data.address1 }${data.address2 }</td>
                    	</tr>
                    	<tr>
                    		<td>상태</td>
                    		<td>${data.regstat }</td>
                    	</tr>
                    	
                    </tbody>
                </table>   
				  
				<c:choose>
					<c:when test="${data.regstat =='Y'}">
						<button type="button" class="btn btn-default" id="btnDelete">비활성</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-default" id="btnUpdate">활성</button>
					</c:otherwise>
				</c:choose>
					
				
				
				     <button type="button" class="btn btn-default" onclick="javascript:history.back();">뒤로가기</button>
				
				
			


               
        	</div>
        </div>
  </section>
  <!--/#blog-->

    

     <script type="text/javascript" src="<c:url value='/resources/js/jquery.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/lightbox.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/wow.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/main.js'/>"></script> 
    <script>
    $("input").keydown(function(e) {
	    if (e.keyCode == 13) {
	    	 e.preventDefault();
	    }      
	});
   function encoding(str){
	   var temp= str;
	   temp=temp.replace(/&quot;/gi,"\"");
	   temp=temp.replace(/&apos;/gi,"'");
	   temp=temp.replace(/&lt;/gi,"<");
	   temp=temp.replace(/&gt;/gi,">");
	   temp=temp.replace(/<br\/>/gi,"\r\n");
	   
	   return temp;
   }
    
    $(document).ready(function(){
	  //alert(${data.email})
    }); 
   
   $("#btnDelete").click(function() {//비활성
	   
	   var r = confirm("회원을 비활성 하시겠습니까?");
	    if (r == true) {
		  	 var email="${data.email}";
		  	
				//alert(contents)
		     	$.ajax({
				 	url:"/biz/member/1",
					method:"DELETE",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					data:JSON.stringify({array:email}),
					success:function(data){
						location.reload(true);
					}
			       	
				});
		     	location.reload(true);
		     	//location.replace("/biz/member/detail/${data.email}");  
	    } else {
	        return false;
	    }	 
				 
	});
   
   //btnUpdate
   
    $("#btnUpdate").click(function() {//활성
	   
	   var r = confirm("회원을 활성 하시겠습니까?");
	    if (r == true) {
		  	 var email="${data.email}";
		  	
				//alert(contents)
		     	$.ajax({
				 	url:"/biz/member/detail/"+email,
					method:"PUT",
					
					success:function(data){
						location.reload(true);
					}
			       	
				});
		     	location.reload(true);
				 // location.replace("/biz/member/detail/${data.email}");  
	    } else {
	        return false;
	    }	 
				 
	});
     
   $("#info").click(function(){
	   self.location="/biz/member/detail/${data.email}";
   })
   $("#order").click(function(){
	   self.location="/biz/member/detail/${data.email }/order/1";
   })
   $("#review").click(function(){
	   self.location="/biz/member/detail/${data.email }/review/1";
   })
   $("#board").click(function(){
	   self.location="/biz/member/detail/${data.email }/board/1";
   })
   $("#qna").click(function(){
	   self.location="/biz/member/detail/${data.email }/qna/1";
   })
    </script>
</body>
</html>