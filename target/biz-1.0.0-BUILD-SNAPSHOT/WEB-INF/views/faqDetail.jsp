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
    <title>FAQ</title>
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
                        <li class="dropdown active"><a href="#">게시글관리 <i class="fa fa-angle-down"></i></a>
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
                            <h1 class="title">FAQ</h1>
                            <p>&nbsp;FAQ상세</p>
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
               
              
               <form class="form-horizontal">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">제목</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="title" readonly="readonly" placeholder="제목">
				    </div>
				  </div>
				  
				  <div class="form-group">
				   	<label for="inputEmail3" class="col-sm-2 control-label">내용</label>
				    <div class="col-sm-10">
				      <textarea class="form-control" rows="20" readonly="readonly"></textarea>
				  	</div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" class="btn btn-default" id="edit">수정하기</button>
				      <button type="button" class="btn btn-default" onclick="javascript:location.replace('/biz/faq');">뒤로 가기</button>
				      <button type="button" class="btn btn-default" id="btnDelete">삭제하기</button>
				    </div>
				  </div>
			</form>


               
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
   $(document).ready(function(){
	   var title="${data.title}";
	   title=title.replace(/&quot;/gi,"\"");
	   title=title.replace(/&apos;/gi,"'");
	   title=title.replace(/&lt;/gi,"<");
	   title=title.replace(/&gt;/gi,">");
	   
	   var contents="${data.contents}";
	   contents=contents.replace(/&quot;/gi,"\"");
	   contents=contents.replace(/&apos;/gi,"'");
	   contents=contents.replace(/&lt;/gi,"<");
	   contents=contents.replace(/&gt;/gi,">");
	   contents=contents.replace(/<br\/>/gi,"\r\n");
	   $("#title").val(title);
       $("textarea").text(contents);
    });
   
    $("#edit").click(function() {//수정
    	
   		
   		if($("#edit").text()=="수정하기"){
   			$('#title').attr('readonly',false);
    		$('textarea').attr('readonly',false);
    		$("#edit").text("수정확인");
    		
   		}else{
   		 var faqno=${data.faqno};
       	 var title=$("#title").val();
       	 var contents=$("textarea").val();
     		//alert(contents)
      	 $.ajax({
		 	url:"/biz/faq/detail/"+${data.faqno},
			method:"PUT",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			data:JSON.stringify({
				faqno:faqno,
				title:title,
				contents:contents
			}),
			success:function(data){
			}
       	
		});
          	alert("글 수정 완료")
          	$("#edit").text("수정하기");
   			location.replace("/biz/faq/detail/"+faqno);
   		}
    	
	});
    $("#btnDelete").click(function() {//삭제
    	var r = confirm("정말 삭제하시겠습니까?");
        if (r == true) {
		   	 var faqno=${data.faqno};
		   	 var title=$("#title").val();
		   	 var contents=$("textarea").val();
		 		//alert(contents)
		      	$.ajax({
				 	url:"/biz/faq/1",
					method:"DELETE",
					dataType:"json",
					contentType:"application/json; charset=UTF-8",
					data:JSON.stringify({array:faqno}),
					success:function(data){
					}
			       	
				});
				location.replace("/biz/faq/1");
        } else {
            return false;
        }
	});
    </script>
</body>
</html>
    