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
    <title>주문 상세</title>
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
                        <li class="active"><a href="/biz/order">주문</a></li>
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
                        <li ><a href="/biz/member ">회원관리</a></li>                    
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
                            <h1 class="title">들어온 주문</h1>
                            <p>&nbsp;${member.orderno } 주문 상세</p>
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
                    	<tr>
                    		<td>주문번호</td>
                    		<td>${member.orderno }</td>
                    	</tr>
                    	<tr>
                    		<td>이름</td>
                    		<td>${member.name }(<a href='/biz/member/detail/${member.email }'>${member.email }</a>)</td>
                    	</tr>
                    	<tr>
                    		<td>전호번호</td>
                    		<td>${member.phone }</td>
                    	</tr>
                    	<tr>
                    		<td>주소</td>
                    		<td>(${member.zipcode }) ${member.address1 } ${member.address2 }</td>
                    	</tr>
                    	<tr>
                    		<td>결제방식</td>
                    		<td>${member.payment }</td>
                    	</tr>
                    	<tr>
                    		<td>요청사항</td>
                    		<td>${member.comments }</td>
                    	</tr>
                    	<tr>
                    		<td>주문일자</td>
                    		<td>${member.orderdate }</td>
                    	</tr>
                    	<tr>
                    		<td>발송상태</td>
                    		<td>${member.orderstat }</td>
                    	</tr>
                    	
                    </tbody>
                </table>   
                
                <table class="table table-hover" >
                <caption>주문 상품</caption>
                	<thead>
                		<td></td>
                		<td>상품이름</td>
                		<td></td>
                		<td>개수</td>
                		<td>가격</td>
                	</thead>
                	<tbody>
                		<c:forEach items="${data }" var="tem" varStatus="status">
                			<tr>
                				<td>${status.count }</td>
                				<td><a href='/biz/product/detail/${tem.productcode }'>${tem.productname }(${tem.productcode })</a></td>
                				<td><img src='${tem.image }' width="50px"/></td>
                				<td>${tem.amount }</td>
                				<td>${tem.price * tem.amount }</td>
                			</tr>
                		</c:forEach>
                	</tbody>
                </table>           
              
				  
				  
				 
				      <button type="button" class="btn btn-default" id="edit">발송완료</button>
				      <button type="button" class="btn btn-default" onclick="javascript:history.back();">뒤로 가기</button>
				  
			


               
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
	  
    }); 
  
   $("#edit").click(function() {//수정
   	
  	
     	 $.ajax({
		 	url:"/biz/order/detail/"+"${member.orderno}",
			method:"PUT",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			
		});
         	 alert("발송 완료")
  			 location.replace("/biz/order/detail/${member.orderno}");  
  		
   	
	});
   
    </script>
</body>
</html>
    