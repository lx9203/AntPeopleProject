<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>게시글 작성</title>
  
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
       	게시글 작성
        <small>Article</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${path}/main/mainpage"><i class="fa fa-home"></i>Home</a></li>
        <li class="active">게시글 작성</li>
      </ol>
    </section>
<!-- ------------------------------------------------- --> 


<!-- ------------------------------------------------- -->   
    <!-- Main content -->
    <section class="content">
    <c:set var="isNew" value="${requestScope.isNew}"/>
    <c:set var="next" value='${requestScope.nextControl}'/>
      <div class="row">
        
        <!-- right column -->
        <div class="col-md-12">
          <!-- general form elements disabled -->
          <div class="box box-info">
            <div class="box-body">
            
              <!-- 새글작성 : order값으로 newArticle을 받으면 실행. -->
              <c:if test="${isNew == 'newArticle'}">
	              <form role="form" action="articleallotter" method="post" >
	              	<input type="text" class="form-control" name="articleNum" value="${next}" style="display:none">
	              	<input type="text" class="form-control" name="bbs_id" value="0" style="display:none">
	                <!-- text input -->
	                
	                <div class="form-group pull-right" style="display:inline-block">
	                <jsp:useBean id="toDay" class="java.util.Date" />
		                <label style="display:inline">작성자:</label>&nbsp;&nbsp;${user.name}&nbsp;&nbsp;&nbsp;&nbsp;
             		</div>
             		
	                <div class="form-group">
	                  <label>제목</label>
	                  <input type="text" class="form-control" name="title">
	                </div>
	
	                <!-- textarea -->
	                <div class="form-group">
	                  <label>내용</label>
	                	<textarea id="editor1" name="description" rows="10" cols="80">
                              
                    	</textarea>
	                </div>
	
					<div class="box-footer" style="padding-left: 0; padding-right:0;">
					<c:if test="${next == 1}">
	                  <button type="button" class="btn btn-default" onclick="location.href='${path}/main/bbspage'">목록으로</button>
	                </c:if>
	                  
					<c:if test="${next == 3}">
	                  <button type="button" class="btn btn-default" onclick="location.href='${path}/main/noticepage'">목록으로</button>
	                </c:if>
	                  
	                  <button type="submit" class="btn btn-info pull-right">작성완료</button>
	                </div>
	                <!-- /.box-footer -->
	              </form>
              </c:if>
              
              <!--게시글 수정 -->
              <c:if test="${isNew == 'modifyBbs'}">
              <c:set var="article" value="${requestScope.bbsDetail}"/>
	              <form role="form" action="articleallotter" method="post" onsubmit="return check()">
	              <input type="text" class="form-control" name="articleNum" value="${next}" style="display:none">
	              <input type="text" class="form-control" name="bbs_id" value="${article.bbs_id}" style="display:none">
	                <!-- text input -->
	                
	              <div class="pull-right" style="display:inline-block">
	                  <label style="display:inline">작성자:</label>&nbsp;&nbsp;${article.user.name}&nbsp;&nbsp;&nbsp;&nbsp;
	                  <label style="display:inline">작성날짜:</label>&nbsp;&nbsp;
	                  <%-- <fmt:formatDate value="${board.updatedAt}" pattern="yyyy-MM-dd HH:mm" type="date"/> --%>
						    <fmt:parseDate value="${article.updatedAt}" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
						    <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/>
	              </div>
	                
	                <div class="form-group">
	                  <label>제목</label>
	                  <input type="text" class="form-control" name="title" value="${article.title}">
	                </div>
	
	                <!-- textarea -->
	                <div class="form-group">
	                  <label>내용</label>
	                  <textarea id="editor1" class="form-control" rows="3" name="description">
	                  	${article.description}
	                  </textarea>
	                </div>
					<div class="box-footer" style="padding-left: 0; padding-right:0;">
	                  <button type="button" class="btn btn-default" onclick="location.href='${path}/main/bbspage' ">목록으로</button>
	                  <button type="submit" class="btn btn-info pull-right">수정완료</button>
	                </div>
	                <!-- /.box-footer -->
	              </form>
              </c:if>
              
              <!--공지사항 수정 -->
              <c:if test="${isNew == 'modifyNotice'}">
              <c:set var="article" value="${requestScope.noticeDetail}"/>
	              <form role="form" action="articleallotter" method="post" onsubmit="return check()">
	              <input type="text" class="form-control" name="articleNum" value="${next}" style="display:none">
	              <input type="text" class="form-control" name="bbs_id" value="${article.notice_id}" style="display:none">
	                <!-- text input -->
	              	<div class="pull-right" style="display:inline-block">
	                  <label style="display:inline">작성자:</label>&nbsp;&nbsp;${article.user.name}&nbsp;&nbsp;&nbsp;&nbsp;
	                  <label style="display:inline">작성날짜:</label>&nbsp;&nbsp;
	                  <%-- <fmt:formatDate value="${board.updatedAt}" pattern="yyyy-MM-dd HH:mm" type="date"/> --%>
						    <fmt:parseDate value="${article.updatedAt}" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
						    <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/>
	              	</div>
	                
	                <div class="form-group">
	                  <label>제목</label>
	                  <input type="text" class="form-control" name="title" value="${article.title}">
	                </div>
	
	                <!-- textarea -->
	                <div class="form-group">
	                  <label>내용</label>
	                  <textarea id="editor1" class="form-control" rows="3" name="description">
	                  	${article.description}
	                  </textarea>
	                </div>
					<div class="box-footer" style="padding-left: 0; padding-right:0;">
	                  <button type="button" class="btn btn-default" onclick="location.href='${path}/main/noticepage' ">목록으로</button>
	                  <button type="submit" class="btn btn-info pull-right">수정완료</button>
	                </div>
	                <!-- /.box-footer -->
	              </form>
              </c:if>
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

<!-- CK Editor -->
<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>

<script>
$(function() {
	CKEDITOR.replace('editor1');
	var articleCategory = '<c:out value="${categoryOption}" />';
	console.log(articleCategory);
	$('.selection option').val(articleCategory).attr('selected', true);
});

function check(){
	if(confirm("게시물을 수정하시겠습니까?")){
		return true;
	} else return false;
}

</script>


</body>
</html>