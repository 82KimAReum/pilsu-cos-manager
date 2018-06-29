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
    <title>상품상세</title>
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
                            <h1 class="title">상품 디테일</h1>
                            <p>&nbsp;${data.productname }</p>
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
				      <input type="text" class="form-control" id="productname" placeholder="제목" readonly="readonly" value="${data.productname }">
				    </div>
				   </div>
				   <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">설명</label>
				    <div class="col-sm-10">
				      <textarea class="form-control" rows="10" readonly="readonly" >${data.productdesc }</textarea>
				  	</div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">가격</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="price" placeholder="가격" readonly="readonly" value="${data.price }">
				    </div>
				   </div>
				   <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">용량</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="capacity" placeholder="용량" readonly="readonly" value="${data.capacity }">
				    </div>
				   </div>
				   <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">이미지</label>
				    <div class="col-sm-10">
				    	<img id="productImg" alt="이미지"/>
				      <input type="text" class="form-control" id="image" placeholder="이미지" readonly="readonly" value="${data.image }">
				    </div>
				   </div>
				  
				 
				  <div class="form-group">
				     <label for="inputEmail3" class="col-sm-2 control-label">브랜드코드</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="brand"  readonly="readonly" value=""/>
				    	<div id="brandnum"  hidden="hidden" >${data.brandcode }</div>
				      	<select class="selectpicker" hidden="hidden"  id="brandcode">
						  <option></option>
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
				    	<input type="text" class="form-control" id="category" readonly="readonly" value=""/>
				    	<div  id="categorynum" hidden="hidden" >${data.categorycode }</div>
				      	<select class="selectpicker" hidden="hidden"  id="categorycode">
						  <option></option>
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
				      <button type="button" class="btn btn-default" id="edit">수정하기</button>
				      <button type="button" class="btn btn-default" onclick="javascript:history.back();">뒤로 가기</button>
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
	   $("#productImg").attr("src","${data.image }");
	   var productname=$("#productname").val();
	   productname=encoding(productname);
	   
	   var productdesc=$('textarea').val();
	   productdesc=encoding(productdesc);
	  
	   $("#productname").val(productname);
       $("textarea").text(productdesc);
       brand();
       category();
       
    }); 
    
   function brand(){
	   var brand= $("#brandnum").text();
	  
       switch(brand){
       case 'A': $('#brand').val("에뛰드 하우스");break;
       case 'B': $('#brand').val("이니스프리");break;
       case 'C': $('#brand').val("스킨푸드");break;
       case 'D': $('#brand').val("더페이스샵");break;
       case 'E': $('#brand').val("미샤");break;
       case 'F': $('#brand').val("토니모리");break;
       case 'G': $('#brand').val("네이처리퍼블릭");break;
       case 'H': $('#brand').val("기타");break;
       }
   }
   function category(){
	   var category =$("#categorynum").text();
	   
	   switch(category){
	   case '1': $("#category").val("스킨");break;
	   case '2': $("#category").val("로션");break;
	   case '3': $("#category").val("에센스");break;
	   case '4': $("#category").val("크림/젤");break;
	   case '5': $("#category").val("오일/쉐이빙크림");break;
	   case '6': $("#category").val("선케어");break;
	   case '7': $("#category").val("클렌징");break;
	   case '8': $("#category").val("마스크팩");break;
	   }
   }
    
   $('#image').blur(function() {
	   $("#productImg").attr("src",$('#image').val());
	   //alert("hi")
	 });
   
   $('#brandcode').change(function() {
	   var tem=$("#brandcode option:selected").val();//코드
	   var tem1=$("#brandcode option:selected").text();//이름
	   $('#brandnum').text(tem);
	   $('#brand').val(tem1);
	 });
   $('#categorycode').change(function() {
	   var tem=$("#categorycode option:selected").text();//이름
	   var tem1=$("#categorycode option:selected").val();//코드
	   $('#categorynum').text(tem1);
	   $('#category').val(tem);
	 });
   $("#edit").click(function() {//수정
   	
  		
  		if($("#edit").text()=="수정하기"){
   			$('#productname').attr('readonly',false);
   			$('textarea').attr('readonly',false);
   			$('#price').attr('readonly',false);
   			$('#capacity').attr('readonly',false);
   			$('#image').attr('readonly',false);
   			$('#brandcode').attr('hidden',false);
   			$('#categorycode').attr('hidden',false);
   			$("#edit").text("수정확인");
   			
   			
  		}else{
  			var productname=$("#productname").val();
  	    	var productdesc=$("textarea").val();
  	  		var price=$("#price").val();
  	  		var capacity=$("#capacity").val();
  	  		var image=$("#image").val();
  	  		var brandcode=$("#brandnum").text();
  	  		var categorycode=$("#categorynum").text();
     	  $.ajax({
		 	url:"/biz/product/detail/"+"${data.productcode}",
			method:"PUT",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			data:JSON.stringify({
				productcode:"${data.productcode}",
				productname:productname,
				productdesc:productdesc,
				price:price,
				capacity:capacity,
				image:image,
				brandcode:brandcode,
				categorycode:categorycode
			}),
			success:function(data){
			} 
      	
		});
         	 alert("수정 완료")
         	$("#edit").text("수정하기");
  			 location.replace("/biz/product/detail/${data.productcode}");  
  		}
   	
	});
   $("#btnDelete").click(function() {//삭제
	   var r = confirm("정말 삭제하시겠습니까?");
	    if (r == true) {
  			var productcode="${data.productcode}";
			//alert(contents)
	     	$.ajax({
			 	url:"/biz/product/1",
				method:"DELETE",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				data:JSON.stringify({array:productcode}),
				success:function(data){
				}
		       	
			});
			 location.replace("/biz/product/1"); 
	    } else {
	        return false;
	    }
	});
     
    </script>
</body>
</html>