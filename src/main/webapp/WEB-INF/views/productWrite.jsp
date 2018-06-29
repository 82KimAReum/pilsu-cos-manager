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
    <title>상품추가</title>
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/lightbox.css'/>" rel="stylesheet"> 
    <link href="<c:url value='/resources/css/animate.min.css'/>" rel="stylesheet"> 
	<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/responsive.css'/>" rel="stylesheet">

    <link rel="shortcut icon" href="<c:url value='/resources/images/ico/favicon.ico'/>">
    <%-- <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='/resources/images/ico/apple-touch-icon-144-precomposed.png'/>">
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
                        <li class="active"><a href="/biz/product">상품관리 </a>               
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
                            <h1 class="title">상품추가</h1>
                            <!-- <p>&nbsp;코스 커뮤니티 글 목록</p> -->
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
				    <label for="inputEmail3" class="col-sm-2 control-label" >상품이름</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="productname" placeholder="제목"  value="${data.productname }">
				    </div>
				    <label for="inputEmail3" class="col-sm-2 control-label">설명</label>
				    <div class="col-sm-10">
				      <textarea class="form-control" rows="10" >${data.productdesc }</textarea>
				  	</div>
				    <label for="inputEmail3" class="col-sm-2 control-label">가격</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="price" placeholder="가격"  value="${data.price }">
				    </div>
				    <label for="inputEmail3" class="col-sm-2 control-label">용량</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="capacity" placeholder="용량"  value="${data.capacity }">
				    </div>
				    <label for="inputEmail3" class="col-sm-2 control-label">이미지</label>
				    <div class="col-sm-10">
				    	<img id="productImg" alt="이미지" hidden="hidden"/>
				      <input type="text" class="form-control" id="image" placeholder="이미지"  value="${data.image }">
				    </div>
				    
				    <label for="inputEmail3" class="col-sm-2 control-label">성별</label>
				    <div class="col-sm-10">
				    	<input type="radio"  name="gender" value="female" checked="checked"> Female
				     	<input type="radio" name="gender" value="male"> Male
				    </div>
				    
				    
				 </div>
				 <div class="form-group">
				     <label for="inputEmail3" class="col-sm-2 control-label">브랜드코드</label>
				    <div class="col-sm-10">
				      	<select class="selectpicker"   id="brandcode">
						  <option value="A">에뛰드하우스</option>
						  <option value="B">이니스프리</option>
						  <option value="C">스킨푸드</option>
						  <option value="D">더페이스샵</option>
						  <option value="E">미샤</option>
						  <option value="F">토니모리</option>
						  <option value="G">네이처리퍼블릭</option>
						  <option value="H">기타</option>
						</select>
				    </div>
				  </div>
				  <div class="form-group">
				   <label for="inputEmail3" class="col-sm-2 control-label">카테고리코드</label>
				    <div class="col-sm-10">
				      	<select class="selectpicker"   id="categorycode">
						  <option value="1">스킨</option>
						  <option value="2">로션</option>
						  <option value="3">에센스</option>
						  <option value="4">크림/젤</option>
						  <option value="5">오일 / 쉐이빙크림</option>
						  <option value="6">선케어</option>
						  <option value="7">클렌징</option>
						  <option value="8">마스크펙</option>
						</select>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" class="btn btn-default" id="submit">추가</button>
				      <button type="button" class="btn btn-default" onclick="javascript:history.back();">뒤로 가기</button>
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
   /*  $(document).ready(function(){
       
    }); */
    
    $('#image').blur(function() {
    	$('#productImg').attr('hidden',false);
 	   $("#productImg").attr("src",$('#image').val());
 	   //alert("hi")
 	 });
    
    $("#submit").click(function() {
    	var radio = $("input:radio[name='gender']:checked").val();
    	

    	var productname=$("#productname").val();
    	var productdesc=$("textarea").val();
  		var price=$("#price").val();
  		var capacity=$("#capacity").val();
  		var image=$("#image").val();
  		var brandcode=$("#brandcode").val();
  		var categorycode=$("#categorycode").val();
       	  $.ajax({
		 	url:"/biz/productWrite",
			method:"POST",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			data:JSON.stringify({
				productname:productname,
				productdesc:productdesc,
				price:price,
				capacity:capacity,
				image:image,
				brandcode:brandcode,
				categorycode:categorycode,
				gender:radio
			}),
			success:function(data){
			}
	       	
		});
       	alert("입력 완료") 
		  location.replace("/biz/product/1");  
	});
     
    </script>
</body>
</html>