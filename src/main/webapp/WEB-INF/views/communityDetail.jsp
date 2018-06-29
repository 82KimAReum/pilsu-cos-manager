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
    <title>커뮤니티</title>
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
</head>

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
                        <li class="dropdown active"><a href="#">게시글관리 <i class="fa fa-angle-down"></i></a>
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
                            <h1 class="title">커뮤니티</h1>
                            <p>&nbsp;게시글 상세</p>
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
				 <caption>커뮤니티 글</caption> 
                    <tbody>
                    	<tr>
                    		<td colspan="4">제목: ${data.title }</td>
                    	</tr>
                    	
                    	<tr>
                    		<td colspan="4">작성자: ${data.name }(<a href='/biz/member/detail/${data.email }'>${data.email }</a>)</td>
                    		
                    	</tr>
                    	<tr>
                    		
                    		<td>조회수: ${data.readcount }</td>
                    		<td style="width:10%">좋아요: ${data.likecount }</td>
                    		<td style="width:10%">싫어요: ${data.dislikecount }</td>
                    		<td>작성일: ${data.regdate }</td>
                    	</tr>
                    	
                    	<tr>
                    		<td>내용</td>
                    		<td colspan="3"><textarea readonly="readonly" rows="15" cols="120">${data.contents }</textarea></td>
                    	</tr>
                    	<tr>
                    		<td colspan="4">
                    			<button type="button" class="btn btn-default" onclick="javascript:history.back();">뒤로 가기</button>
				      			<button type="button" class="btn btn-default" id="btnDelete">삭제하기</button>
                    		</td>
                    	</tr>
                    </tbody>
                </table>   
				  
				
				     
				
				
			


               
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
    	var enco=encoding($("textarea").val())
	  	$("textarea").text(enco)
    }); 
   
   $("#btnDelete").click(function() {//삭제
	   var r = confirm("정말 삭제하시겠습니까?");
	    if (r == true) {
		   var boardno="${data.boardno}";
	  	
			//alert(contents)
	     	$.ajax({
			 	url:"/biz/community/1",
				method:"DELETE",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				data:JSON.stringify({array:boardno}),
				success:function(data){
				}
		       	
			});
	     	location.replace("/biz/community/1");
	    } else {
	        return false;
	    }
	});
     
    </script>
</body>
</html>