<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Article</title>

  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <%@ include file= "../common/_header_css_sum.jspf" %>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <!-- _top.jspf -->
  <%@ include file="../common/_top.jspf" %>
  
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="../common/_nav.jspf" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        글 상세보기
        <small>Article</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${path}/main/mainpage"><i class="fa fa-home"></i>Home</a></li>
        <li class="active">글 상세보기</li>
      </ol>
    </section>
<!-- ------------------------------------------------- -->    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        
        <!-- right column -->
        <div class="col-md-12">
          <c:set var="article" value="${requestScope.detail}"/>
          <c:set var="category" value="${requestScope.category}"/>
          <!-- general form elements disabled -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title" style="display:inline-block"> [${category}] ${article.title}</h3>
              <div class="pull-right" style="display:inline-block">
                  <label style="display:inline">작성자:</label>&nbsp;&nbsp;${article.user.name}&nbsp;&nbsp;&nbsp;&nbsp;
                  <label style="display:inline">작성날짜:</label>&nbsp;&nbsp;
					    <fmt:parseDate value="${article.updatedAt}" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm"/>
					    <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/>
              </div>
            </div>
            
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form" method="post">
                <!-- textarea -->
                <div class="form-group">
                    ${article.description}
                </div>
                <div class="box-footer" style="padding-left: 0; padding-right:0;">
               		<c:if test="${category == '공지사항'}">
                  		<button type="button" class="btn btn-default" onclick="location.href='noticepage' ">목록으로</button>
                	</c:if>
                  	<c:if test="${category == '자유게시판'}">
                  		<button type="button" class="btn btn-default" onclick="location.href='bbspage' ">목록으로</button>
                	</c:if>
               		<c:if test="${user.name == article.user.name }">
	                	<c:if test="${category == '공지사항'}">
	                  		<button type="button" class="btn btn-info pull-right" style="margin: 0 0 0 20px" onclick= 'cancelConfirm("deletenotice?id=${article.notice_id}")'>삭제</button>
	                  		<button type="button" class="btn btn-info pull-right" onclick="location.href='updatenoticepage?id=${article.notice_id}' ">수정</button>
	                	</c:if>
	                	<c:if test="${category == '자유게시판'}">
	                		 <button type="button" class="btn btn-info pull-right" style="margin: 0 0 0 20px" onclick= 'cancelConfirm("deletebbs?id=${article.bbs_id}")'>삭제</button>
	                		 <button type="button" class="btn btn-info pull-right" onclick="location.href='updatebbspage?id=${article.bbs_id}'">수정</button>
	               		</c:if>
                	</c:if>
                </div>
              </form>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
<!-- -------------------------------------------- -->    
  </div>
  <!-- /.content-wrapper -->
  <%@ include file = "../common/_bottom.jspf" %>

</div>
<!-- ./wrapper -->

<%@ include file = "../common/_commonScriptList.jspf" %>

<script type="text/javascript">
//오류발생.. 주석내에 el이나 tag형식 사용하지 말것..
/* $(function() {
	//jstl의 변수를 javascript로 바로 사용 불가. ' c:out value="jstl변수명" '을 사용할 것.
	//바로 el로 받을경우 not defined(?) 같은 오류로 인식되지 않는다.
	var articleCategory = '<c:out value="${categoryOption}" />';
	console.log(articleCategory);
	$('.selection option').val(articleCategory).attr('selected', true);
	
	//:contains() --> ()안에 변수 삽입불가. 변수명을 문자열로 인식함.
	//$('.selection option:contains(Board)').attr('selected', true);
});*/

function cancelConfirm(url){
	if(confirm("게시물을 삭제하시겠습니까?")){
		location.replace(url);
	} 
}

</script>

</body>
</html>