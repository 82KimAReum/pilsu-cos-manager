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
    <title>회원관리</title>
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
                            <h1 class="title">회원 관리</h1>
                            <p>&nbsp;회원 목록</p>
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
               
                    <div class="search">
                        <form >
                            
                            <div class="field-toggle">
                                <input type="text" id="txtSearch" class="search-form" autocomplete="off" placeholder="Search">
                            </div>
                            <i class="fa fa-search" id="IconSearch"></i>
                        </form>
                    </div>
                   <br/>
                            <table class="table table-hover">    
                                   <caption>
                                        <a href='/biz/member/1'>전체보기</a> (<span id="memberCount">${page.count }</span>) 
                                    </caption>          
                                <thead>                  
                                    <tr class="">
                                        <th ><input type="checkbox" name="chkAll" /></th>
                                        <th >이메일</th>
                                        <th>이름</th>
                                        <th>성별</th>
                                        <th>타입</th>
                                        <th>휴테폰</th>
                                        <th>우편번호</th>
                                        <th>사용</th>
                                        <th>나이</th>
                                    </tr>
                                </thead>
                                 <tbody id="result">
                                	<c:forEach items="${data }" var="member" varStatus="status">
                                		<tr>
                                			<td><input type="checkbox" name="chk" value="${member.email }"/></td>
                                			<%-- <td>${(page.page-1)*10+status.count }</td> --%>
                                			<td><a href='/biz/member/detail/${member.email }'>${member.email }</a></td>
                                			<td>${member.name }</td>
                                			<td>${member.gender }</td>
                                			<td>${member.skintype }</td>
                                			<td>${member.phone }</td>
                                			<td>${member.zipcode }</td>
                                			<td>${member.regstat }</td>
                                			<td>${sysYear-member.ageyear }
                                		</tr>
                                	</c:forEach>
                                </tbody>
                                
                            </table>
                            <table class="table table-hover" >
                                    <tr>
                                        <td style="width:2%"><input type="checkbox" name="chkAll"/></td>
                                        <td ><button id="btnDelete">탈퇴</button></td>
                                        
                                    </tr>
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
			                     	<li><a href='/biz/member/${page.page-1 }${searchData}'>left</a></li>
			                     </c:when>
			                     <c:otherwise >
			                     	<li><a href=''>left</a></li>
			                     </c:otherwise>
		                     </c:choose>
		                     <c:forEach begin="${page.pageStart }" end="${page.pageEnd }"  varStatus="status">
		                     	<li <c:out value="${status.current ==page.page?'class=active':'' }" /> ><a href='/biz/member/${status.current }${searchData}'>${status.current }</a></li>
		                     </c:forEach>
		                     <c:choose>
			                     <c:when test="${page.page >= page.pageTotalEnd }" >
			                     	<li><a href=''>right</a></li>
			                     </c:when>
			                     <c:otherwise >
			                     	<li><a href='/biz/member/${page.page+1 }${searchData}'>right</a></li>
			                     </c:otherwise>
		                     </c:choose>
                     </ul>
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
    <script>
    path=window.location.pathname.split("/")[3];//현재 보여줄 페이지
	if(path==null)path=1;
	var url="/biz/members/"
		$(function(){
        	///////////////////체크박스 전체 선택 & 전체 해제////////////////////////
            $('input:checkbox[name="chkAll"]').click(function(){
                if($(this).is(":checked")){
                    $('input:checkbox[name="chkAll"]').prop("checked",true);
                    $('input:checkbox[name="chk"]').prop("checked",true);
                }else{
                    $('input:checkbox[name="chkAll"]').prop("checked",false);
                    $('input:checkbox[name="chk"]').prop("checked",false);
                }

            })
           
        })
         
        
    //////////////////멤버 삭제////////////////////////////
    $("#btnDelete").bind("click",function(){
    	 var r = confirm("회원을 비활성 하시겠습니까?");
    	    if (r == true) {
    	
		    	var str="";
		    	hi=$("input:checkbox[name='chk']:checked").each(function(){
		    		//str+="'"+this.value+"'";
		    		str+=this.value;
					str+=",";
		    	})
		    	str=str.substr(0,str.length-1);
				$.ajax({
					url:"/biz/member/"+path,
					method:"DELETE",
					data:JSON.stringify({
						array:str
					}),
					success:function(data){
					}
				}) 
				location.replace("/biz/member/1"); 
    	    } else {
    	        
    	        return false;
    	    }	
				
	})
	
	
	//////////////////////멤버 검색/////////////////////////////////
	var text="";
	
	
	 function searchFaq(page){
		text=$("#txtSearch").val();
       	self.location="/biz/member/1?data="+text;
	}
	 
	
	 $('#txtSearch').keydown(function(e) {
	    if (e.keyCode == 13) {
	    	 e.preventDefault();
	    	$("#IconSearch").click();
	    }      
	});
    
    var flag=false;
    $("#IconSearch").bind("click",function(){
    	
    	if(!flag){
    		flag=true;
    	}else{
    		if($("#txtSearch").val()!=""){
    			searchFaq(path);
	    		flag=false;
    		}
    	}
    	
    })    	
    
    
    
	  
    </script>
</body>
</html>
