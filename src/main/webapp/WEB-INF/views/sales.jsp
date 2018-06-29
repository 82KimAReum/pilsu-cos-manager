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
    <title>매출관리</title>
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/lightbox.css'/>" rel="stylesheet"> 
    <link href="<c:url value='/resources/css/animate.min.css'/>" rel="stylesheet"> 
	<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/responsive.css'/>" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
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
                        <li class="active"><a href="/biz/sales">매출관리 </a>        
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
                            <h1 class="title">매출 관리</h1>
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
                
                    <table class="table table-hover" >
                        <tr>
                            <td style="width: 15%">년도 선택</td>
                            <td class="left">
                                <select class="form-control input-sm" id="selYear"></select>
                                ~
                                <select class="form-control input-sm" id="selYear2"></select>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>월 선택</td>
                            <td>
                                <select class="form-control input-sm" id="selMon"></select>
                                ~
                                <select class="form-control input-sm" id="selMon2"></select>
                            </td>
                            
                        </tr>
                        
                        <tr>
                        	<td>제품 선택</td>
                        	<td>
                        	<select class="selectpicker" data-live-search="true" id="code">
                        		<option data-tokens=""></option>
                        		<c:forEach items="${product }" var="pro">
                        			<option data-tokens="${pro.productcode } ${pro.productname}" value="${pro.productcode }">${pro.productname }(${pro.productcode })</option>
                        		</c:forEach>
							</select>
							<input class="right" id="search" type="button" value="제출"/>
                        	</td>
                        </tr>
                    </table>
                   
                            <table class="table table-hover" >    
                            <caption>&nbsp;<a href='/biz/sales/1'>매출</a></caption>
                                <thead>                  
                                   <tr>
                                       <td>주문번호</td><td>상품이름</td>
                                       <td>주문수</td><td>매출액</td>
                                       <td>주문일자</td>
                                   </tr>
                                </thead>
                                <tbody id="result">
                                	<c:forEach items="${data }" var="code">
                                		<tr>
                                			<td><a href='/biz/order/detail/${code.orderno }'>${code.orderno }</a></td>
                                			<td><a href='/biz/product/detail/${code.productcode }'>${code.productname }</a></td>
                                			<td>${code.amount }</td>
                                			<td>${code.profit }</td>
                                			<td>${code.orderdate}</td>
                                		</tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${!empty page.searchData }">
					<c:set value="?data=${page.searchData }" var="searchData"/>
				</c:if>
				<c:if test="${empty page.searchData }">
					<c:set value="" var="searchData"/>
				</c:if>
				
                     <div class="blog-pagination" id="pages"><!-- page index -->
                     	<ul class="pagination" >
		                    <c:choose>
			                     <c:when test="${page.page gt 1 }" >
			                     	<li><a href='/biz/sales/${page.page-1 }${searchData}'>left</a></li>
			                     </c:when>
			                     <c:otherwise >
			                     	<li><a href=''>left</a></li>
			                     </c:otherwise>
		                     </c:choose>
		                     <c:forEach begin="${page.pageStart }" end="${page.pageEnd }"  varStatus="status">
		                     	<li <c:out value="${status.current ==page.page?'class=active':'' }" /> ><a href='/biz/sales/${status.current }${searchData}'>${status.current }</a></li>
		                     </c:forEach>
		                     <c:choose>
			                     <c:when test="${page.page >= page.pageTotalEnd }" >
			                     	<li><a href=''>right</a></li>
			                     </c:when>
			                     <c:otherwise >
			                     	<li><a href='/biz/sales/${page.page+1 }${searchData}'>right</a></li>
			                     </c:otherwise>
		                     </c:choose>
                     </ul>
           			</div>
                    <table class="table table-hover" >
                            <tr>
                                <td class="right">총 판매량:   <input  type="text" id="sales" value="${profit.amount }" readonly/></td>
                            </tr>
                            <tr>
                                <td class="right">총 매출액:   <input  type="text" id="sales" value="${profit.profit }" readonly/></td>
                            </tr>
                    </table>
	 				<div class="blog-pagination" id="pages"><!-- page index -->
           			</div>
                    
            </div>
        </div>
    </section>
    <!--/#blog-->

    

     <script type="text/javascript" src="<c:url value='/resources/js/jquery.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/lightbox.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/wow.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/main.js'/>"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
    
    <script>
            $(function(){
                    var now=new Date();
                    var year=parseInt( now.getFullYear());
                    var str="";
                    for(var i=year-50; i<year+51; i++) {
                        if(i==year){
                            str+="<option selected value='"+i+"'>"+i+"</option>"   ;
                        }else{
                            str+="<option value='"+i+"'>"+i+"</option>"   ;
                        }
                    }
                    $('#selYear').html(str);
                    var startYear=parseInt($('#selYear option:selected').val())
                    var str="";
                    for(var i=startYear ; i<startYear+51; i++){
                        if(i==startYear){
                            str+="<option selected value='"+i+"'>"+i+"</option>"   ;
                        }else{
                            str+="<option value='"+i+"'>"+i+"</option>"   ;
                        }
                    }$('#selYear2').html(str);
                    str="";
                    var month=parseInt(now.getMonth())+1;
                    if(month<10){month="0"+month}
                    for(var i=1; i<=12;i++){
                    	if(i<10)i="0"+i;
                        if(i==month){
                             str+="<option selected value='"+i+"'>"+i+"</option>"   ;
                        }else{
                            str+="<option value='"+i+"'>"+i+"</option>"   ;
                        }
                    }$('#selMon').html(str);
                    $('#selMon2').html(str);
                    $('#selYear').bind("change",function(){
                        var startYear=parseInt($('#selYear option:selected').val())
                        var str="";
                        for(var i=startYear ; i<startYear+51; i++){
                            if(i==startYear){
                             str+="<option selected value='"+i+"'>"+i+"</option>"   ;
                            }else{
                                str+="<option value='"+i+"'>"+i+"</option>"   ;
                            }
                        }$('#selYear2').html(str);
                    })
                    $('#selMon2 ,#selMon').bind("change",function(){
                        if($('#selYear').val()==$('#selYear2').val()){
                            if(parseInt( $('#selMon option:selected').val())>parseInt($('#selMon2 option:selected').val())){
                                
                                $('#selMon2').val($('#selMon option:selected').val()).prop("selected", true);
                            }
                            
                        }
                    })
                    var sd=urlparam("sd");
                    var ed=urlparam("ed");
                    var data=urlparam("data")!=null?urlparam("data"):"";
                    var startY=sd!=null?sd.substr(0,4):year;
                    var endY=ed!=null?ed.substr(0,4):startYear;
                    var startM=sd!=null?sd.substring(5,7):month;
                    var endM=ed!=null?ed.substring(5,7):month;
                    $("#selYear").val(startY).prop("selected", true);
                    $("#selYear2").val(endY).prop("selected", true);
                    $("#selMon").val(startM).prop("selected", true);
                    $("#selMon2").val(endM).prop("selected", true);
                    $(".selectpicker").val(data).prop("selected", true);
            })
            
            $("#search").click(function(){
            	 var code=$(".selectpicker option:selected").val();//productcode
            	 var startY=$("#selYear option:selected").val();
            	 var endY=$("#selYear2 option:selected").val();
            	 var startM=$("#selMon option:selected").val();
            	 var endM=$("#selMon2 option:selected").val();
            	 var sd=startY+"/"+startM+"/01";
            	 var lastDay = ( new Date( endY, endM, 0) ).getDate();
				
            	 
            	 var ed=endY+"/"+endM+"/"+lastDay;
            	 
            	 self.location="/biz/sales/1?data="+code+"&sd="+sd+"&ed="+ed;
            })
            function urlparam(name){
			    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
			    if (results==null){
			       return null;
			    }
			    else{
			       return results[1] || 0;
			    }
			}



    </script>
</body>
</html>
    