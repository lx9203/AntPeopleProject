<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Board</title>
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="setfiles/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="setfiles/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="setfiles/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="setfiles/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="setfiles/dist/css/skins/skin-blue.css">

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <!-- DataTables -->
  <link rel="stylesheet" href="setfiles/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  
  <!-- 적용여부 확인. -->
  <style>
	  td, th {
	  	text-overflow: ellipsis;
	  }
  </style>
  
  <%@ include file= "../common/header.jsp" %>
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
        Common - Board(자유게시판)
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${path}/#"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="active">Main</li>
      </ol>
    </section>
<!-- ------------------------------------------------- -->    
   <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
              <button type="button" class="btn btn-info pull-right" onclick="location.href='${path}/#' ">글쓰기</button>
              <hr style="margin-bottom: 0 ; border: 0.5px solid lightgrey">
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="boardTable" class="table table-bordered table-striped">
				<colgroup>
				  <col style="width: 15%">
				  <col style="width: 55%">
				  <col style="width: 15%">
				  <col style="width: 15%">
				</colgroup>
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성날짜</th>
                    <th>작성자</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                  	<td>001</td>
                  	<td><a href="">testpage</a></td>
                  	<td>2019.07.20</td>
                  	<td>으엌이</td>
                  </tr>
                
               	  <c:set var="boardList" value="${requestScope.bbsList}"/>
				  <c:forEach var="board" items="${boardList}">
					<tr>
					  <td style="text-align: center;">${board.bbs_id}</td>
			          <%--Title 클릭 시 해당 글 링크로 넘어감. 서블릿 요청필요.--%>
					  <td style="text-align: center;">
					    <a href="${path}/#">${board.title}</a>
					  </td>
					  <td style="text-align: center;">
					    ${board.updatedAt}"
					  </td>
					  <%-- 날짜를 String으로 받아오는 경우 parseDate --> formatDate로 두번실행.
					  <td style="text-align: center;">
					    <fmt:parseDate value="${notice.noticeDate}" var="dateFmt" pattern="yyyyMMdd"/>
					    <fmt:formatDate value="${dateFmt}" pattern="yy-MM-dd"/>
					  </td> --%>
					  <td style="text-align: center;">${board.user.name}</td>
					</tr>
				  </c:forEach>
				  
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
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

<!-- jQuery 3.3.1 -->
<script src="setfiles/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="setfiles/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="setfiles/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- AdminLTE App : navbar 관련-->
<script src="setfiles/dist/js/adminlte.min.js"></script>

<!-- DataTables -->
	<!-- 상하단 검색기능, 페이지 넘김기능 -->
<script src="setfiles/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<!-- table검색창등 미세설정.. -->
<script src="setfiles/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script>
  $(function () {
    $('#boardTable').DataTable()
  })
</script>

</body>
</html>