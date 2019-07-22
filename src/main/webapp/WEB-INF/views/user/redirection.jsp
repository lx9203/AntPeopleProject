<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Redirection..</title>
	
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="setfiles/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="setfiles/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="setfiles/dist/css/AdminLTE.min.css">
	
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<!-- jquery 하단에 존재. 공통파일 header로 묶을 것.-->
	<%@ include file="../common/header.jsp" %>
</head>
<body class="hold-transition login-page">

<script type="text/javascript">
	var message = '${requestScope.message}';
	var returnUrl = 'login';
	alert(message);
	document.location.href = returnUrl;
</script>

<!-- jQuery 3.3.1 : templet 기본버전-->
<script src="setfiles/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="setfiles/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

</body>
</html>